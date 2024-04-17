#include "lua_kuizhi_auto.hpp"
#include "CustomLuaBindins.h"
#include "scripting/lua-bindings/manual/tolua_fix.h"
#include "scripting/lua-bindings/manual/LuaBasicConversions.h"


int lua_pixeGame_cEntity_pustFrameTexture(lua_State *tolua_S) {
    int argc = 0;
    cEntity *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "cEntity", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (cEntity *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_pixeGame_cEntity_pustFrameTexture'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 1) {
        std::string arg0;

        ok &= luaval_to_std_string(tolua_S, 2, &arg0, "cEntity:pustFrameTexture");
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_cEntity_pustFrameTexture'", nullptr);
            return 0;
        }
        bool ret = cobj->pustFrameTexture(arg0);
        tolua_pushboolean(tolua_S, (bool) ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "cEntity:pustFrameTexture", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_cEntity_pustFrameTexture'.", &tolua_err);
#endif

    return 0;
}

int lua_pixeGame_cEntity_constructor(lua_State *tolua_S) {
    int argc = 0;
    cEntity *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


    argc = lua_gettop(tolua_S) - 1;
    if (argc == 0) {
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_cEntity_constructor'", nullptr);
            return 0;
        }
        cobj = new cEntity();
        cobj->autorelease();
        int ID = (int) cobj->_ID;
        int *luaID = &cobj->_luaID;
        toluafix_pushusertype_ccobject(tolua_S, ID, luaID, (void *) cobj, "cEntity");
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "cEntity:cEntity", argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_cEntity_constructor'.", &tolua_err);
#endif

    return 0;
}

static int lua_pixeGame_cEntity_finalize(lua_State *tolua_S) {
    printf("luabindings: finalizing LUA object (cEntity)");
    return 0;
}

int lua_register_pixeGame_cEntity(lua_State *tolua_S) {
    tolua_usertype(tolua_S, "cEntity");
    tolua_cclass(tolua_S, "cEntity", "cEntity", "cc.Sprite", nullptr);

    tolua_beginmodule(tolua_S, "cEntity");
    tolua_function(tolua_S, "new", lua_pixeGame_cEntity_constructor);
    tolua_function(tolua_S, "pustFrameTexture", lua_pixeGame_cEntity_pustFrameTexture);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cEntity).name();
    g_luaType[typeName] = "cEntity";
    g_typeCast["cEntity"] = "cEntity";
    return 1;
}

int lua_pixeGame_cMagic_setStop(lua_State *tolua_S) {
    int argc = 0;
    cMagic *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "cMagic", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (cMagic *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_pixeGame_cMagic_setStop'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 0) {
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_cMagic_setStop'", nullptr);
            return 0;
        }
        cobj->setStop();
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "cMagic:setStop", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_cMagic_setStop'.", &tolua_err);
#endif

    return 0;
}

int lua_pixeGame_cMagic_setDie(lua_State *tolua_S) {
    int argc = 0;
    cMagic *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "cMagic", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (cMagic *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_pixeGame_cMagic_setDie'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 1) {
        bool arg0;

        ok &= luaval_to_boolean(tolua_S, 2, &arg0, "cMagic:setDie");
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_cMagic_setDie'", nullptr);
            return 0;
        }
        cobj->setDie(arg0);
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "cMagic:setDie", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_cMagic_setDie'.", &tolua_err);
#endif

    return 0;
}

int lua_pixeGame_cMagic_setLastFrameCallFunc(lua_State *tolua_S) {
    int argc = 0;
    cMagic *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "cMagic", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (cMagic *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_pixeGame_cMagic_setLastFrameCallFunc'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 1) {
#if COCOS2D_DEBUG >= 1
        if (!toluafix_isfunction(tolua_S, 2, "LUA_FUNCTION", 0, &tolua_err)) {
            goto tolua_lerror;
        }
#endif

        int handler = (toluafix_ref_function(tolua_S, 2, 0));

        cobj->registerLastFrameCallBack(handler);


        //      std::function<void ()> arg0;

        //      do {
        //	// Lambda binding for lua is not supported.
        //	assert(false);
        //} while(0)
        //;
        //      if(!ok)
        //      {
        //          tolua_error(tolua_S,"invalid arguments in function 'lua_pixeGame_cMagic_setLastFrameCallFunc'", nullptr);
        //          return 0;
        //      }
        //      cobj->setLastFrameCallFunc(arg0);
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "cMagic:setLastFrameCallFunc", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_cMagic_setLastFrameCallFunc'.", &tolua_err);
#endif

    return 0;
}

int lua_pixeGame_cMagic_createMagic(lua_State *tolua_S) {
    int argc = 0;
    cMagic *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "cMagic", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (cMagic *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_pixeGame_cMagic_createMagic'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 1) {
        const char *arg0;

        std::string arg0_tmp;
        ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp, "cMagic:createMagic");
        arg0 = arg0_tmp.c_str();
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_cMagic_createMagic'", nullptr);
            return 0;
        }
        cobj->createMagic(arg0);
        lua_settop(tolua_S, 1);
        return 1;
    }
    if (argc == 2) {
        const char *arg0;
        double arg1;

        std::string arg0_tmp;
        ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp, "cMagic:createMagic");
        arg0 = arg0_tmp.c_str();

        ok &= luaval_to_number(tolua_S, 3, &arg1, "cMagic:createMagic");
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_cMagic_createMagic'", nullptr);
            return 0;
        }
        cobj->createMagic(arg0, arg1);
        lua_settop(tolua_S, 1);
        return 1;
    }
    if (argc == 3) {
        const char *arg0;
        double arg1;
        bool arg2;

        std::string arg0_tmp;
        ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp, "cMagic:createMagic");
        arg0 = arg0_tmp.c_str();

        ok &= luaval_to_number(tolua_S, 3, &arg1, "cMagic:createMagic");

        ok &= luaval_to_boolean(tolua_S, 4, &arg2, "cMagic:createMagic");
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_cMagic_createMagic'", nullptr);
            return 0;
        }
        cobj->createMagic(arg0, arg1, arg2);
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "cMagic:createMagic", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_cMagic_createMagic'.", &tolua_err);
#endif

    return 0;
}

