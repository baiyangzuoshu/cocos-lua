#include "ExtCocosEffect.h"
#include "cocostudio/ActionTimeline/CSLoader.h"
#include "ResManage.h"
#include "scripting/lua-bindings/manual/CCLuaStack.h"
#include "scripting/lua-bindings/manual/CCLuaEngine.h"

USING_NS_CC;
USING_NS_TIMELINE;

ExtCocosEffect *ExtCocosEffect::create() {
    ExtCocosEffect *cocosEffect = new(std::nothrow) ExtCocosEffect();
    if (cocosEffect && cocosEffect->init()) {
        cocosEffect->autorelease();
        return cocosEffect;
    }
    CC_SAFE_DELETE(cocosEffect);
    return nullptr;
}

bool ExtCocosEffect::init() {
    this->setCascadeOpacityEnabled(true);

    return true;
}

void ExtCocosEffect::setLastFrameCallBack(int id) {
    m_callbackId = id;
}

bool ExtCocosEffect::loadCsd(const char *res) {
    cocos2d::Node *m_bgNode = CSLoader::createNode(cocos2d::String::createWithFormat("cocosAnimation/%s.csb", res)->getCString());

    if (m_bgNode) {
        m_bgNode->setCascadeOpacityEnabled(true);
        auto plists = CSLoader::getInstance()->getAllLoadPlist();
        for (int i = 0; i < plists.size(); i++) {
            m_allPlists.push_back(plists[i]);
        }
        this->addChild(m_bgNode);

        m_timeline = CSLoader::createTimeline(cocos2d::String::createWithFormat("cocosAnimation/%s.csb", res)->getCString());
        m_timeline->gotoFrameAndPause(0);
        m_bgNode->runAction(m_timeline);

        return true;
    }

    return false;
}

void ExtCocosEffect::play(bool isloop/*=false*/) {
    if (m_timeline) {
        m_timeline->gotoFrameAndPlay(0, isloop);
        if (!isloop) {
            m_timeline->setLastFrameCallFunc([=]() {
                this->timelineCallback();
            });


        }
    }
}

void ExtCocosEffect::play(const char *actionName, bool isloop) {
    if (m_timeline) {
        m_timeline->play(actionName, isloop);
        if (!isloop) {
            m_timeline->setLastFrameCallFunc([=]() {
                this->timelineCallback();
            });


        }
    }
}

void ExtCocosEffect::timelineCallback() {
    if (m_callbackId != 0) {
        //�ص�lua
        LuaStack *stack = LuaEngine::getInstance()->getLuaStack();
        stack->executeFunctionByHandler(m_callbackId, 0);

        stack->removeScriptHandler(m_callbackId);
        m_callbackId = 0;
    }
}

void ExtCocosEffect::removeFromParant() {
    this->removeFromParant();
}

ExtCocosEffect::ExtCocosEffect() :
        m_callbackId(0) {

}

ExtCocosEffect::~ExtCocosEffect() {
    for (int i = 0; i < m_allPlists.size(); i++) {
        ResManage::instance()->unLoadPlistRes(m_allPlists[i]);
    }

    if (m_callbackId != 0) {
        //�������ǰ�����Ļص�
        LuaStack *stack = LuaEngine::getInstance()->getLuaStack();
        stack->removeScriptHandler(m_callbackId);
        m_callbackId = 0;
    }
}

