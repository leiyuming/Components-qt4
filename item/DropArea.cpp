#include "DropArea.h"
#include <QUrl>
#include <QStringList>
#include <QFileInfo>

DropArea::DropArea(QDeclarativeItem *parent)
    : QDeclarativeItem(parent),
      m_accepting(true)
{
    setAcceptDrops(m_accepting);
}

void DropArea::dragEnterEvent(QGraphicsSceneDragDropEvent *event)
{
    event->acceptProposedAction();
    setCursor(Qt::DragMoveCursor);
    emit enter();
}

void DropArea::dragLeaveEvent(QGraphicsSceneDragDropEvent *event)
{
    Q_UNUSED(event)
    unsetCursor();
    emit leave();
}

void DropArea::dropEvent(QGraphicsSceneDragDropEvent *event)
{
    if (event->mimeData()->hasUrls()) {
        QStringList urls;
        foreach (QUrl url, event->mimeData()->urls()) {
            QString file = url.toLocalFile();
            QFileInfo fi(file);
            if (fi.isFile())
                urls << file;
        }
        emit drop(QVariant(urls));
    }
    unsetCursor();
}

void DropArea::setAcceptingDrops(bool accepting)
{
    if (accepting == m_accepting)
        return;

    m_accepting = accepting;
    setAcceptDrops(m_accepting);
    emit acceptingDropsChanged();
}
