#ifndef DROPAREA_H
#define DROPAREA_H

#include <QDeclarativeItem>
#include <QGraphicsSceneDragDropEvent>
#include <QMimeData>

class DropArea : public QDeclarativeItem
{
    Q_OBJECT
    Q_PROPERTY(bool acceptingDrops READ isAcceptingDrops WRITE setAcceptingDrops NOTIFY acceptingDropsChanged)
public:
    explicit DropArea(QDeclarativeItem *parent = 0);
    
public:
    bool isAcceptingDrops() const { return m_accepting; }
    void setAcceptingDrops(bool accepting);

signals:
    void enter();
    void leave();
    void drop(const QVariant &mimeData);
    void acceptingDropsChanged();

protected:
    void dragEnterEvent(QGraphicsSceneDragDropEvent *event);
    void dragLeaveEvent(QGraphicsSceneDragDropEvent *event);
    void dropEvent(QGraphicsSceneDragDropEvent *event);

private:
    bool m_accepting;
    QMimeData mimeData;
};

QML_DECLARE_TYPE(DropArea)

#endif // DROPAREA_H
