#include "PopWindow.h"

#include <QDeclarativeContext>
#include <QDesktopServices>
#include <QDesktopWidget>
#include <QEvent>

PopWindow::PopWindow(QWidget *parent) :
    QDeclarativeView(parent)
{
    init();
}

void PopWindow::init()
{
    resize(1, 1);
    setStyleSheet("background-color:transparent");
    setWindowFlags(Qt::Window | Qt::FramelessWindowHint);
    setAttribute(Qt::WA_TranslucentBackground);
    rootContext()->setContextProperty("window", this);
}

void PopWindow::setupSignalSlot()
{
}

bool PopWindow::event(QEvent *event)
{
    if (event->type() == QEvent::ActivationChange && !isActiveWindow()) {
        QDeclarativeView::event(event);
        close();
        return false;
    }

    return QDeclarativeView::event(event);
}

void PopWindow::initWindow(const QString &qml, const QVariant &parameter)
{
    rootContext()->setContextProperty("parameter", parameter);
    setSource(QUrl(qml));
    setupSignalSlot();
}

QVariant PopWindow::invoke(const QVariant &method, const QVariant &parameter)
{
    QVariant retValue;
    QMetaObject::invokeMethod((QObject *)rootObject(), "invoker", Q_RETURN_ARG(QVariant, retValue), Q_ARG(QVariant, method), Q_ARG(QVariant, parameter));
    return retValue;
}

void PopWindow::close()
{
    setParent(NULL);
    disconnect(SIGNAL(windowEvent(QVariant)));
    QDeclarativeView::close();
}
