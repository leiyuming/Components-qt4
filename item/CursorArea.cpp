#include "CursorArea.h"

CursorArea::CursorArea(QDeclarativeItem *parent)
    : QDeclarativeItem(parent),
      m_cursor(Qt::ArrowCursor)
{

}

void CursorArea::setCursor(Qt::CursorShape cursor)
{
    if (m_cursor == cursor)
        return;
    QDeclarativeItem::setCursor(cursor);
    m_cursor = cursor;
    emit cursorChanged();
}
