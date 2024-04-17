#include "LayerCustom.h"

#include "common/Utils.h"
#include "common/ResManage.h"

LayerCustom::LayerCustom() {
}

LayerCustom::~LayerCustom() {
    for (const auto &path: mPlistList) {
        ResManage::instance()->unLoadPlistRes(path);
    }
    mPlistList.clear();
}

LayerCustom *LayerCustom::create() {
    LayerCustom *ret = new(std::nothrow) LayerCustom();
    if (ret && ret->init()) {
        ret->autorelease();
        return ret;
    } else {
        CC_SAFE_DELETE(ret);
        return nullptr;
    }
}

void LayerCustom::initPlistList(const char *plistList) {
    for (std::string &path: s_split(plistList, "|")) {
        appendPlist(path.c_str());
    }
}

void LayerCustom::appendPlist(const char *path) {
    if (!mPlistList.count(path)) {
        ResManage::instance()->loadPlistRes(path);
        mPlistList.insert(path);
    }
}
