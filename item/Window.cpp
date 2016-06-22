#include "Window.h"

#include <QDeclarativeContext>
#include <QDesktopServices>
#include <QDesktopWidget>
#include <QEvent>
#include <QDebug>

Window::Window(QWidget *parent) :
    QDeclarativeView(parent)
{
    init();
}

Window::~Window()
{
}

void Window::init()
{
    resize(1, 1);
    setAttribute(Qt::WA_TranslucentBackground);
    setWindowFlags(Qt::Window | Qt::FramelessWindowHint);
    setStyleSheet("background-color:transparent");
    rootContext()->setContextProperty("window", this);
}

void Window::setupSignalSlot()
{
}

void Window::initWindowProperty(const QVariantMap &prop)
{
    if (parentWidget()) {
        move(parentWidget()->geometry().center() - QPoint(width() / 2, height() / 2));
    }
    else {
        QDesktopWidget dw;
        move(dw.availableGeometry().center() - QPoint(width() / 2, height() / 2));
    }
}

void Window::focusInEvent(QFocusEvent *event)
{
    QDeclarativeView::focusInEvent(event);
    repaint();
}

void Window::showWindow(const QString &qml, const QVariant &parameter)
{
    rootContext()->setContextProperty("parameter", parameter);
    show();
    setSource(QUrl(qml));
    initWindowProperty(parameter.toMap());
    setupSignalSlot();
}

QVariant Window::invoke(const QVariant &method, const QVariant &parameter)
{
    QVariant retValue;
    QMetaObject::invokeMethod((QObject *)rootObject(), "invoker", Q_RETURN_ARG(QVariant, retValue), Q_ARG(QVariant, method), Q_ARG(QVariant, parameter));
    return retValue;
}
