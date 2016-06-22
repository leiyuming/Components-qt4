#include "ToolTip.h"

#include <QDeclarativeContext>
#include <QDesktopServices>
#include <QDesktopWidget>
#include <QEvent>
#include <QDebug>

ToolTip::ToolTip(QWidget *parent) :
    QDeclarativeView(parent)
{
    init();
}

ToolTip::~ToolTip()
{
}

void ToolTip::init()
{
    resize(1, 1);
    setAttribute(Qt::WA_TranslucentBackground);
    setWindowFlags(Qt::Window | Qt::FramelessWindowHint);
    setStyleSheet("background-color:transparent");
    rootContext()->setContextProperty("window", this);
}

void ToolTip::setupSignalSlot()
{
}

void ToolTip::initWindowProperty(const QVariantMap &prop)
{
    if (parentWidget()) {
        move(parentWidget()->geometry().center() - QPoint(width() / 2, height() / 2));
    }
    else {
        QDesktopWidget dw;
        move(dw.availableGeometry().center() - QPoint(width() / 2, height() / 2));
    }
}

void ToolTip::focusInEvent(QFocusEvent *event)
{
    QDeclarativeView::focusInEvent(event);
    repaint();
}

void ToolTip::setWindowSource(const QString &qml, const QVariant &parameter)
{
    rootContext()->setContextProperty("parameter", parameter);
    setSource(QUrl(qml));
    initWindowProperty(parameter.toMap());
    setupSignalSlot();
}

QVariant ToolTip::invoke(const QVariant &method, const QVariant &parameter)
{
    QVariant retValue;
    QMetaObject::invokeMethod((QObject *)rootObject(), "invoker", Q_RETURN_ARG(QVariant, retValue), Q_ARG(QVariant, method), Q_ARG(QVariant, parameter));
    return retValue;
}
