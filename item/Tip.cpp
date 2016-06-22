#include "Tip.h"

Tip::Tip(QDeclarativeItem *parent) :
    QDeclarativeItem(parent)
{
}

QString Tip::text() const
{
    return toolTip();
}

void Tip::setText(const QString &t)
{
    setToolTip(t);
}
