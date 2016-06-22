#include "WheelArea.h"

WheelArea::WheelArea(QDeclarativeItem *parent) :
    QDeclarativeItem(parent)
{
}

void WheelArea::wheelEvent(QGraphicsSceneWheelEvent *event)
{
    if (event->delta() < 0) {
        emit downDirection();
    }
    else {
        emit upDirection();
    }
}
