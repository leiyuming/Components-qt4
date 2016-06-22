#include "OpacityEffect.h"
#include <QStringList>
#include <QBrush>
#include <QDebug>

OpacityEffect::OpacityEffect(QObject *parent) :
    QGraphicsOpacityEffect(parent)
{
}

QVariant OpacityEffect::mask() const
{
    return m_mask;
}

void OpacityEffect::setMask(const QVariant &mask)
{
    m_mask = mask;
    QVariantMap info = m_mask.toMap();
    int type = info["type"].toInt();
    switch (type) {
    case Color:
        setOpacityMask(QBrush(QColor(info["value"].toString())));
        break;
    case Gradient: {
        QVariantMap gradientInfo = info["value"].toMap();
        int gradientType = gradientInfo["type"].toInt();
        switch (gradientType) {
            case Linear: {
                QVariantMap startPos = gradientInfo["startPos"].toMap();
                QVariantMap endPos = gradientInfo["endPos"].toMap();
                QLinearGradient linearGrad(QPointF(startPos["x"].toReal(), startPos["y"].toReal()),
                        QPointF(endPos["x"].toReal(), endPos["y"].toReal()));
                foreach (QVariant gradient, gradientInfo["gradient"].toList()) {
                    QVariantMap data = gradient.toMap();
                    linearGrad.setColorAt(data["pos"].toReal(), data["color"].value<QColor>());
                }
                setOpacityMask(linearGrad);
            }
            break;
            case Radial: {
                qreal radius = gradientInfo["radius"].toReal();
                QVariantMap centerPos = gradientInfo["centerPos"].toMap();
                QRadialGradient radialGrad(QPointF(centerPos["x"].toReal(), centerPos["y"].toReal()), radius);
                foreach (QVariant gradient, gradientInfo["gradient"].toList()) {
                    QVariantMap data = gradient.toMap();
                    radialGrad.setColorAt(data["pos"].toReal(), data["color"].value<QColor>());
                }
                setOpacityMask(radialGrad);
            }
            break;
        }
    }
        break;
    case Image: {
        setOpacityMask(QBrush(QImage(info["value"].toString())));
        break;
    }
    }
    update();
    emit maskChanged();
}
