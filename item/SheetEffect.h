#ifndef SHEETEFFECT_H
#define SHEETEFFECT_H

#include <QGraphicsEffect>
#include <QVariant>
#include <QImage>

class SheetEffect : public QGraphicsEffect
{
    Q_OBJECT
    Q_PROPERTY(qreal sheetWidth READ sheetWidth WRITE setSheetWidth NOTIFY sheetWidthChanged)
    Q_PROPERTY(qreal sheet READ sheet WRITE setSheet NOTIFY sheetChanged)
    Q_PROPERTY(qreal factor READ factor WRITE setFactor NOTIFY factorChanged)
public:
    explicit SheetEffect(QObject *parent = 0);

public:
    qreal sheetWidth() const;
    void setSheetWidth(qreal width);
    qreal sheet() const;
    void setSheet(qreal sheet);
    qreal factor() const;
    void setFactor(qreal factor);

protected:
    void draw(QPainter *painter);
    void sourceChanged(ChangeFlags flags);
    
signals:
    void sheetWidthChanged();
    void sheetChanged();
    void factorChanged();

public slots:

private:
    qreal m_sheetWidth;
    qreal m_sheet;
    qreal m_factor;
    QImage m_source;
};

#endif // SHEETEFFECT_H
