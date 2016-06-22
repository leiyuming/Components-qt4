#ifndef OPACITYEFFECT_H
#define OPACITYEFFECT_H

#include <QGraphicsOpacityEffect>
#include <QVariant>

class OpacityEffect : public QGraphicsOpacityEffect
{
    Q_OBJECT
    Q_ENUMS(EffectType)
    Q_ENUMS(GradientType)
    Q_PROPERTY(QVariant mask READ mask WRITE setMask NOTIFY maskChanged)
public:
    explicit OpacityEffect(QObject *parent = 0);
    enum EffectType { Color, Gradient, Image };
    enum GradientType { Linear, Radial };

public:
    QVariant mask() const;
    void setMask(const QVariant &mask);
    
signals:
    void maskChanged();
    
public slots:
    
private:
    QVariant m_mask;
};

#endif // OPACITYEFFECT_H
