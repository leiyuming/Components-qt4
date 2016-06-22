#ifndef PIXMAP_H
#define PIXMAP_H

#include <QDeclarativeItem>
#include <QString>
#include <QImage>
#include <QPixmap>

class Pixmap : public QDeclarativeItem
{
    Q_OBJECT
    Q_PROPERTY(QString source READ source WRITE setSource NOTIFY sourceChanged)
public:
    explicit Pixmap(QDeclarativeItem *parent = 0);

public:
    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget);

public:
    QString source() const;
    void setSource(const QString &image);
    
signals:
    void sourceChanged();
    
public slots:
    void clear();
    void save(const QString &fileName);
    void repaint();
    
private:
    QImage m_image;
    QImage m_pixmap;
};

QML_DECLARE_TYPE(Pixmap)

#endif // PIXMAP_H
