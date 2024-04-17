#include "Utils.h"

std::vector<std::string> s_split(std::string str, std::string pattern) {
    std::string::size_type pos;
    std::vector<std::string> result;
    //��չ�ַ����Է������
    str += pattern;

    int size = str.size();
    for (int i = 0; i < size; i++) {
        pos = str.find(pattern, i);
        if (pos < size) {
            std::string s = str.substr(i, pos - i);
            result.push_back(s);
            i = pos + pattern.size() - 1;
        }
    }
    return result;
}

char *strReplace(const char *str, char *oldstr, char *newstr) {
    char *beg = strFind(str, oldstr);
    if (!beg)
        return const_cast<char *>(str);
    int lenStr = strlen(str);
    int lenOldstr = strlen(oldstr);
    int lenNewstr = strlen(newstr);
    memmove(beg + lenNewstr, beg + lenOldstr, lenStr - (beg - str) - lenOldstr + 1);
    memcpy(beg, newstr, lenNewstr);
    return const_cast<char *>(str);
}

char *strFind(const char *str, char *sub) {
    char *psub = sub;
    char *pstr = const_cast<char *>(str);
    while (*str) {
        psub = sub;
        pstr = const_cast<char *>(str);
        while (*str == *psub && *psub) {
            ++str;
            ++psub;
        }
        if (!*psub)
            return pstr;
        else
            str = pstr + 1;

    }
    return NULL;
}