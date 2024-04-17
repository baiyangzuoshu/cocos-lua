#include "LuaSystemCall.h"
#include "cocos2d.h"

USING_NS_CC;

LuaSystemCall::~LuaSystemCall() {

}

LuaSystemCall *LuaSystemCall::instance() {
    static LuaSystemCall _LuaSystemCall;
    return &_LuaSystemCall;
}

int LuaSystemCall::CallLuaFunc(const char *name, float arg1) {
    auto engine = LuaEngine::getInstance();
    lua_State *L = engine->getLuaStack()->getLuaState();
    lua_getglobal(L, name);
    if (!lua_isfunction(L, -1)) {
        CCLOG("[ERROR] %s should be a function! Please define as a global function in lua",name);
        lua_pop(L, 1);
        return 0;
    }

    lua_pushnumber(L, arg1);
    int numArgs = 1; //arg number
    int num = engine->getLuaStack()->executeFunction(numArgs);
    return 1;
}
int LuaSystemCall::CallLuaFunc(const char *name, const char* arg1){
    auto engine = LuaEngine::getInstance();
    lua_State *L = engine->getLuaStack()->getLuaState();
    lua_getglobal(L, name);
    if (!lua_isfunction(L, -1)) {
        CCLOG("[ERROR] %s should be a function! Please define as a global function in lua",name);
        lua_pop(L, 1);
        return 0;
    }

    lua_pushstring(L, arg1);
    int numArgs = 1; //arg number
    int num = engine->getLuaStack()->executeFunction(numArgs);
    return 1;
}
int LuaSystemCall::CallLuaFunc(const char *name, int arg1,bool arg2){
    auto engine = LuaEngine::getInstance();
    lua_State *L = engine->getLuaStack()->getLuaState();
    lua_getglobal(L, name);
    if (!lua_isfunction(L, -1)) {
        CCLOG("[ERROR] %s should be a function! Please define as a global function in lua",name);
        lua_pop(L, 1);
        return 0;
    }

    lua_pushnumber(L, arg1);
    lua_pushboolean(L, arg2);
    int numArgs = 2; //arg number
    int num = engine->getLuaStack()->executeFunction(numArgs);
    return 1;
}

int LuaSystemCall::CallLuaFuncCommon(const char *luaFileName, const char *methodName, const LauArgType *const argsType, unsigned int argsLen, ...) {
    auto engine = LuaEngine::getInstance();
    lua_State *L = engine->getLuaStack()->getLuaState();

    if (luaFileName != nullptr) {
        int isOpen = luaL_loadstring(L, FileUtils::getInstance()->getStringFromFile(luaFileName).c_str());
        if (isOpen != 0) {
            CCLOG("Open Lua Error: %d", isOpen);
            return 0;
        }
    }

    lua_getglobal(L, methodName);
    if (!lua_isfunction(L, -1)) {
        CCLOG("[ERROR] helloLua should be a function! Please define as a global function in lua");
        lua_pop(L, 1);
        return 0;
    }
    if (argsLen > 0) {

        va_list args;
        va_start(args, argsLen);

        auto n = argsLen;
        unsigned int index = 0;
        while (n--) {
            LauArgType lt = argsType[index++];

            switch (lt) {
                case ARG_TYPE_INT: {
                    lua_pushnumber(L, va_arg(args, int));
                    break;
                }
                case ARG_TYPE_LONG: {
                    lua_pushnumber(L, va_arg(args, long));
                    break;
                }
                case ARG_TYPE_FLOAT: {
                    lua_pushnumber(L, va_arg(args, float));
                    break;
                }
                case ARG_TYPE_DOUBLE: {
                    lua_pushnumber(L, va_arg(args, double));
                    break;
                }
                case ARG_TYPE_BOOL: {
                    lua_pushboolean(L, va_arg(args, bool));
                    break;
                }
                case ARG_TYPE_STRING: {
                    const char *value = va_arg(args, const char*);
                    lua_pushlstring(L, value, strlen(value));
                    break;
                }
            }
            /*
            switch (lt) {
            case ARG_TYPE_INT: {
                CCLOG("ARG_TYPE_INT %d", va_arg(args, int));
                break;
            }
            case ARG_TYPE_LONG: {
                CCLOG("ARG_TYPE_INT %d", va_arg(args, long));
                break;
            }
            case ARG_TYPE_FLOAT: {
                CCLOG("ARG_TYPE_INT %f", va_arg(args, float));
                break;
            }
            case ARG_TYPE_DOUBLE: {
                CCLOG("ARG_TYPE_INT %f", va_arg(args, double));
                break;
            }
            case ARG_TYPE_BOOL: {
                CCLOG("ARG_TYPE_INT %d", va_arg(args, bool));
                break;
            }
            case ARG_TYPE_STRING: {
                const char* value = va_arg(args, const char*);
                CCLOG("ARG_TYPE_STRING %s", value);
                break;
            }
            }
            */
        }
        va_end(args);
    }
    int num = engine->getLuaStack()->executeFunction(argsLen);
    return 1;
}

void LuaSystemCall::luaCallBack(int mCallBack) {
    if (mCallBack) {
        auto engine = LuaEngine::getInstance();
        LuaStack *L = engine->getLuaStack();

        //��һ�������Ǻ���������������ڶ��������Ǻ�����������
        L->executeFunctionByHandler(mCallBack, 0);
        L->clean();

        CCLOG("call lua function..");
    }
}

void LuaSystemCall::registAllCFunc(lua_State *L) {
}

LuaSystemCall::LuaSystemCall() {

}

LuaSystemCall *g_LuaSystemCall = LuaSystemCall::instance();