int lua_pixeGame_cMagic_isDie(lua_State *tolua_S) {
    int argc = 0;
    cMagic *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "cMagic", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (cMagic *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_pixeGame_cMagic_isDie'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 0) {
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_cMagic_isDie'", nullptr);
            return 0;
        }
        bool ret = cobj->isDie();
        tolua_pushboolean(tolua_S, (bool) ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "cMagic:isDie", argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_cMagic_isDie'.", &tolua_err);
#endif

    return 0;
}

int lua_pixeGame_cMagic_create(lua_State *tolua_S) {
    int argc = 0;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S, 1, "cMagic", 0, &tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 0) {
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_cMagic_create'", nullptr);
            return 0;
        }
        cMagic *ret = cMagic::create();
        object_to_luaval<cMagic>(tolua_S, "cMagic", (cMagic *) ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d\n ", "cMagic:create", argc, 0);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_cMagic_create'.", &tolua_err);
#endif
    return 0;
}

static int lua_pixeGame_cMagic_finalize(lua_State *tolua_S) {
    printf("luabindings: finalizing LUA object (cMagic)");
    return 0;
}

int lua_register_pixeGame_cMagic(lua_State *tolua_S) {
    tolua_usertype(tolua_S, "cMagic");
    tolua_cclass(tolua_S, "cMagic", "cMagic", "cEntity", nullptr);

    tolua_beginmodule(tolua_S, "cMagic");
    tolua_function(tolua_S, "setDie", lua_pixeGame_cMagic_setDie);
    tolua_function(tolua_S, "setStop", lua_pixeGame_cMagic_setStop);

    tolua_function(tolua_S, "setLastFrameCallFunc", lua_pixeGame_cMagic_setLastFrameCallFunc);
    tolua_function(tolua_S, "createMagic", lua_pixeGame_cMagic_createMagic);
    tolua_function(tolua_S, "isDie", lua_pixeGame_cMagic_isDie);
    tolua_function(tolua_S, "create", lua_pixeGame_cMagic_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cMagic).name();
    g_luaType[typeName] = "cMagic";
    g_typeCast["cMagic"] = "cMagic";
    return 1;
}

int lua_pixeGame_ExtMagicManager_onUpdate(lua_State *tolua_S) {
    int argc = 0;
    ExtMagicManager *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "ExtMagicManager", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (ExtMagicManager *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_pixeGame_ExtMagicManager_onUpdate'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 1) {
        double arg0;

        ok &= luaval_to_number(tolua_S, 2, &arg0, "ExtMagicManager:onUpdate");
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_ExtMagicManager_onUpdate'", nullptr);
            return 0;
        }
        cobj->onUpdate(arg0);
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "ExtMagicManager:onUpdate", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_ExtMagicManager_onUpdate'.", &tolua_err);
#endif

    return 0;
}

int lua_pixeGame_ExtMagicManager_creatMagic(lua_State *tolua_S) {
    int argc = 0;
    ExtMagicManager *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "ExtMagicManager", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (ExtMagicManager *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_pixeGame_ExtMagicManager_creatMagic'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 1) {
        const char *arg0;

        std::string arg0_tmp;
        ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp, "ExtMagicManager:creatMagic");
        arg0 = arg0_tmp.c_str();
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_ExtMagicManager_creatMagic'", nullptr);
            return 0;
        }
        cMagic *ret = cobj->creatMagic(arg0);
        object_to_luaval<cMagic>(tolua_S, "cMagic", (cMagic *) ret);
        return 1;
    }
    if (argc == 2) {
        const char *arg0;
        double arg1;

        std::string arg0_tmp;
        ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp, "ExtMagicManager:creatMagic");
        arg0 = arg0_tmp.c_str();

        ok &= luaval_to_number(tolua_S, 3, &arg1, "ExtMagicManager:creatMagic");
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_ExtMagicManager_creatMagic'", nullptr);
            return 0;
        }
        cMagic *ret = cobj->creatMagic(arg0, arg1);
        object_to_luaval<cMagic>(tolua_S, "cMagic", (cMagic *) ret);
        return 1;
    }
    if (argc == 3) {
        const char *arg0;
        double arg1;
        bool arg2;

        std::string arg0_tmp;
        ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp, "ExtMagicManager:creatMagic");
        arg0 = arg0_tmp.c_str();

        ok &= luaval_to_number(tolua_S, 3, &arg1, "ExtMagicManager:creatMagic");

        ok &= luaval_to_boolean(tolua_S, 4, &arg2, "ExtMagicManager:creatMagic");
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_ExtMagicManager_creatMagic'", nullptr);
            return 0;
        }
        cMagic *ret = cobj->creatMagic(arg0, arg1, arg2);
        object_to_luaval<cMagic>(tolua_S, "cMagic", (cMagic *) ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "ExtMagicManager:creatMagic", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_ExtMagicManager_creatMagic'.", &tolua_err);
#endif

    return 0;
}

int lua_pixeGame_ExtMagicManager_instance(lua_State *tolua_S) {
    int argc = 0;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S, 1, "ExtMagicManager", 0, &tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 0) {
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_ExtMagicManager_instance'", nullptr);
            return 0;
        }
        ExtMagicManager *ret = ExtMagicManager::instance();
        object_to_luaval<ExtMagicManager>(tolua_S, "ExtMagicManager", (ExtMagicManager *) ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d\n ", "ExtMagicManager:instance", argc, 0);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_ExtMagicManager_instance'.", &tolua_err);
#endif
    return 0;
}

static int lua_pixeGame_ExtMagicManager_finalize(lua_State *tolua_S) {
    printf("luabindings: finalizing LUA object (ExtMagicManager)");
    return 0;
}

