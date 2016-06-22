#include "GraphicsEffect.h"

GraphicsEffect::GraphicsEffect(QDeclarativeItem *parent) :
    QDeclarativeItem(parent)
{
    m_effect = NULL;
    m_sourceItem = NULL;
}

QDeclarativeItem *GraphicsEffect::sourceItem() const
{
    return m_sourceItem;
}

void GraphicsEffect::setSourceItem(QDeclarativeItem *item)
{
    m_sourceItem = item;
    m_sourceItem->setGraphicsEffect(m_effect);
    emit sourceItemChanged();
}

GraphicsBlurEffect::GraphicsBlurEffect(GraphicsEffect *parent) :
    GraphicsEffect(parent)
{
    m_effect = new QGraphicsBlurEffect();
}

qreal GraphicsBlurEffect::blurRadius() const
{
    return ((QGraphicsBlurEffect *)m_effect)->blurRadius();
}

int GraphicsBlurEffect::blurHints() const
{
    return ((QGraphicsBlurEffect *)m_effect)->blurHints();
}

void GraphicsBlurEffect::setBlurRadius(qreal blurRadius)
{
    ((QGraphicsBlurEffect *)m_effect)->setBlurRadius(blurRadius);
    emit blurRadiusChanged();
}

void GraphicsBlurEffect::setBlurHints(int hints)
{
    ((QGraphicsBlurEffect *)m_effect)->setBlurHints((QGraphicsBlurEffect::BlurHint)hints);
    emit blurHintsChanged();
}

GraphicsColorizeEffect::GraphicsColorizeEffect(GraphicsEffect *parent) :
    GraphicsEffect(parent)
{
    m_effect = new QGraphicsColorizeEffect();
}

QColor GraphicsColorizeEffect::color() const
{
    return ((QGraphicsColorizeEffect *)m_effect)->color();
}

qreal GraphicsColorizeEffect::strength() const
{
    return ((QGraphicsColorizeEffect *)m_effect)->strength();
}

void GraphicsColorizeEffect::setColor(const QColor &c)
{
    ((QGraphicsColorizeEffect *)m_effect)->setColor(c);
    emit colorChanged();
}

void GraphicsColorizeEffect::setStrength(qreal strength)
{
    ((QGraphicsColorizeEffect *)m_effect)->setStrength(strength);
    emit strengthChanged();
}

GraphicsDropShadowEffect::GraphicsDropShadowEffect(GraphicsEffect *parent) :
    GraphicsEffect(parent)
{
    m_effect = new QGraphicsDropShadowEffect();
}

QPointF GraphicsDropShadowEffect::offset() const
{
    return ((QGraphicsDropShadowEffect *)m_effect)->offset();
}

qreal GraphicsDropShadowEffect::xOffset() const
{
    return ((QGraphicsDropShadowEffect *)m_effect)->xOffset();
}

qreal GraphicsDropShadowEffect::yOffset() const
{
    return ((QGraphicsDropShadowEffect *)m_effect)->yOffset();
}

qreal GraphicsDropShadowEffect::blurRadius() const
{
    return ((QGraphicsDropShadowEffect *)m_effect)->blurRadius();
}

QColor GraphicsDropShadowEffect::color() const
{
    return ((QGraphicsDropShadowEffect *)m_effect)->color();
}

void GraphicsDropShadowEffect::setOffset(const QPointF &ofs)
{
    ((QGraphicsDropShadowEffect *)m_effect)->setOffset(ofs);
    emit offsetChanged();
}

void GraphicsDropShadowEffect::setOffset(qreal dx, qreal dy)
{
    ((QGraphicsDropShadowEffect *)m_effect)->setOffset(dx, dy);
    emit offsetChanged();
}

void GraphicsDropShadowEffect::setOffset(qreal d)
{
    ((QGraphicsDropShadowEffect *)m_effect)->setOffset(d);
    emit offsetChanged();
}

void GraphicsDropShadowEffect::setXOffset(qreal dx)
{
    ((QGraphicsDropShadowEffect *)m_effect)->setXOffset(dx);
    emit offsetChanged();
}

void GraphicsDropShadowEffect::setYOffset(qreal dy)
{
    ((QGraphicsDropShadowEffect *)m_effect)->setYOffset(dy);
    emit offsetChanged();
}

void GraphicsDropShadowEffect::setBlurRadius(qreal blurRadius)
{
    ((QGraphicsDropShadowEffect *)m_effect)->setBlurRadius(blurRadius);
    emit blurRadiusChanged();
}

void GraphicsDropShadowEffect::setColor(const QColor &color)
{
    ((QGraphicsDropShadowEffect *)m_effect)->setColor(color);
    emit colorChanged();
}

GraphicsOpacityEffect::GraphicsOpacityEffect(GraphicsEffect *parent) :
    GraphicsEffect(parent)
{
    m_effect = new QGraphicsOpacityEffect();
}

qreal GraphicsOpacityEffect::opacity() const
{
    return ((QGraphicsOpacityEffect *)m_effect)->opacity();
}

QBrush GraphicsOpacityEffect::opacityMask() const
{
    return ((QGraphicsOpacityEffect *)m_effect)->opacityMask();
}

void GraphicsOpacityEffect::setOpacity(qreal opacity)
{
    ((QGraphicsOpacityEffect *)m_effect)->setOpacity(opacity);
    emit opacityChanged();
}

void GraphicsOpacityEffect::setOpacityMask(const QBrush &mask)
{
    ((QGraphicsOpacityEffect *)m_effect)->setOpacityMask(mask);
    emit opacityMaskChanged();
}
