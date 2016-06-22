#ifndef GRAPHICSEFFECT_H
#define GRAPHICSEFFECT_H

#include <QDeclarativeItem>
#include <QGraphicsEffect>
#include <QGraphicsBlurEffect>
#include <QGraphicsColorizeEffect>
#include <QGraphicsDropShadowEffect>
#include <QGraphicsOpacityEffect>

class GraphicsEffect : public QDeclarativeItem
{
    Q_OBJECT
    Q_PROPERTY(QDeclarativeItem *sourceItem READ sourceItem WRITE setSourceItem NOTIFY sourceItemChanged)
public:
    explicit GraphicsEffect(QDeclarativeItem *parent = 0);

public:
    QDeclarativeItem *sourceItem() const;
    void setSourceItem(QDeclarativeItem *item);

signals:
    void sourceItemChanged();
    
public slots:
    
protected:
    QGraphicsEffect *m_effect;
    QDeclarativeItem *m_sourceItem;
};

class GraphicsBlurEffect : public GraphicsEffect
{
    Q_OBJECT
    Q_ENUMS(QGraphicsBlurEffect::BlurHint)
    Q_PROPERTY(qreal blurRadius READ blurRadius WRITE setBlurRadius NOTIFY blurRadiusChanged)
    Q_PROPERTY(int blurHints READ blurHints WRITE setBlurHints NOTIFY blurHintsChanged)
public:
    explicit GraphicsBlurEffect(GraphicsEffect *parent = 0);
    qreal blurRadius() const;
    int blurHints() const;

public Q_SLOTS:
    void setBlurRadius(qreal blurRadius);
    void setBlurHints(int hints);
Q_SIGNALS:
    void blurRadiusChanged();
    void blurHintsChanged();
};

class GraphicsColorizeEffect : public GraphicsEffect
{
    Q_OBJECT
    Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY colorChanged)
    Q_PROPERTY(qreal strength READ strength WRITE setStrength NOTIFY strengthChanged)
public:
    explicit GraphicsColorizeEffect(GraphicsEffect *parent = 0);
    QColor color() const;
    qreal strength() const;

public Q_SLOTS:
    void setColor(const QColor &c);
    void setStrength(qreal strength);
Q_SIGNALS:
    void colorChanged();
    void strengthChanged();
};

class GraphicsDropShadowEffect : public GraphicsEffect
{
    Q_OBJECT
    Q_PROPERTY(QPointF offset READ offset WRITE setOffset NOTIFY offsetChanged)
    Q_PROPERTY(qreal xOffset READ xOffset WRITE setXOffset NOTIFY offsetChanged)
    Q_PROPERTY(qreal yOffset READ yOffset WRITE setYOffset NOTIFY offsetChanged)
    Q_PROPERTY(qreal blurRadius READ blurRadius WRITE setBlurRadius NOTIFY blurRadiusChanged)
    Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY colorChanged)
public:
    explicit GraphicsDropShadowEffect(GraphicsEffect *parent = 0);
    QPointF offset() const;
    qreal xOffset() const;
    qreal yOffset() const;
    qreal blurRadius() const;
    QColor color() const;

public Q_SLOTS:
    void setOffset(const QPointF &ofs);
    void setOffset(qreal dx, qreal dy);
    void setOffset(qreal d);
    void setXOffset(qreal dx);
    void setYOffset(qreal dy);

    void setBlurRadius(qreal blurRadius);
    void setColor(const QColor &color);

Q_SIGNALS:
    void offsetChanged();
    void blurRadiusChanged();
    void colorChanged();
};

class GraphicsOpacityEffect : public GraphicsEffect
{
    Q_OBJECT
    Q_PROPERTY(qreal opacity READ opacity WRITE setOpacity NOTIFY opacityChanged)
    Q_PROPERTY(QBrush opacityMask READ opacityMask WRITE setOpacityMask NOTIFY opacityMaskChanged)
public:
    explicit GraphicsOpacityEffect(GraphicsEffect *parent = 0);
    qreal opacity() const;
    QBrush opacityMask() const;

public Q_SLOTS:
    void setOpacity(qreal opacity);
    void setOpacityMask(const QBrush &mask);

Q_SIGNALS:
    void opacityChanged();
    void opacityMaskChanged();
};

QML_DECLARE_TYPE(GraphicsBlurEffect)
QML_DECLARE_TYPE(GraphicsColorizeEffect)
QML_DECLARE_TYPE(GraphicsDropShadowEffect)
QML_DECLARE_TYPE(GraphicsOpacityEffect)

#endif // GRAPHICSEFFECT_H