int lua_register_pixeGame_ExtMagicManager(lua_State *tolua_S) {
    tolua_usertype(tolua_S, "ExtMagicManager");
    tolua_cclass(tolua_S, "ExtMagicManager", "ExtMagicManager", "", nullptr);

    tolua_beginmodule(tolua_S, "ExtMagicManager");
    tolua_function(tolua_S, "onUpdate", lua_pixeGame_ExtMagicManager_onUpdate);
    tolua_function(tolua_S, "creatMagic", lua_pixeGame_ExtMagicManager_creatMagic);
    tolua_function(tolua_S, "instance", lua_pixeGame_ExtMagicManager_instance);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(ExtMagicManager).name();
    g_luaType[typeName] = "ExtMagicManager";
    g_typeCast["ExtMagicManager"] = "ExtMagicManager";
    return 1;
}

int lua_kuizhi_ResManage_callback(lua_State *tolua_S) {
    int argc = 0;
    ResManage *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "ResManage", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (ResManage *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_kuizhi_ResManage_callback'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 1) {
        cocos2d::Ref *arg0;

        ok &= luaval_to_object<cocos2d::Ref>(tolua_S, 2, "cc.Ref", &arg0, "ResManage:callback");
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_ResManage_callback'", nullptr);
            return 0;
        }
        cobj->callback(arg0);
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "ResManage:callback", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_kuizhi_ResManage_callback'.", &tolua_err);
#endif

    return 0;
}

int lua_kuizhi_ResManage_loadPlistRes(lua_State *tolua_S) {
    int argc = 0;
    ResManage *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "ResManage", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (ResManage *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_kuizhi_ResManage_loadPlistRes'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 1) {
        std::string arg0;

        ok &= luaval_to_std_string(tolua_S, 2, &arg0, "ResManage:loadPlistRes");
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_ResManage_loadPlistRes'", nullptr);
            return 0;
        }
        cobj->loadPlistRes(arg0);
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "ResManage:loadPlistRes", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_kuizhi_ResManage_loadPlistRes'.", &tolua_err);
#endif

    return 0;
}

int lua_kuizhi_ResManage_loadTextureAsync(lua_State *tolua_S) {
    int argc = 0;
    ResManage *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "ResManage", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (ResManage *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_kuizhi_ResManage_loadTextureAsync'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 1) {
        const char *arg0;

        std::string arg0_tmp;
        ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp, "ResManage:loadTextureAsync");
        arg0 = arg0_tmp.c_str();
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_ResManage_loadTextureAsync'", nullptr);
            return 0;
        }
        cobj->loadTextureAsync(arg0);
        lua_settop(tolua_S, 1);
        return 1;
    }
    if (argc == 2) {
        const char *arg0;
        int arg1;

        std::string arg0_tmp;
        ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp, "ResManage:loadTextureAsync");
        arg0 = arg0_tmp.c_str();

        ok &= luaval_to_int32(tolua_S, 3, (int *) &arg1, "ResManage:loadTextureAsync");
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_ResManage_loadTextureAsync'", nullptr);
            return 0;
        }
        cobj->loadTextureAsync(arg0, arg1);
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "ResManage:loadTextureAsync", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_kuizhi_ResManage_loadTextureAsync'.", &tolua_err);
#endif

    return 0;
}

int lua_kuizhi_ResManage_unLoadPlistRes(lua_State *tolua_S) {
    int argc = 0;
    ResManage *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "ResManage", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (ResManage *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_kuizhi_ResManage_unLoadPlistRes'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 1) {
        std::string arg0;

        ok &= luaval_to_std_string(tolua_S, 2, &arg0, "ResManage:unLoadPlistRes");
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_ResManage_unLoadPlistRes'", nullptr);
            return 0;
        }
        cobj->unLoadPlistRes(arg0);
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "ResManage:unLoadPlistRes", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_kuizhi_ResManage_unLoadPlistRes'.", &tolua_err);
#endif

    return 0;
}

int lua_kuizhi_ResManage_instance(lua_State *tolua_S) {
    int argc = 0;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S, 1, "ResManage", 0, &tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 0) {
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_ResManage_instance'", nullptr);
            return 0;
        }
        ResManage *ret = ResManage::instance();
        object_to_luaval<ResManage>(tolua_S, "ResManage", (ResManage *) ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d\n ", "ResManage:instance", argc, 0);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_kuizhi_ResManage_instance'.", &tolua_err);
#endif
    return 0;
}

static int lua_kuizhi_ResManage_finalize(lua_State *tolua_S) {
    printf("luabindings: finalizing LUA object (ResManage)");
    return 0;
}

