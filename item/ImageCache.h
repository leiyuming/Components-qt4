#ifndef IMAGECACHE_H
#define IMAGECACHE_H

#include <QObject>
#include <QString>
#include <QDir>
#include <QtNetwork>

class ImageCache : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString source READ source WRITE setSource NOTIFY sourceChanged)
    Q_PROPERTY(QString cache READ cache WRITE setCache NOTIFY cacheChanged)
public:
    explicit ImageCache(QObject *parent = 0);

public:
    QString source() const;
    void setSource(const QString &source);
    QString cache() const;
    void setCache(const QString &cache);

signals:
    void sourceChanged();
    void cacheChanged();
    void cached();

private slots:
    void onCacheImage();

private:
    QString m_source;
    QString m_cache;
    QDir cacheDir;
    QNetworkAccessManager manager;
};

#endif // IMAGECACHE_H
