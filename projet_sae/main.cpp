#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QFontDatabase> // Include QFontDatabase header
#include "system.h"
#include "hvachandler.h"
#include "speedlimiter.h"
#include "rightindicatormanager.h"
#include "leftindicatormanager.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    // Load the custom font
    int fontId = QFontDatabase::addApplicationFont(":/assets/Montserrat-Medium.ttf");
    if (fontId != -1) {
        // Set the custom font as the default application font
        QFont font("Montserrat Medium");
        app.setFont(font);
    } else {
        qWarning() << "Failed to load the custom font.";
    }

    System m_systemHandler;
    HVAChandler m_driverHVACHandler;
    HVAChandler m_passengerHVACHandler;
    SpeedLimiter m_speedLimiterHandler;
    RightIndicatorManager m_rightIndicatorManager;
    LeftIndicatorManager m_leftIndicatorManager;

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    QQmlContext * context(engine.rootContext());
    context->setContextProperty("systemHandler", &m_systemHandler);
    context->setContextProperty("driverHVAC", &m_driverHVACHandler);
    context->setContextProperty("passengerHVAC", &m_passengerHVACHandler);
    context->setContextProperty("speedLimiter", &m_speedLimiterHandler);
    context->setContextProperty("rightIndicatorManager", &m_rightIndicatorManager);
    context->setContextProperty("leftIndicatorManager", &m_leftIndicatorManager);





    return app.exec();
}