int lua_register_kuizhi_ResManage(lua_State *tolua_S) {
    tolua_usertype(tolua_S, "ResManage");
    tolua_cclass(tolua_S, "ResManage", "ResManage", "", nullptr);

    tolua_beginmodule(tolua_S, "ResManage");
    tolua_function(tolua_S, "callback", lua_kuizhi_ResManage_callback);
    tolua_function(tolua_S, "loadPlistRes", lua_kuizhi_ResManage_loadPlistRes);
    tolua_function(tolua_S, "loadTextureAsync", lua_kuizhi_ResManage_loadTextureAsync);
    tolua_function(tolua_S, "unLoadPlistRes", lua_kuizhi_ResManage_unLoadPlistRes);
    tolua_function(tolua_S, "instance", lua_kuizhi_ResManage_instance);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(ResManage).name();
    g_luaType[typeName] = "ResManage";
    g_typeCast["ResManage"] = "ResManage";
    return 1;
}
int lua_kuizhi_IAgoraRoomManager_enableLocalAudio(lua_State* tolua_S)
{
    int argc = 0;
    IAgoraRoomManager* cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "IAgoraRoomManager", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (IAgoraRoomManager*)tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj)
    {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_kuizhi_IAgoraRoomManager_enableLocalAudio'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 1)
    {
        bool arg0;

        ok &= luaval_to_boolean(tolua_S, 2, &arg0, "IAgoraRoomManager:enableLocalAudio");
        if (!ok)
        {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_IAgoraRoomManager_enableLocalAudio'", nullptr);
            return 0;
        }
        int ret = cobj->enableLocalAudio(arg0);
        tolua_pushnumber(tolua_S, (int)ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "IAgoraRoomManager:enableLocalAudio", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_kuizhi_IAgoraRoomManager_enableLocalAudio'.", &tolua_err);
#endif

    return 0;
}
int lua_kuizhi_IAgoraRoomManager_joinRoom(lua_State* tolua_S)
{
    int argc = 0;
    IAgoraRoomManager* cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "IAgoraRoomManager", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (IAgoraRoomManager*)tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj)
    {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_pixeGame_IAgoraRoomManager_joinRoom'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 2)
    {
        const char* arg0;
        const char* arg1;

        std::string arg0_tmp; ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp, "IAgoraRoomManager:joinRoom"); arg0 = arg0_tmp.c_str();

        std::string arg1_tmp; ok &= luaval_to_std_string(tolua_S, 3, &arg1_tmp, "IAgoraRoomManager:joinRoom"); arg1 = arg1_tmp.c_str();
        if (!ok)
        {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_IAgoraRoomManager_joinRoom'", nullptr);
            return 0;
        }
        cobj->joinRoom(arg0, arg1);
        lua_settop(tolua_S, 1);
        return 1;
    }
    if (argc == 3)
    {
        const char* arg0;
        const char* arg1;
        const char* arg2;

        std::string arg0_tmp; ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp, "IAgoraRoomManager:joinRoom"); arg0 = arg0_tmp.c_str();

        std::string arg1_tmp; ok &= luaval_to_std_string(tolua_S, 3, &arg1_tmp, "IAgoraRoomManager:joinRoom"); arg1 = arg1_tmp.c_str();

        std::string arg2_tmp; ok &= luaval_to_std_string(tolua_S, 4, &arg2_tmp, "IAgoraRoomManager:joinRoom"); arg2 = arg2_tmp.c_str();
        if (!ok)
        {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_IAgoraRoomManager_joinRoom'", nullptr);
            return 0;
        }
        cobj->joinRoom(arg0, arg1, arg2);
        lua_settop(tolua_S, 1);
        return 1;
    }
    if (argc == 4)
    {
        const char* arg0;
        const char* arg1;
        const char* arg2;
        int arg3;

        std::string arg0_tmp; ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp, "IAgoraRoomManager:joinRoom"); arg0 = arg0_tmp.c_str();

        std::string arg1_tmp; ok &= luaval_to_std_string(tolua_S, 3, &arg1_tmp, "IAgoraRoomManager:joinRoom"); arg1 = arg1_tmp.c_str();

        std::string arg2_tmp; ok &= luaval_to_std_string(tolua_S, 4, &arg2_tmp, "IAgoraRoomManager:joinRoom"); arg2 = arg2_tmp.c_str();

        ok &= luaval_to_int32(tolua_S, 5, (int*)&arg3, "IAgoraRoomManager:joinRoom");
        if (!ok)
        {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_IAgoraRoomManager_joinRoom'", nullptr);
            return 0;
        }
        cobj->joinRoom(arg0, arg1, arg2, arg3);
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "IAgoraRoomManager:joinRoom", argc, 2);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_IAgoraRoomManager_joinRoom'.", &tolua_err);
#endif

    return 0;
}
int lua_kuizhi_IAgoraRoomManager_initVideo(lua_State* tolua_S)
{
    int argc = 0;
    IAgoraRoomManager* cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "IAgoraRoomManager", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (IAgoraRoomManager*)tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj)
    {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_pixeGame_IAgoraRoomManager_initVideo'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 1)
    {
        const char* arg0;

        std::string arg0_tmp; ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp, "IAgoraRoomManager:initVideo"); arg0 = arg0_tmp.c_str();
        if (!ok)
        {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_IAgoraRoomManager_initVideo'", nullptr);
            return 0;
        }
        cobj->initVideo(arg0);
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "IAgoraRoomManager:initVideo", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_IAgoraRoomManager_initVideo'.", &tolua_err);
#endif

    return 0;
}
int lua_kuizhi_IAgoraRoomManager_leaveRoom(lua_State* tolua_S)
{
    int argc = 0;
    IAgoraRoomManager* cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "IAgoraRoomManager", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (IAgoraRoomManager*)tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj)
    {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_pixeGame_IAgoraRoomManager_leaveRoom'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 0)
    {
        if (!ok)
        {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_IAgoraRoomManager_leaveRoom'", nullptr);
            return 0;
        }
        cobj->leaveRoom();
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "IAgoraRoomManager:leaveRoom", argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_IAgoraRoomManager_leaveRoom'.", &tolua_err);
#endif

    return 0;
}
int lua_kuizhi_IAgoraRoomManager_muteAllRemoteAudioStreams(lua_State* tolua_S)
{
    int argc = 0;
    IAgoraRoomManager* cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "IAgoraRoomManager", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (IAgoraRoomManager*)tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj)
    {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_kuizhi_IAgoraRoomManager_muteAllRemoteAudioStreams'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 1)
    {
        bool arg0;

        ok &= luaval_to_boolean(tolua_S, 2, &arg0, "IAgoraRoomManager:muteAllRemoteAudioStreams");
        if (!ok)
        {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_IAgoraRoomManager_muteAllRemoteAudioStreams'", nullptr);
            return 0;
        }
        int ret = cobj->muteAllRemoteAudioStreams(arg0);
        tolua_pushnumber(tolua_S, (int)ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "IAgoraRoomManager:muteAllRemoteAudioStreams", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_kuizhi_IAgoraRoomManager_muteAllRemoteAudioStreams'.", &tolua_err);
#endif

    return 0;
}
int lua_kuizhi_IAgoraRoomManager_muteRemoteAudioStream(lua_State* tolua_S)
{
    int argc = 0;
    IAgoraRoomManager* cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "IAgoraRoomManager", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (IAgoraRoomManager*)tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj)
    {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_kuizhi_IAgoraRoomManager_muteRemoteAudioStream'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 2)
    {
        int arg0;
        bool arg1;

        ok &= luaval_to_int32(tolua_S, 2, &arg0, "IAgoraRoomManager:muteRemoteAudioStream");
        ok &= luaval_to_boolean(tolua_S, 3, &arg1, "IAgoraRoomManager:muteRemoteAudioStream");
        if (!ok)
        {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_IAgoraRoomManager_muteRemoteAudioStream'", nullptr);
            return 0;
        }
        int ret = cobj->muteRemoteAudioStream(arg0,arg1);
        tolua_pushnumber(tolua_S, (int)ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "IAgoraRoomManager:muteRemoteAudioStream", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_kuizhi_IAgoraRoomManager_muteRemoteAudioStream'.", &tolua_err);
#endif

    return 0;
}

int lua_kuizhi_IAgoraRoomManager_adjustUserPlaybackSignalVolume(lua_State* tolua_S)
{
    int argc = 0;
    IAgoraRoomManager* cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "IAgoraRoomManager", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (IAgoraRoomManager*)tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj)
    {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_kuizhi_IAgoraRoomManager_adjustUserPlaybackSignalVolume'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 2)
    {
        int arg0;
        int arg1;

        ok &= luaval_to_int32(tolua_S, 2, &arg0, "IAgoraRoomManager:adjustUserPlaybackSignalVolume");
        ok &= luaval_to_int32(tolua_S, 3, &arg1, "IAgoraRoomManager:adjustUserPlaybackSignalVolume");
        if (!ok)
        {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_IAgoraRoomManager_adjustUserPlaybackSignalVolume'", nullptr);
            return 0;
        }
        int ret = cobj->adjustUserPlaybackSignalVolume(arg0, arg1);
        tolua_pushnumber(tolua_S, (int)ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "IAgoraRoomManager:adjustUserPlaybackSignalVolume", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_kuizhi_IAgoraRoomManager_adjustUserPlaybackSignalVolume'.", &tolua_err);
#endif

    return 0;
}

int lua_kuizhi_IAgoraRoomManager_instance(lua_State* tolua_S)
{
    int argc = 0;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S, 1, "IAgoraRoomManager", 0, &tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 0)
    {
        if (!ok)
        {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_IAgoraRoomManager_instance'", nullptr);
            return 0;
        }
        IAgoraRoomManager* ret = IAgoraRoomManager::instance();
        object_to_luaval<IAgoraRoomManager>(tolua_S, "IAgoraRoomManager", (IAgoraRoomManager*)ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d\n ", "IAgoraRoomManager:instance", argc, 0);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_IAgoraRoomManager_instance'.", &tolua_err);
#endif
    return 0;
}
static int lua_kuizhi_IAgoraRoomManager_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (IAgoraRoomManager)");
    return 0;
}

int lua_register_kuizhi_IAgoraRoomManager(lua_State* tolua_S)
{
    tolua_usertype(tolua_S, "IAgoraRoomManager");
    tolua_cclass(tolua_S, "IAgoraRoomManager", "IAgoraRoomManager", "", nullptr);

    tolua_beginmodule(tolua_S, "IAgoraRoomManager");
    tolua_function(tolua_S, "enableLocalAudio", lua_kuizhi_IAgoraRoomManager_enableLocalAudio);
    tolua_function(tolua_S, "joinRoom", lua_kuizhi_IAgoraRoomManager_joinRoom);
    tolua_function(tolua_S, "initVideo", lua_kuizhi_IAgoraRoomManager_initVideo);
    tolua_function(tolua_S, "leaveRoom", lua_kuizhi_IAgoraRoomManager_leaveRoom);
    tolua_function(tolua_S, "muteAllRemoteAudioStreams", lua_kuizhi_IAgoraRoomManager_muteAllRemoteAudioStreams);
    tolua_function(tolua_S, "muteRemoteAudioStream", lua_kuizhi_IAgoraRoomManager_muteRemoteAudioStream);
    tolua_function(tolua_S, "adjustUserPlaybackSignalVolume", lua_kuizhi_IAgoraRoomManager_adjustUserPlaybackSignalVolume);
    tolua_function(tolua_S, "instance", lua_kuizhi_IAgoraRoomManager_instance);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(IAgoraRoomManager).name();
    g_luaType[typeName] = "IAgoraRoomManager";
    g_typeCast["IAgoraRoomManager"] = "IAgoraRoomManager";
    return 1;
}

int lua_kuizhi_DeviceManager_copyToClipboard(lua_State *tolua_S) {
    int argc = 0;
    DeviceManager *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "DeviceManager", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (DeviceManager *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_kuizhi_DeviceManager_copyToClipboard'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 1) {
        const char *arg0;

        std::string arg0_tmp;
        ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp, "DeviceManager:copyToClipboard");
        arg0 = arg0_tmp.c_str();
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_DeviceManager_copyToClipboard'", nullptr);
            return 0;
        }
        bool ret = cobj->copyToClipboard(arg0);
        tolua_pushboolean(tolua_S, (bool) ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "DeviceManager:copyToClipboard", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_kuizhi_DeviceManager_copyToClipboard'.", &tolua_err);
#endif

    return 0;
}

int lua_kuizhi_DeviceManager_pasteFromClipboard(lua_State *tolua_S) {
    int argc = 0;
    DeviceManager *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "DeviceManager", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (DeviceManager *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_kuizhi_DeviceManager_pasteFromClipboard'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 0) {
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_DeviceManager_pasteFromClipboard'", nullptr);
            return 0;
        }
        std::string ret = cobj->pasteFromClipboard();
        lua_pushlstring(tolua_S, ret.c_str(), ret.length());
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "DeviceManager:pasteFromClipboard", argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_kuizhi_DeviceManager_pasteFromClipboard'.", &tolua_err);
#endif

    return 0;
}

int lua_kuizhi_DeviceManager_getInstance(lua_State *tolua_S) {
    int argc = 0;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S, 1, "DeviceManager", 0, &tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 0) {
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_DeviceManager_getInstance'", nullptr);
            return 0;
        }
        DeviceManager *ret = DeviceManager::getInstance();
        object_to_luaval<DeviceManager>(tolua_S, "DeviceManager", (DeviceManager *) ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d\n ", "DeviceManager:getInstance", argc, 0);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_kuizhi_DeviceManager_getInstance'.", &tolua_err);
#endif
    return 0;
}

static int lua_kuizhi_DeviceManager_finalize(lua_State *tolua_S) {
    printf("luabindings: finalizing LUA object (DeviceManager)");
    return 0;
}

int lua_register_kuizhi_DeviceManager(lua_State *tolua_S) {
    tolua_usertype(tolua_S, "DeviceManager");
    tolua_cclass(tolua_S, "DeviceManager", "DeviceManager", "", nullptr);

    tolua_beginmodule(tolua_S, "DeviceManager");
    tolua_function(tolua_S, "copyToClipboard", lua_kuizhi_DeviceManager_copyToClipboard);
    tolua_function(tolua_S, "pasteFromClipboard", lua_kuizhi_DeviceManager_pasteFromClipboard);
    tolua_function(tolua_S, "getInstance", lua_kuizhi_DeviceManager_getInstance);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(DeviceManager).name();
    g_luaType[typeName] = "DeviceManager";
    g_typeCast["DeviceManager"] = "DeviceManager";
    return 1;
}

int lua_kuizhi_LayerCustom_appendPlist(lua_State *tolua_S) {
    int argc = 0;
    LayerCustom *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "LayerCustom", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (LayerCustom *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_kuizhi_LayerCustom_appendPlist'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 1) {
        const char *arg0;

        std::string arg0_tmp;
        ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp, "LayerCustom:appendPlist");
        arg0 = arg0_tmp.c_str();
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_LayerCustom_appendPlist'", nullptr);
            return 0;
        }
        cobj->appendPlist(arg0);
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "LayerCustom:appendPlist", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_kuizhi_LayerCustom_appendPlist'.", &tolua_err);
#endif

    return 0;
}

int lua_kuizhi_LayerCustom_initPlistList(lua_State *tolua_S) {
    int argc = 0;
    LayerCustom *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "LayerCustom", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (LayerCustom *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_kuizhi_LayerCustom_initPlistList'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 1) {
        const char *arg0;

        std::string arg0_tmp;
        ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp, "LayerCustom:initPlistList");
        arg0 = arg0_tmp.c_str();
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_LayerCustom_initPlistList'", nullptr);
            return 0;
        }
        cobj->initPlistList(arg0);
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "LayerCustom:initPlistList", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_kuizhi_LayerCustom_initPlistList'.", &tolua_err);
#endif

    return 0;
}

int lua_kuizhi_LayerCustom_create(lua_State *tolua_S) {
    int argc = 0;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S, 1, "LayerCustom", 0, &tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 0) {
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_LayerCustom_create'", nullptr);
            return 0;
        }
        LayerCustom *ret = LayerCustom::create();
        object_to_luaval<LayerCustom>(tolua_S, "LayerCustom", (LayerCustom *) ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d\n ", "LayerCustom:create", argc, 0);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_kuizhi_LayerCustom_create'.", &tolua_err);
#endif
    return 0;
}

int lua_kuizhi_LayerCustom_constructor(lua_State *tolua_S) {
    int argc = 0;
    LayerCustom *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


    argc = lua_gettop(tolua_S) - 1;
    if (argc == 0) {
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_LayerCustom_constructor'", nullptr);
            return 0;
        }
        cobj = new LayerCustom();
        cobj->autorelease();
        int ID = (int) cobj->_ID;
        int *luaID = &cobj->_luaID;
        toluafix_pushusertype_ccobject(tolua_S, ID, luaID, (void *) cobj, "LayerCustom");
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "LayerCustom:LayerCustom", argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_error(tolua_S, "#ferror in function 'lua_kuizhi_LayerCustom_constructor'.", &tolua_err);
#endif

    return 0;
}

static int lua_kuizhi_LayerCustom_finalize(lua_State *tolua_S) {
    printf("luabindings: finalizing LUA object (LayerCustom)");
    return 0;
}

int lua_register_kuizhi_LayerCustom(lua_State *tolua_S) {
    tolua_usertype(tolua_S, "LayerCustom");
    tolua_cclass(tolua_S, "LayerCustom", "LayerCustom", "cc.Layer", nullptr);

    tolua_beginmodule(tolua_S, "LayerCustom");
    tolua_function(tolua_S, "new", lua_kuizhi_LayerCustom_constructor);
    tolua_function(tolua_S, "appendPlist", lua_kuizhi_LayerCustom_appendPlist);
    tolua_function(tolua_S, "initPlistList", lua_kuizhi_LayerCustom_initPlistList);
    tolua_function(tolua_S, "create", lua_kuizhi_LayerCustom_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(LayerCustom).name();
    g_luaType[typeName] = "LayerCustom";
    g_typeCast["LayerCustom"] = "LayerCustom";
    return 1;
}

int lua_kuizhi_MagicAnimation_pustFrameTexture(lua_State *tolua_S) {
    int argc = 0;
    MagicAnimation *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "MagicAnimation", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (MagicAnimation *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_kuizhi_MagicAnimation_pustFrameTexture'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 1) {
        std::string arg0;

        ok &= luaval_to_std_string(tolua_S, 2, &arg0, "MagicAnimation:pustFrameTexture");
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_MagicAnimation_pustFrameTexture'", nullptr);
            return 0;
        }
        bool ret = cobj->pustFrameTexture(arg0);
        tolua_pushboolean(tolua_S, (bool) ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "MagicAnimation:pustFrameTexture", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_kuizhi_MagicAnimation_pustFrameTexture'.", &tolua_err);
#endif

    return 0;
}

int lua_kuizhi_MagicAnimation_createMagic(lua_State *tolua_S) {
    int argc = 0;
    MagicAnimation *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "MagicAnimation", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (MagicAnimation *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_kuizhi_MagicAnimation_createMagic'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 1) {
        const char *arg0;

        std::string arg0_tmp;
        ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp, "MagicAnimation:createMagic");
        arg0 = arg0_tmp.c_str();
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_MagicAnimation_createMagic'", nullptr);
            return 0;
        }
        cobj->createMagic(arg0);
        lua_settop(tolua_S, 1);
        return 1;
    }
    if (argc == 2) {
        const char *arg0;
        double arg1;

        std::string arg0_tmp;
        ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp, "MagicAnimation:createMagic");
        arg0 = arg0_tmp.c_str();

        ok &= luaval_to_number(tolua_S, 3, &arg1, "MagicAnimation:createMagic");
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_MagicAnimation_createMagic'", nullptr);
            return 0;
        }
        cobj->createMagic(arg0, arg1);
        lua_settop(tolua_S, 1);
        return 1;
    }
    if (argc == 3) {
        const char *arg0;
        double arg1;
        bool arg2;

        std::string arg0_tmp;
        ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp, "MagicAnimation:createMagic");
        arg0 = arg0_tmp.c_str();

        ok &= luaval_to_number(tolua_S, 3, &arg1, "MagicAnimation:createMagic");

        ok &= luaval_to_boolean(tolua_S, 4, &arg2, "MagicAnimation:createMagic");
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_MagicAnimation_createMagic'", nullptr);
            return 0;
        }
        cobj->createMagic(arg0, arg1, arg2);
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "MagicAnimation:createMagic", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_kuizhi_MagicAnimation_createMagic'.", &tolua_err);
#endif

    return 0;
}

