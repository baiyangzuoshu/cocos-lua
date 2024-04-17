#ifndef __UTILES_H__
#define __UTILES_H__

#include <iostream>
#include <string>
#include <vector>

std::vector<std::string> s_split(std::string str, std::string pattern);

char *strReplace(const char *str, char *oldstr, char *newstr);

char *strFind(const char *str, char *sub);


#endif