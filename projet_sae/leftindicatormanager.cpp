// LeftIndicatorManager.cpp
#include "Leftindicatormanager.h"

LeftIndicatorManager::LeftIndicatorManager(QObject *parent)
    : QObject(parent),
    m_indicatorState(false) {}

bool LeftIndicatorManager::indicatorState() const
{
    return m_indicatorState;
}

void LeftIndicatorManager::setIndicatorState(bool newIndicatorState)
{
    if (m_indicatorState == newIndicatorState)
        return;
    m_indicatorState = newIndicatorState;
    emit indicatorStateChanged();
}
