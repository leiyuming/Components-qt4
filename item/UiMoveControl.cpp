#include "UiMoveControl.h"

UiMoveControl::UiMoveControl(QObject *parent) :
    QObject(parent)
{
    enable = true;
}

void UiMoveControl::setWindow(QWidget *window)
{
    this->window = window;
}

void UiMoveControl::setEnable(bool enable)
{
    this->enable = enable;
}

void UiMoveControl::onMousePressed(int x, int y)
{
    old_x = x, old_y = y;
}

void UiMoveControl::onMouseMoved(int x, int y)
{
    if (enable)
        window->move(window->pos().x() + x - old_x, window->pos().y() + y - old_y);
}