int lua_kuizhi_MagicAnimation_create(lua_State *tolua_S) {
    int argc = 0;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S, 1, "MagicAnimation", 0, &tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 0) {
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_MagicAnimation_create'", nullptr);
            return 0;
        }
        MagicAnimation *ret = MagicAnimation::create();
        object_to_luaval<MagicAnimation>(tolua_S, "MagicAnimation", (MagicAnimation *) ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d\n ", "MagicAnimation:create", argc, 0);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_kuizhi_MagicAnimation_create'.", &tolua_err);
#endif
    return 0;
}

int lua_kuizhi_MagicAnimation_constructor(lua_State *tolua_S) {
    int argc = 0;
    MagicAnimation *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


    argc = lua_gettop(tolua_S) - 1;
    if (argc == 0) {
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_kuizhi_MagicAnimation_constructor'", nullptr);
            return 0;
        }
        cobj = new MagicAnimation();
        cobj->autorelease();
        int ID = (int) cobj->_ID;
        int *luaID = &cobj->_luaID;
        toluafix_pushusertype_ccobject(tolua_S, ID, luaID, (void *) cobj, "MagicAnimation");
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "MagicAnimation:MagicAnimation", argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_error(tolua_S, "#ferror in function 'lua_kuizhi_MagicAnimation_constructor'.", &tolua_err);
#endif

    return 0;
}

