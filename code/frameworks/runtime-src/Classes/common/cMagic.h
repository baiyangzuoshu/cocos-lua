#ifndef __CMAGIC_H__
#define __CMAGIC_H__

#include "cEntity.h"

class cMagic : public cEntity {
public:

    static cMagic *create();

    void setLastFrameCallFunc(std::function<void()> listener);

    void createMagic(const char *res, float delay = 0.1, bool isloop = false);

    ~cMagic();

    inline bool isDie() {
        return m_isDie;
    };

    inline void setDie(bool isdie) {
        m_isDie = isdie;
    };

    inline void setStop() {
        m_stop = true;
    };

    void registerLastFrameCallBack(int funcid);

    void unregisterLuaActionCallback();

    void callActionLuaCallback();

private:


protected:
    void changeToNextFrame();

private:
    std::function<void()> _lastFrameListener;

    bool m_isLoop = false;

    bool m_isDie = false;

    bool m_stop = false;

    int m_ActionEndCallBack = 0;

    std::string m_path;

};

#endif
