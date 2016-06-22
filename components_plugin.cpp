#include "components_plugin.h"
#include "Util.h"

// basic components
#include "item/CursorArea.h"
#include "item/DropArea.h"
#include "item/Tip.h"
#include "item/WheelArea.h"
#include "item/Pixmap.h"
#include "item/Settings.h"
#include "item/EventLoop.h"
#include "item/Style.h"
#include "item/Invoker.h"
#include "item/GraphicsEffect.h"
#include "item/Arc.h"
#include "item/SheetEffect.h"
#include "item/OpacityEffect.h"

#include <qdeclarative.h>
#include <QDeclarativeContext>
#include <QDeclarativeEngine>
#include <QString>
#include <QByteArray>
#include <QDir>
#include <QApplication>

void ComponentsPlugin::registerTypes(const char *uri)
{
    // @uri Components
    registerBasicComponents(uri);
}

void ComponentsPlugin::registerBasicComponents(const char *uri)
{
    // @uri Components
    qmlRegisterType<Arc>(uri, 1, 0, "Arc");
    qmlRegisterType<CursorArea>(uri, 1, 0, "CursorArea");
    qmlRegisterType<DropArea>(uri, 1, 0, "DropArea");
    qmlRegisterType<Tip>(uri, 1, 0, "Tip");
    qmlRegisterType<WheelArea>(uri, 1, 0, "WheelArea");
    qmlRegisterType<Pixmap>(uri, 1, 0, "Pixmap");
    qmlRegisterType<Settings>(uri, 1, 0, "Settings");
    qmlRegisterType<EventLoop>(uri, 1, 0, "EventLoop");
    qmlRegisterType<QGraphicsBlurEffect>(uri, 1, 0, "BlurEffect");
    qmlRegisterType<QGraphicsColorizeEffect>(uri, 1, 0, "ColorizeEffect");
    qmlRegisterType<QGraphicsDropShadowEffect>(uri, 1, 0, "DropShadowEffect");
    qmlRegisterType<OpacityEffect>(uri, 1, 0, "OpacityEffect");
    qmlRegisterType<SheetEffect>(uri, 1, 0, "SheetEffect");
//    qmlRegisterType<GraphicsBlurEffect>(uri, 1, 0, "BlurEffect");
//    qmlRegisterType<GraphicsColorizeEffect>(uri, 1, 0, "ColorizeEffect");
//    qmlRegisterType<GraphicsDropShadowEffect>(uri, 1, 0, "DropShadowEffect");
//    qmlRegisterType<GraphicsOpacityEffect>(uri, 1, 0, "OpacityEffect");
}

void ComponentsPlugin::initializeEngine(QDeclarativeEngine *engine, const char *uri)
{
    Q_UNUSED(uri)
    engine->rootContext()->setContextProperty("Util", new Util(this));
    engine->rootContext()->setContextProperty("qApp", qApp);
    engine->rootContext()->setContextProperty("components", Style::Instance());
    engine->rootContext()->setContextProperty("invoker", new Invoker(this));
}

Q_EXPORT_PLUGIN2(Components, ComponentsPlugin)