static int lua_kuizhi_MagicAnimation_finalize(lua_State *tolua_S) {
    printf("luabindings: finalizing LUA object (MagicAnimation)");
    return 0;
}

int lua_register_kuizhi_MagicAnimation(lua_State *tolua_S) {
    tolua_usertype(tolua_S, "MagicAnimation");
    tolua_cclass(tolua_S, "MagicAnimation", "MagicAnimation", "cc.Sprite", nullptr);

    tolua_beginmodule(tolua_S, "MagicAnimation");
    tolua_function(tolua_S, "new", lua_kuizhi_MagicAnimation_constructor);
    tolua_function(tolua_S, "pustFrameTexture", lua_kuizhi_MagicAnimation_pustFrameTexture);
    tolua_function(tolua_S, "createMagic", lua_kuizhi_MagicAnimation_createMagic);
    tolua_function(tolua_S, "create", lua_kuizhi_MagicAnimation_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(MagicAnimation).name();
    g_luaType[typeName] = "MagicAnimation";
    g_typeCast["MagicAnimation"] = "MagicAnimation";
    return 1;
}

int lua_pixeGame_ExtCocosEffect_playActionName(lua_State *tolua_S) {
    int argc = 0;
    ExtCocosEffect *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "ExtCocosEffect", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (ExtCocosEffect *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_pixeGame_ExtCocosEffect_playActionName'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    /*if (argc == 0)
    {
        if (!ok)
        {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_ExtCocosEffect_playActionName'", nullptr);
            return 0;
        }
        cobj->play();
        lua_settop(tolua_S, 1);
        return 1;
    }*/
    if (argc == 1) {
        std::string arg0;

        ok &= luaval_to_std_string(tolua_S, 2, &arg0, "ExtCocosEffect:play");
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_ExtCocosEffect_playActionName'", nullptr);
            return 0;
        }
        cobj->play(arg0.c_str());
        lua_settop(tolua_S, 1);
        return 1;
    }
    if (argc == 2) {
        std::string arg0;
        bool arg1;

        ok &= luaval_to_std_string(tolua_S, 2, &arg0, "ExtCocosEffect:play");
        ok &= luaval_to_boolean(tolua_S, 3, &arg1, "ExtCocosEffect:play");
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_ExtCocosEffect_playActionName'", nullptr);
            return 0;
        }

        cobj->play(arg0.c_str(), arg1);
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "ExtCocosEffect:play", argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_ExtCocosEffect_playActionName'.", &tolua_err);
#endif

    return 0;
}

int lua_pixeGame_ExtCocosEffect_play(lua_State *tolua_S) {
    int argc = 0;
    ExtCocosEffect *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "ExtCocosEffect", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (ExtCocosEffect *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_pixeGame_ExtCocosEffect_play'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 0) {
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_ExtCocosEffect_play'", nullptr);
            return 0;
        }
        cobj->play();
        lua_settop(tolua_S, 1);
        return 1;
    }
    if (argc == 1) {
        bool arg0;

        ok &= luaval_to_boolean(tolua_S, 2, &arg0, "ExtCocosEffect:play");
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_ExtCocosEffect_play'", nullptr);
            return 0;
        }
        cobj->play(arg0);
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "ExtCocosEffect:play", argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_ExtCocosEffect_play'.", &tolua_err);
#endif

    return 0;
}

