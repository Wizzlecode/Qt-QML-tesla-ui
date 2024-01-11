// RightIndicatorManager.cpp
#include "rightindicatormanager.h"

RightIndicatorManager::RightIndicatorManager(QObject *parent)
    : QObject(parent),
    m_indicatorState(false) {}

bool RightIndicatorManager::indicatorState() const
{
    return m_indicatorState;
}

void RightIndicatorManager::setIndicatorState(bool newIndicatorState)
{
    if (m_indicatorState == newIndicatorState)
        return;
    m_indicatorState = newIndicatorState;
    emit indicatorStateChanged();
}
