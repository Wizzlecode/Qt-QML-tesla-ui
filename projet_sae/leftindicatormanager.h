// LeftIndicatorManager.h
#ifndef LeftINDICATORMANAGER_H
#define LeftINDICATORMANAGER_H

#include <QObject>

class LeftIndicatorManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool indicatorState READ indicatorState WRITE setIndicatorState NOTIFY indicatorStateChanged FINAL)

public:
    explicit LeftIndicatorManager(QObject *parent = nullptr);
    bool indicatorState() const;
    void setIndicatorState(bool newIndicatorState);

signals:
    void indicatorStateChanged();

private:
    bool m_indicatorState;
};

#endif // LeftINDICATORMANAGER_H
