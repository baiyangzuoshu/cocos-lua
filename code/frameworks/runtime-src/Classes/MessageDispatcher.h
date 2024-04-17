#pragma once

#include "cocos2d.h"

using namespace cocos2d;
using namespace std;

extern "C" {
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
};

class MessageDispatcher {
public:
    static MessageDispatcher *getInstance();

    const char *getLuaVarString(const char *luaFileName, const char *varName);

    const char *getLuaVarOneOfTable(const char *luaFileName, const char *varName, const char *keyName);

    const char *getLuaVarTable(const char *luaFileName, const char *varName);

    const char *callLuaFunction(const char *luaFileName, const char *functionName, int msgType, int nOpcodeType, const char *data, int nSize);

    const char *callLuaFunction(const char *luaFileName, const char *functionName, int nCode, Image *img);

    void callCppFunction(const char *luaFileName);

private:
    static int cppFunction(lua_State *ls);

    static MessageDispatcher *_shared;

    const char *getFileFullPath(const char *fileName);

    ~MessageDispatcher();
};
