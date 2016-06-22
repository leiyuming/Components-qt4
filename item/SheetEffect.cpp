#include "SheetEffect.h"
#include <QPainter>
#include <QPixmap>
#include <qmath.h>
#include <QDebug>

SheetEffect::SheetEffect(QObject *parent) :
    QGraphicsEffect(parent)
{
    m_sheetWidth = 0;
    m_sheet = 1;
    m_factor = 0.01;
}

qreal SheetEffect::sheetWidth() const
{
    return m_sheetWidth;
}

void SheetEffect::setSheetWidth(qreal width)
{
    if (m_sheetWidth != width) {
        m_sheetWidth = width;
        update();
        emit sheetWidthChanged();
    }
}

qreal SheetEffect::sheet() const
{
    return m_sheet;
}

void SheetEffect::setSheet(qreal sheet)
{
    if (sheet != m_sheet) {
        m_sheet = qBound(0.0, sheet, 1.0);
        update();
        emit sheetChanged();
    }
}

qreal SheetEffect::factor() const
{
    return m_factor;
}

void SheetEffect::setFactor(qreal factor)
{
    if (m_factor != factor) {
        m_factor = qBound(0.0, factor, 1.0);
        m_factor = factor;
        update();
        emit factorChanged();
    }
}

void SheetEffect::draw(QPainter *painter)
{
    if (m_source.isNull())
        m_source = sourcePixmap().toImage();
    QImage surface(qMax(m_source.width(), (int)m_sheetWidth), m_source.height(), QImage::Format_ARGB32);
    surface.fill(Qt::transparent);
    for (int row = 0; row < surface.height() * m_sheet; row++) {
        qreal factor = qPow(m_factor / 100, (qreal)row / surface.height()) - m_factor / 100;
        int width = (m_source.width() - m_sheetWidth) / 2;
        int dw = factor * width * (1.0 - m_sheet);
        if (dw < 0) { dw = 0; }
        int dy = (1 - m_sheet) * surface.height();
        qreal scale = surface.width() / (surface.width() - 2.0 * dw);
        for (int index = dw; index < surface.width() - dw; index++) {
            int x = qBound(0, (int)((index - dw) * scale), m_source.width() - 1);
            int y = qBound(0, row + dy, m_source.height() - 1);
            surface.setPixel(index, row, m_source.pixel(x, y));
        }
    }
    painter->drawImage(0, 0, surface);
}

void SheetEffect::sourceChanged(QGraphicsEffect::ChangeFlags flags)
{
    m_source = sourcePixmap().toImage();
}

























