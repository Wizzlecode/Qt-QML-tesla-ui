// RightIndicatorManager.h
#ifndef RIGHTINDICATORMANAGER_H
#define RIGHTINDICATORMANAGER_H

#include <QObject>

class RightIndicatorManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool indicatorState READ indicatorState WRITE setIndicatorState NOTIFY indicatorStateChanged FINAL)

public:
    explicit RightIndicatorManager(QObject *parent = nullptr);
    bool indicatorState() const;
    void setIndicatorState(bool newIndicatorState);

signals:
    void indicatorStateChanged();

private:
    bool m_indicatorState;
};

#endif // RIGHTINDICATORMANAGER_H
