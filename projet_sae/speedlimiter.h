#ifndef SPEEDLIMITER_H
#define SPEEDLIMITER_H

#include <QObject>

class SpeedLimiter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int speedLimit READ speedLimit WRITE setSpeedLimit NOTIFY speedLimitChanged)

public:
    explicit SpeedLimiter(QObject *parent = nullptr);

    int speedLimit() const;
    Q_INVOKABLE void adjustSpeedLimit(const int &delta);

signals:
    void speedLimitChanged(int speedLimit);

public slots:
    void setSpeedLimit(int speedLimit);

private:
    int m_speedLimit;
};

#endif // SPEEDLIMITER_H
