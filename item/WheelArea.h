#ifndef WHEELAREA_H
#define WHEELAREA_H

#include <QDeclarativeItem>
#include <QGraphicsSceneWheelEvent>

class WheelArea : public QDeclarativeItem
{
    Q_OBJECT
public:
    explicit WheelArea(QDeclarativeItem *parent = 0);
    
protected:
    void wheelEvent(QGraphicsSceneWheelEvent *event);

signals:
    void upDirection();
    void downDirection();
};

QML_DECLARE_TYPE(WheelArea)

#endif // WHEELAREA_H