int lua_pixeGame_ExtCocosEffect_loadCsd(lua_State *tolua_S) {
    int argc = 0;
    ExtCocosEffect *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "ExtCocosEffect", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (ExtCocosEffect *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_pixeGame_ExtCocosEffect_loadCsd'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 1) {
        const char *arg0;

        std::string arg0_tmp;
        ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp, "ExtCocosEffect:loadCsd");
        arg0 = arg0_tmp.c_str();
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_ExtCocosEffect_loadCsd'", nullptr);
            return 0;
        }
        bool ret = cobj->loadCsd(arg0);
        tolua_pushboolean(tolua_S, (bool) ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "ExtCocosEffect:loacCsd", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_ExtCocosEffect_loadCsd'.", &tolua_err);
#endif

    return 0;
}

int lua_pixeGame_ExtCocosEffect_setLastFrameCallBack(lua_State *tolua_S) {
    int argc = 0;
    ExtCocosEffect *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "ExtCocosEffect", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (ExtCocosEffect *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_pixeGame_ExtCocosEffect_setLastFrameCallBack'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 1) {
        int handler = (toluafix_ref_function(tolua_S, 2, 0));
        cobj->setLastFrameCallBack(handler);

        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "ExtCocosEffect:setLastFrameCallBack", argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_ExtCocosEffect_setLastFrameCallBack'.", &tolua_err);
#endif

    return 0;
}

int lua_pixeGame_ExtCocosEffect_init(lua_State *tolua_S) {
    int argc = 0;
    ExtCocosEffect *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "ExtCocosEffect", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (ExtCocosEffect *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_pixeGame_ExtCocosEffect_init'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 0) {
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_ExtCocosEffect_init'", nullptr);
            return 0;
        }
        bool ret = cobj->init();
        tolua_pushboolean(tolua_S, (bool) ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "ExtCocosEffect:init", argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_ExtCocosEffect_init'.", &tolua_err);
#endif

    return 0;
}

int lua_pixeGame_ExtCocosEffect_timelineCallback(lua_State *tolua_S) {
    int argc = 0;
    ExtCocosEffect *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S, 1, "ExtCocosEffect", 0, &tolua_err)) goto tolua_lerror;
#endif

    cobj = (ExtCocosEffect *) tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) {
        tolua_error(tolua_S, "invalid 'cobj' in function 'lua_pixeGame_ExtCocosEffect_timelineCallback'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S) - 1;
    if (argc == 0) {
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_ExtCocosEffect_timelineCallback'", nullptr);
            return 0;
        }
        cobj->timelineCallback();
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "ExtCocosEffect:timelineCallback", argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_ExtCocosEffect_timelineCallback'.", &tolua_err);
#endif

    return 0;
}

int lua_pixeGame_ExtCocosEffect_create(lua_State *tolua_S) {
    int argc = 0;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S, 1, "ExtCocosEffect", 0, &tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 0) {
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_ExtCocosEffect_create'", nullptr);
            return 0;
        }
        ExtCocosEffect *ret = ExtCocosEffect::create();
        object_to_luaval<ExtCocosEffect>(tolua_S, "ExtCocosEffect", (ExtCocosEffect *) ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d\n ", "ExtCocosEffect:create", argc, 0);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_ExtCocosEffect_create'.", &tolua_err);
#endif
    return 0;
}

