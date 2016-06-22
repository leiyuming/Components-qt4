#include "Arc.h"
#include <QPixmap>
#include <QPainter>
#include <QStringList>

Arc::Arc(QDeclarativeItem *parent) :
    QDeclarativeItem(parent)
{
    setFlag(ItemHasNoContents, false);
    m_insideRadius = 0;
    m_outsideRadius = 0;
    m_startAngle = 0;
    m_endAngle = 0;
    m_borderWidth = 0;
    m_borderColor = "black";
}

qreal Arc::insideRadius() const
{
    return m_insideRadius;
}

void Arc::setInsideRadius(qreal radius)
{
    m_insideRadius = radius;
    update();
    emit insideRadiusChanged();
}

qreal Arc::outsideRadius() const
{
    return m_outsideRadius;
}

void Arc::setOutsideRadius(qreal radius)
{
    m_outsideRadius = radius;
    update();
    emit outsideRadiusChanged();
}

qreal Arc::startAngle() const
{
    return m_startAngle;
}

void Arc::setStartAngle(qreal angle)
{
    m_startAngle = angle;
    update();
    emit startAngleChanged();
}

qreal Arc::endAngle() const
{
    return m_endAngle;
}

void Arc::setEndAngle(qreal angle)
{
    m_endAngle = angle;
    update();
    emit endAngleChanged();
}

QVariant Arc::brush() const
{
    return m_brush;
}

void Arc::setBrush(const QVariant &brush)
{
    m_brush = brush;
    update();
    emit startAngleChanged();
}

int Arc::borderWidth() const
{
    return m_borderWidth;
}

void Arc::setBorderWidth(int width)
{
    m_borderWidth = width;
    update();
    emit borderWidthChanged();
}

QString Arc::borderColor() const
{
    return m_borderColor;
}

void Arc::setBorderColor(const QString &color)
{
    m_borderColor = color;
    update();
    emit borderColorChanged();
}

void Arc::paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget)
{
    painter->save();
    QPen pen;
    if (m_borderWidth == 0) {
        pen.setColor(Qt::transparent);
    }
    else {
        pen.setWidth(m_borderWidth);
        pen.setColor(m_borderColor);
    }
    painter->setPen(pen);

    QRadialGradient gradient(QPointF(width() / 2.0, height() / 2.0), m_outsideRadius);
    gradient.setFocalRadius(m_insideRadius);
    QStringList colors = m_brush.toStringList();
    if (colors.count() == 1) {
        painter->setBrush(QBrush(QColor(colors[0])));
    }
    else {
        float dc = 0;
        for (int i = 0; i < colors.count(); i++) {
            dc = (float)i / (colors.count() - 1);
            gradient.setColorAt(dc, QColor(colors[i]));
        }
        painter->setBrush(QBrush(gradient));
    }
    painter->setRenderHint(QPainter::HighQualityAntialiasing);

    QRectF boundingOutsideRect(width() / 2.0 - m_outsideRadius, height() / 2.0 - m_outsideRadius, m_outsideRadius * 2, m_outsideRadius * 2);
    QPainterPath outsidePath;
    outsidePath.moveTo(width() / 2.0, height() / 2.0);
    outsidePath.arcTo(boundingOutsideRect, m_startAngle, m_endAngle - m_startAngle);
    QRectF boundingInsideRect(width() / 2.0 - m_insideRadius, height() / 2.0 - m_insideRadius, m_insideRadius * 2, m_insideRadius * 2);
    QPainterPath insidePath;
    insidePath.moveTo(width() / 2.0, height() / 2.0);
    insidePath.arcTo(boundingInsideRect, m_startAngle, m_endAngle - m_startAngle);
    outsidePath -= insidePath;

    painter->drawPath(outsidePath);
    painter->restore();
    QDeclarativeItem::paint(painter, option, widget);
}


