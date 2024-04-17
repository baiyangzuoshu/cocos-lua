#include "cMagic.h"
#include "ResManage.h"
#include "scripting/lua-bindings/manual/CCLuaEngine.h"
#include "common/Utils.h"

USING_NS_CC;
void cMagic::changeToNextFrame() {
    if (m_stop) {
        return;
    }
    if (_spriteFrameList.size() <= 1) {
        return;
    }
    m_frameIndex++;
    if (m_frameIndex < _spriteFrameList.size()) {
        initWithSpriteFrame(_spriteFrameList.at(m_frameIndex));
    } else {

        if (_lastFrameListener) {
            _lastFrameListener();
        }
        if (!m_isLoop) {
            this->setVisible(false);
            //this->removeFromParent();
            m_isDie = true;
            callActionLuaCallback();

        } else {
            m_frameIndex = 0;
            initWithSpriteFrame(_spriteFrameList.at(m_frameIndex));
        }
    }
}

cMagic::~cMagic() {
    if (m_path.length() > 0) {
        ResManage::instance()->unLoadPlistRes(m_path);
    }

    unregisterLuaActionCallback();
}

void cMagic::registerLastFrameCallBack(int funcid) {
    if (m_ActionEndCallBack != 0) {
        this->unregisterLuaActionCallback();
    }
    m_ActionEndCallBack = funcid;
}

void cMagic::unregisterLuaActionCallback() {
    if (m_ActionEndCallBack != 0) {
        LuaStack *stack = LuaEngine::getInstance()->getLuaStack();
        stack->removeScriptHandler(m_ActionEndCallBack);
        m_ActionEndCallBack = 0;
    }
}

void cMagic::callActionLuaCallback() {
    if (m_ActionEndCallBack != 0) {
        LuaStack *stack = LuaEngine::getInstance()->getLuaStack();
        stack->executeFunctionByHandler(m_ActionEndCallBack, 0);
    }
}

cMagic *cMagic::create() {
    cMagic *magic = new(std::nothrow) cMagic();
    if (magic && magic->init()) {
        magic->autorelease();
        return magic;
    }
    CC_SAFE_DELETE(magic);
    return nullptr;
}

void cMagic::setLastFrameCallFunc(std::function<void()> listener) {
    _lastFrameListener = listener;
}

void cMagic::createMagic(const char *res, float delay, bool isloop) {
    m_setBetweenFrameTime = delay;
    m_isLoop = isloop;
    std::string str = String::createWithFormat("%s", res)->getCString();

    std::string path = str + ".plist";
    ResManage::instance()->loadPlistRes(path);
    m_path = path;
    std::string fullPath = FileUtils::getInstance()->fullPathForFilename(path);
    if (fullPath.empty()) {
        // return if plist file doesn't exist
        CCLOG("cocos2d: cCharacter: can not find %s", path.c_str());
        return;
    }

    ValueMap dict = FileUtils::getInstance()->getValueMapFromFile(fullPath);
    if (dict.find("frames") != dict.end()) {
        ValueMap framesDict = dict["frames"].asValueMap();
        ValueMap::iterator iter = framesDict.begin();
        //for (;iter!=framesDict.end();iter++)
        //{
        //	std::string name = iter->first;
        //	this->pustFrameTexture(name);
        //}
        if (iter != framesDict.end()) {
            std::string name = iter->first;
            std::vector<std::string> strs = s_split(name, "/");
            char *oldstr = const_cast<char *>(strs[strs.size() - 1].c_str());
            const char *cname = name.c_str();

            strReplace(cname, oldstr, "");

            for (int i = 0; i < framesDict.size(); i++) {
                std::string key = String::createWithFormat("%s%04d.png", cname, i + 1)->getCString();
                this->pustFrameTexture(key);

            }


        }
        //for (auto& iter : framesDict)
        //{
        //	//ValueMap& frameDict = iter.second.asValueMap();

        //	std::string name = iter.first;
        //	//CCLOG("��Դ����%s", name.c_str());
        //	this->pustFrameTexture(name);

        //	//_textureList.pushBack(name);

        //}
        if (!_spriteFrameList.empty()) {
            initWithSpriteFrame(_spriteFrameList.at(m_frameIndex));
        }

    }

}
