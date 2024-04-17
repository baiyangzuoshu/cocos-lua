#include "ExtMagicManager.h"

ExtMagicManager *ExtMagicManager::instance() {
    static ExtMagicManager _ExtMagicManager;
    return &_ExtMagicManager;
}


cMagic *ExtMagicManager::creatMagic(const char *res, float delay, bool isloop) {
    cMagic *_magic = cMagic::create();
    if (_magic) {
        _magic->createMagic(res, delay, isloop);
        _magics.pushBack(_magic);
        return _magic;
    }
}

void ExtMagicManager::onUpdate(float dt) {

    for (int i = 0; i < _magics.size(); i++) {
        if (_magics.at(i)->isDie()) {

            _magics.at(i)->removeFromParent();
            _magics.erase(i);
        }
    }
}

ExtMagicManager::~ExtMagicManager() {
}

ExtMagicManager::ExtMagicManager() {

}
