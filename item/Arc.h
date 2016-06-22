#ifndef ARC_H
#define ARC_H

#include <QDeclarativeItem>
#include <QVariant>
#include <QString>

class Arc : public QDeclarativeItem
{
    Q_OBJECT
    Q_PROPERTY(qreal insideRadius READ insideRadius WRITE setInsideRadius NOTIFY insideRadiusChanged)
    Q_PROPERTY(qreal outsideRadius READ outsideRadius WRITE setOutsideRadius NOTIFY outsideRadiusChanged)
    Q_PROPERTY(qreal startAngle READ startAngle WRITE setStartAngle NOTIFY startAngleChanged)
    Q_PROPERTY(qreal endAngle READ endAngle WRITE setEndAngle NOTIFY endAngleChanged)
    Q_PROPERTY(QVariant brush READ brush WRITE setBrush NOTIFY brushChanged)
    Q_PROPERTY(int borderWidth READ borderWidth WRITE setBorderWidth NOTIFY borderWidthChanged)
    Q_PROPERTY(QString borderColor READ borderColor WRITE setBorderColor NOTIFY borderColorChanged)

public:
    explicit Arc(QDeclarativeItem *parent = 0);

    qreal insideRadius() const;
    void setInsideRadius(qreal radius);
    qreal outsideRadius() const;
    void setOutsideRadius(qreal radius);
    qreal startAngle() const;
    void setStartAngle(qreal angle);
    qreal endAngle() const;
    void setEndAngle(qreal angle);
    QVariant brush() const;
    void setBrush(const QVariant &brush);
    int borderWidth() const;
    void setBorderWidth(int width);
    QString borderColor() const;
    void setBorderColor(const QString &color);

public:
    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget);
    
signals:
    void insideRadiusChanged();
    void outsideRadiusChanged();
    void startAngleChanged();
    void endAngleChanged();
    void brushChanged();
    void borderWidthChanged();
    void borderColorChanged();

public slots:
    
private:
    qreal m_insideRadius;
    qreal m_outsideRadius;
    qreal m_startAngle;
    qreal m_endAngle;
    QVariant m_brush;
    int m_borderWidth;
    QString m_borderColor;
};

#endif // ARC_H
