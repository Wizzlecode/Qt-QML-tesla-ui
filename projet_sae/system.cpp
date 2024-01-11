#include "system.h"
#include <QDateTime>

System::System(QObject *parent)
    : QObject(parent),
    m_carLocked(true),
    m_outdoorTemp(21),
    m_userName("Antoine.F"),
    m_speed(85),
    m_batteryLevel(20),
    m_musicDisplay(false),
    m_handbrake(false),
    m_heat(false),
    m_light(false),
    m_windshield(false)
{
    m_currentTimeTimer = new QTimer(this);
    m_currentTimeTimer->setInterval(500);
    m_currentTimeTimer->setSingleShot(true);
    connect(m_currentTimeTimer, &QTimer::timeout, this, &System::currentTimeTimerTimeout);

    currentTimeTimerTimeout();
}

bool System::carLocked() const
{
    return m_carLocked;
}

void System::setCarLocked(bool newCarLocked)
{
    if (m_carLocked == newCarLocked)
        return;
    m_carLocked = newCarLocked;
    emit carLockedChanged();
}

int System::outdoorTemp() const
{
    return m_outdoorTemp;
}

void System::setOutdoorTemp(int newOutdoorTemp)
{
    if (m_outdoorTemp == newOutdoorTemp)
        return;
    m_outdoorTemp = newOutdoorTemp;
    emit outdoorTempChanged();
}

QString System::userName() const
{
    return m_userName;
}

void System::setUserName(const QString &newUserName)
{
    if (m_userName == newUserName)
        return;
    m_userName = newUserName;
    emit userNameChanged();
}

void System::currentTimeTimerTimeout()
{
    QDateTime dateTime;
    QString currentTime = dateTime.currentDateTime().toString("hh:mm");

    setCurrentTime(currentTime);
    m_currentTimeTimer->start();
}

QString System::currentTime() const
{
    return m_currentTime;
}

void System::setCurrentTime(QString currentTime)
{
    if (m_currentTime == currentTime)
        return;

    m_currentTime = currentTime;
    emit currentTimeChanged(m_currentTime);
}

int System::speed() const
{
    return m_speed;
}

void System::setSpeed(int newSpeed)
{
    if (m_speed == newSpeed)
        return;
    m_speed = newSpeed;
    emit speedChanged();
}

int System::batteryLevel() const
{
    return m_batteryLevel;
}

void System::setBatteryLevel(int newBatteryLevel)
{
    if (m_batteryLevel == newBatteryLevel)
        return;
    m_batteryLevel = newBatteryLevel;
    emit batteryLevelChanged();
}

bool System::musicDisplay() const
{
    return m_musicDisplay;
}

void System::setMusicDisplay(bool newMusicDisplay)
{
    if (m_musicDisplay == newMusicDisplay)
        return;
    m_musicDisplay = newMusicDisplay;
    emit musicDisplayChanged();
}

bool System::handbrake() const
{
    return m_handbrake;
}

void System::setHandbrake(bool newHandbrake)
{
    if (m_handbrake == newHandbrake)
        return;
    m_handbrake = newHandbrake;
    emit handbrakeChanged();
}

bool System::heat() const
{
    return m_heat;
}

void System::setHeat(bool newHeat)
{
    if (m_heat == newHeat)
        return;
    m_heat = newHeat;
    emit heatChanged();
}

bool System::light() const
{
    return m_light;
}

void System::setLight(bool newLight)
{
    if (m_light == newLight)
        return;
    m_light = newLight;
    emit lightChanged();
}

bool System::windshield() const
{
    return m_windshield;
}

void System::setWindshield(bool newWindshield)
{
    if (m_windshield == newWindshield)
        return;
    m_windshield = newWindshield;
    emit windshieldChanged();
}
