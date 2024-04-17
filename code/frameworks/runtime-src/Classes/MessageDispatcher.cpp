#include "MessageDispatcher.h"
#include "scripting/lua-bindings/manual/CCLuaEngine.h"

MessageDispatcher *MessageDispatcher::_shared = nullptr;

MessageDispatcher *MessageDispatcher::getInstance() {
    if (!_shared) {
        _shared = new MessageDispatcher();
    }
    return _shared;
}

const char *MessageDispatcher::getLuaVarString(const char *luaFileName, const char *varName) {

    lua_State *ls = LuaEngine::getInstance()->getLuaStack()->getLuaState();

    int isOpen = luaL_dofile(ls, getFileFullPath(luaFileName));
    if (isOpen != 0) {
        CCLOG("Open Lua Error: %i", isOpen);
        return nullptr;
    }

    lua_settop(ls, 0);
    lua_getglobal(ls, varName);

    int statesCode = lua_isstring(ls, 1);
    if (statesCode != 1) {
        CCLOG("Open Lua Error: %i", statesCode);
        return nullptr;
    }

    const char *str = lua_tostring(ls, 1);
    lua_pop(ls, 1);

    return str;
}

const char *MessageDispatcher::getLuaVarOneOfTable(const char *luaFileName, const char *varName, const char *keyName) {

    lua_State *ls = LuaEngine::getInstance()->getLuaStack()->getLuaState();

    int isOpen = luaL_dofile(ls, getFileFullPath(luaFileName));
    if (isOpen != 0) {
        CCLOG("Open Lua Error: %i", isOpen);
        return nullptr;
    }

    lua_getglobal(ls, varName);

    int statesCode = lua_istable(ls, -1);
    if (statesCode != 1) {
        CCLOG("Open Lua Error: %i", statesCode);
        return nullptr;
    }

    lua_pushstring(ls, keyName);
    lua_gettable(ls, -2);
    const char *valueString = lua_tostring(ls, -1);

    lua_pop(ls, -1);

    return valueString;
}

const char *MessageDispatcher::getLuaVarTable(const char *luaFileName, const char *varName) {
    lua_State *ls = LuaEngine::getInstance()->getLuaStack()->getLuaState();

    int isOpen = luaL_dofile(ls, getFileFullPath(luaFileName));
    if (isOpen != 0) {
        CCLOG("Open Lua Error: %i", isOpen);
        return nullptr;
    }

    lua_getglobal(ls, varName);

    int it = lua_gettop(ls);
    lua_pushnil(ls);

    string result = "";

    while (lua_next(ls, it)) {
        string key = lua_tostring(ls, -2);
        string value = lua_tostring(ls, -1);

        result = result + key + ":" + value + "\t";
        lua_pop(ls, 1);
    }
    lua_pop(ls, 1);
    return result.c_str();
}

const char *MessageDispatcher::callLuaFunction(const char *luaFileName, const char *functionName, int nCode, Image *img) {
    lua_State *ls = LuaEngine::getInstance()->getLuaStack()->getLuaState();

    int isOpen = luaL_loadstring(ls, FileUtils::getInstance()->getStringFromFile(luaFileName).c_str());
    if (isOpen != 0) {
        CCLOG("Open Lua Error: %i", isOpen);
        return nullptr;
    }

    lua_getglobal(ls, functionName);

    lua_pushlightuserdata(ls, img);
    lua_pushnumber(ls, nCode);

    /*
    lua_call
     第一个参数:函数的参数个数
      第二个参数:函数返回值个数
       */
    lua_call(ls, 2, 0);

    //const char* iResult = lua_tostring(ls, -1);

    return "";
}

const char *MessageDispatcher::callLuaFunction(const char *luaFileName, const char *functionName, int msgType, int nOpcodeType, const char *data, int nSize) {
    lua_State *ls = LuaEngine::getInstance()->getLuaStack()->getLuaState();

    int isOpen = luaL_loadstring(ls, FileUtils::getInstance()->getStringFromFile(luaFileName).c_str());
    if (isOpen != 0) {
        CCLOG("Open Lua Error: %i", isOpen);
        return nullptr;
    }

    lua_getglobal(ls, functionName);

    lua_pushnumber(ls, msgType);
    lua_pushnumber(ls, nOpcodeType);
    //lua_pushstring(ls,data);
    lua_pushlstring(ls, data, nSize);

    lua_pushnumber(ls, nSize);
    //lua_pushboolean(ls, true);

    /*
    lua_call
     第一个参数:函数的参数个数
      第二个参数:函数返回值个数
       */
    lua_call(ls, 4, 0);

    //const char* iResult = lua_tostring(ls, -1);

    return "";
}

void MessageDispatcher::callCppFunction(const char *luaFileName) {

    lua_State *ls = LuaEngine::getInstance()->getLuaStack()->getLuaState();

    /*
    Lua调用的C++的函数必须是静态的
     */
    lua_register(ls, "cppFunction", cppFunction);

    int isOpen = luaL_dofile(ls, getFileFullPath(luaFileName));
    if (isOpen != 0) {
        CCLOG("Open Lua Error: %i", isOpen);
        return;
    }
}

int MessageDispatcher::cppFunction(lua_State *ls) {
    //int luaNum = (int)lua_tonumber(ls, 1);
    //int luaStr = (int)lua_tostring(ls, 2);
    //CCLOG("Lua调用cpp函数时传来的两个参数： %i %s",luaNum,luaStr);
    //CCLOG("Lua invoke cpp function params: %i %s",luaNum,luaStr);
    /*
    返给Lua的值
    */
    lua_pushnumber(ls, 321);
    lua_pushstring(ls, "Himi");

    /*
    返给Lua值个数
    */
    return 2;
}

const char *MessageDispatcher::getFileFullPath(const char *fileName) {
    return FileUtils::getInstance()->fullPathForFilename(fileName).c_str();
}

MessageDispatcher::~MessageDispatcher() {
    CC_SAFE_DELETE(_shared);
    _shared = nullptr;
}