int lua_pixeGame_ExtCocosEffect_constructor(lua_State *tolua_S) {
    int argc = 0;
    ExtCocosEffect *cobj = nullptr;
    bool ok = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


    argc = lua_gettop(tolua_S) - 1;
    if (argc == 0) {
        if (!ok) {
            tolua_error(tolua_S, "invalid arguments in function 'lua_pixeGame_ExtCocosEffect_constructor'", nullptr);
            return 0;
        }
        cobj = new ExtCocosEffect();
        cobj->autorelease();
        int ID = (int) cobj->_ID;
        int *luaID = &cobj->_luaID;
        toluafix_pushusertype_ccobject(tolua_S, ID, luaID, (void *) cobj, "ExtCocosEffect");
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "ExtCocosEffect:ExtCocosEffect", argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_error(tolua_S, "#ferror in function 'lua_pixeGame_ExtCocosEffect_constructor'.", &tolua_err);
#endif

    return 0;
}

static int lua_pixeGame_ExtCocosEffect_finalize(lua_State *tolua_S) {
    printf("luabindings: finalizing LUA object (ExtCocosEffect)");
    return 0;
}

int lua_register_pixeGame_ExtCocosEffect(lua_State *tolua_S) {
    tolua_usertype(tolua_S, "ExtCocosEffect");
    tolua_cclass(tolua_S, "ExtCocosEffect", "ExtCocosEffect", "cc.Node", nullptr);

    tolua_beginmodule(tolua_S, "ExtCocosEffect");
    tolua_function(tolua_S, "new", lua_pixeGame_ExtCocosEffect_constructor);
    tolua_function(tolua_S, "play", lua_pixeGame_ExtCocosEffect_play);
    tolua_function(tolua_S, "playActionName", lua_pixeGame_ExtCocosEffect_playActionName);
    tolua_function(tolua_S, "loadCsd", lua_pixeGame_ExtCocosEffect_loadCsd);
    tolua_function(tolua_S, "setLastFrameCallBack", lua_pixeGame_ExtCocosEffect_setLastFrameCallBack);
    tolua_function(tolua_S, "init", lua_pixeGame_ExtCocosEffect_init);
    tolua_function(tolua_S, "timelineCallback", lua_pixeGame_ExtCocosEffect_timelineCallback);
    tolua_function(tolua_S, "create", lua_pixeGame_ExtCocosEffect_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(ExtCocosEffect).name();
    g_luaType[typeName] = "ExtCocosEffect";
    g_typeCast["ExtCocosEffect"] = "ExtCocosEffect";
    return 1;
}

TOLUA_API int register_all_kuizhi(lua_State *tolua_S) {
    tolua_open(tolua_S);

    tolua_module(tolua_S, "kz", 0);
    tolua_beginmodule(tolua_S, "kz");
    lua_register_pixeGame_cEntity(tolua_S);
    lua_register_pixeGame_ExtMagicManager(tolua_S);
    lua_register_pixeGame_cMagic(tolua_S);
    lua_register_kuizhi_LayerCustom(tolua_S);
    lua_register_kuizhi_DeviceManager(tolua_S);
    lua_register_kuizhi_IAgoraRoomManager(tolua_S);
    lua_register_kuizhi_ResManage(tolua_S);
    
    lua_register_kuizhi_MagicAnimation(tolua_S);

    lua_register_pixeGame_ExtCocosEffect(tolua_S);

    tolua_endmodule(tolua_S);
    return 1;
}

