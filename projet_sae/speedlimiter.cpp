#include "speedlimiter.h"

SpeedLimiter::SpeedLimiter(QObject *parent)
    : QObject(parent), m_speedLimit(100) // Default speed limit is 100
{
}

int SpeedLimiter::speedLimit() const
{
    return m_speedLimit;
}

void SpeedLimiter::adjustSpeedLimit(const int &delta)
{
    int newSpeedLimit = m_speedLimit + delta;
    setSpeedLimit(newSpeedLimit);
}

void SpeedLimiter::setSpeedLimit(int speedLimit)
{
    if (m_speedLimit == speedLimit)
        return;

    // Ensure the speed limit is within a reasonable range
    if (speedLimit < 0)
        speedLimit = 0;
    else if (speedLimit > 200)
        speedLimit = 200;

    m_speedLimit = speedLimit;
    emit speedLimitChanged(m_speedLimit);
}
