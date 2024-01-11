#include "hvachandler.h"

HVAChandler::HVAChandler(QObject *parent)
    : QObject(parent)
    , m_targetTemperature(25)
{

}

int HVAChandler::targetTemperature() const
{
    return m_targetTemperature;
}

void HVAChandler::incrementTargetTemperature(const int &val)
{
    // Calcul de la nouvelle température cible
    int newTargetTemp = m_targetTemperature + val;
    // Appel de la méthode pour définir la température cible
    setTargetTemperature(newTargetTemp);
}

void HVAChandler::setTargetTemperature(int targetTemperature)
{
    // Vérification si la nouvelle température est différente de l'ancienne
    if (m_targetTemperature == targetTemperature)
        return;

    // Mise à jour de la température cible
    m_targetTemperature = targetTemperature;
    // Émission du signal indiquant le changement dans la température cible
    emit targetTemperatureChanged(m_targetTemperature);
}
