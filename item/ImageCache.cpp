#include "ImageCache.h"
#include <QDesktopServices>
#include <QFile>
#include <QCryptographicHash>
#include <QDebug>

ImageCache::ImageCache(QObject *parent) :
    QObject(parent)
{
    cacheDir.setPath(QDesktopServices::storageLocation(QDesktopServices::TempLocation));
}

QString ImageCache::source() const
{
    return m_source;
}

void ImageCache::setSource(const QString &source)
{
    m_source = source;
    emit sourceChanged();

    if (source.isEmpty()) {
        setCache("");
        emit cached();
        return;
    }

    QString md5 = QCryptographicHash::hash(source.toLocal8Bit(), QCryptographicHash::Md5).toHex();
    m_cache = QString("%1.png").arg(md5);
    qDebug() << m_cache;
    if (cacheDir.exists(m_cache)) {
        setCache(cacheDir.filePath(m_cache));
        emit cached();
    }
    else {
        QNetworkReply* reply = manager.get(QNetworkRequest(QUrl(source)));
        QObject::connect(reply, SIGNAL(finished()), this, SLOT(onCacheImage()));
        qDebug() << m_cache << "start";
    }
}

QString ImageCache::cache() const
{
    return m_cache;
}

void ImageCache::setCache(const QString &cache)
{
    m_cache = cache;
    emit cacheChanged();
}

void ImageCache::onCacheImage()
{
    qDebug() << m_cache << "receive";
    QNetworkReply *reply = (QNetworkReply *)sender();
    if (reply->error() == QNetworkReply::NoError) {
        QFile file(cacheDir.filePath(m_cache));
        file.open(QFile::WriteOnly);
        file.write(reply->readAll());
        file.close();
        reply->deleteLater();
        qDebug() << m_cache << "save";

        setCache(cacheDir.filePath(m_cache));
        emit cached();
    }
}
