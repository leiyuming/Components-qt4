#include "EventLoop.h"
#include <QApplication>

EventLoop::EventLoop(QObject *parent) :
    QObject(parent)
{
    isRunning = false;
}

bool EventLoop::running() const
{
    return isRunning;
}

void EventLoop::setRunning(bool running)
{
    if (isRunning != running) {
        isRunning = running;
        emit runningChanged();
    }
    if (isRunning) {
        eventloop.exec();
    }
    else {
        eventloop.quit();
    }
}
