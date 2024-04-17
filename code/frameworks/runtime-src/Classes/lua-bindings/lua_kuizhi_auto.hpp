#include "base/ccConfig.h"

#ifndef __kuizhi_h__
#define __kuizhi_h__

#ifdef __cplusplus
extern "C" {
#endif
#include "tolua++.h"
#ifdef __cplusplus
}
#endif

int register_all_kuizhi(lua_State *tolua_S);

#endif // __kuizhi_h__
