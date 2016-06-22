#include "Pixmap.h"

#include <QPainter>
#include <QBuffer>
#include <QFile>

Pixmap::Pixmap(QDeclarativeItem *parent) :
    QDeclarativeItem(parent)
{
    setFlag(ItemHasNoContents, false);
}

void Pixmap::paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget)
{
    Q_UNUSED(option)
    Q_UNUSED(widget)
    if (!m_pixmap.isNull()) {
        painter->drawImage(m_pixmap.rect(), m_pixmap);
    }
}

QString Pixmap::source() const
{
    QByteArray data;
    QBuffer buffer(&data);
    buffer.open(QBuffer::WriteOnly);
    m_image.save(&buffer);
    return data.toBase64();
}

void Pixmap::setSource(const QString &image)
{
    m_image = QImage::fromData(QByteArray::fromBase64(image.toAscii()));
    m_pixmap = m_image.scaled(boundingRect().toRect().size(), Qt::IgnoreAspectRatio, Qt::SmoothTransformation);
    update();
    emit sourceChanged();
}

void Pixmap::clear()
{
    m_image = QImage();
    m_pixmap = QImage();
    update();
}

void Pixmap::save(const QString &fileName)
{
    if (!fileName.isEmpty()) {
        QFile file(fileName);
        file.open(QFile::WriteOnly);
        m_image.save(&file, "PNG");
    }
}

void Pixmap::repaint()
{
    m_pixmap = m_image.scaled(boundingRect().toRect().size(), Qt::IgnoreAspectRatio, Qt::SmoothTransformation);
    update();
}
