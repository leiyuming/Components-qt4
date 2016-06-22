#include "Dialog.h"

#include <QDeclarativeContext>
#include <QDesktopServices>
#include <QDesktopWidget>
#include <QEvent>

Dialog::Dialog(QWidget *parent) :
    QDeclarativeView(parent)
{
    init();
}

Dialog::~Dialog()
{
}

void Dialog::init()
{
    resize(1, 1);
    setAttribute(Qt::WA_TranslucentBackground);
    setWindowFlags(Qt::Dialog | Qt::FramelessWindowHint);
    setStyleSheet("background-color:transparent");
    rootContext()->setContextProperty("window", this);
}

void Dialog::setupSignalSlot()
{
}

void Dialog::initDialogProperty(const QVariantMap &prop)
{
    if (parentWidget()) {
        move(parentWidget()->geometry().center() - QPoint(width() / 2, height() / 2));
    }
    else {
        QDesktopWidget dw;
        move(dw.availableGeometry().center() - QPoint(width() / 2, height() / 2));
    }
}

void Dialog::setModal()
{
    if (parentWidget()) {
        setWindowModality(Qt::WindowModal);
    }
    else {
        setWindowModality(Qt::ApplicationModal);
    }
}

void Dialog::focusInEvent(QFocusEvent *event)
{
    QDeclarativeView::focusInEvent(event);
    repaint();
}

void Dialog::close()
{
    QDeclarativeView::close();
    eventloop.quit();
}

void Dialog::showDialog(const QString &qml, const QVariant &parameter)
{
    rootContext()->setContextProperty("parameter", parameter);
    setModal();
    show();
    setSource(QUrl(qml));
    initDialogProperty(parameter.toMap());
    setupSignalSlot();
    eventloop.exec();
}

QVariant Dialog::invoke(const QVariant &method, const QVariant &parameter)
{
    QVariant retValue;
    QMetaObject::invokeMethod((QObject *)rootObject(), "invoker", Q_RETURN_ARG(QVariant, retValue), Q_ARG(QVariant, method), Q_ARG(QVariant, parameter));
    return retValue;
}

void Dialog::setResults(QVariant results)
{
    m_results = results;
    emit resultsChanged();
}

QVariant Dialog::getResults()
{
    return m_results;
}

