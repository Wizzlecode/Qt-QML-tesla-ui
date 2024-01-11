#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>
#include <QTimer>

class System : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool carLocked READ carLocked WRITE setCarLocked NOTIFY carLockedChanged FINAL)
    Q_PROPERTY(int outdoorTemp READ outdoorTemp WRITE setOutdoorTemp NOTIFY outdoorTempChanged FINAL)
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged FINAL)
    Q_PROPERTY(QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged FINAL)
    Q_PROPERTY(int speed READ speed WRITE setSpeed NOTIFY speedChanged FINAL)
    Q_PROPERTY(int batteryLevel READ batteryLevel WRITE setBatteryLevel NOTIFY batteryLevelChanged FINAL)
    Q_PROPERTY(bool musicDisplay READ musicDisplay WRITE setMusicDisplay NOTIFY musicDisplayChanged FINAL)
    Q_PROPERTY(bool handbrake READ handbrake WRITE setHandbrake NOTIFY handbrakeChanged FINAL)
    Q_PROPERTY(bool heat READ heat WRITE setHeat NOTIFY heatChanged FINAL)
    Q_PROPERTY(bool light READ light WRITE setLight NOTIFY lightChanged FINAL)
    Q_PROPERTY(bool windshield READ windshield WRITE setWindshield NOTIFY windshieldChanged FINAL)

public:
    explicit System(QObject *parent = nullptr);

    bool carLocked() const;

    int outdoorTemp() const;
    void setOutdoorTemp(int newOutdoorTemp);

    QString userName() const;
    void setUserName(const QString &newUserName);

    QString currentTime() const;

    int speed() const;

    int batteryLevel() const;
    void setBatteryLevel(int newBatteryLevel);

    bool musicDisplay() const;

    bool handbrake() const;
    bool heat() const;

    bool light() const;

    bool windshield() const;

public slots:
    void setCurrentTime(QString currentTime);
    void currentTimeTimerTimeout();
    void setCarLocked(bool newCarLocked);
    void setSpeed(int newSpeed);
    void setMusicDisplay(bool newMusicDisplay);
    void setHandbrake(bool newHandbrake);
    void setHeat(bool newHeat);
    void setLight(bool newLight);
    void setWindshield(bool newWindshield);

signals:
    void carLockedChanged();
    void outdoorTempChanged();
    void userNameChanged();
    void currentTimeChanged(QString currentTime);
    void speedChanged();
    void batteryLevelChanged();
    void musicDisplayChanged();
    void handbrakeChanged();
    void heatChanged();
    void lightChanged();
    void windshieldChanged();

private:
    bool m_carLocked;
    int m_outdoorTemp;
    QString m_userName;
    QString m_currentTime;
    QTimer *m_currentTimeTimer;
    int m_speed;
    int m_batteryLevel;
    bool m_musicDisplay;
    bool m_handbrake;
    bool m_heat;
    bool m_light;
    bool m_windshield;
};

#endif // SYSTEM_H
