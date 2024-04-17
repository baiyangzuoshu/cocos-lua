#pragma once

#include "scripting/lua-bindings/manual/CCLuaEngine.h"
#include "scripting/lua-bindings/manual/tolua_fix.h"
#include "scripting/lua-bindings/manual/LuaBasicConversions.h"

enum LauArgType {
    ARG_TYPE_INT,
    ARG_TYPE_LONG,
    ARG_TYPE_FLOAT,
    ARG_TYPE_DOUBLE,
    ARG_TYPE_BOOL,
    ARG_TYPE_STRING,
};

class LuaSystemCall {
public:
    ~LuaSystemCall();

    static LuaSystemCall *instance();

    int CallLuaFunc(const char *name, float arg1);
    int CallLuaFunc(const char *name, const char* arg1);
    int CallLuaFunc(const char *name, int arg1,bool arg2);

    void luaCallBack(int mCallBack);

    void registAllCFunc(lua_State *L);

    int CallLuaFuncCommon(const char *luaFileName, const char *methodName, const LauArgType *const argsType, unsigned int argsLen, ...);

private:
    LuaSystemCall();

};

extern LuaSystemCall *g_LuaSystemCall;
