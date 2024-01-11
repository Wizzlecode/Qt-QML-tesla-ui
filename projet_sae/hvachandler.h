#ifndef HVACHANDLER_H
#define HVACHANDLER_H

#include <QObject>

class HVAChandler : public QObject
{
    Q_OBJECT
    // Propriété QML définissant la température cible
    Q_PROPERTY(int targetTemperature READ targetTemperature WRITE setTargetTemperature NOTIFY targetTemperatureChanged)

public:
    explicit HVAChandler(QObject *parent = nullptr);

    // Méthode pour récupérer la température cible
    int targetTemperature() const;

    // Méthode Q_INVOKABLE permettant d'incrémenter la température cible
    Q_INVOKABLE void incrementTargetTemperature(const int &val);

public slots:
    // Slot pour définir la température cible
    void setTargetTemperature(int targetTemperature);

signals:
    // Signal émis lorsqu'il y a un changement dans la température cible
    void targetTemperatureChanged(int targetTemperature);

private:
    // Variable interne représentant la température cible
    int m_targetTemperature;
};

#endif // HVACHANDLER_H

