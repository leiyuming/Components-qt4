#ifndef TOOLTIP_H
#define TOOLTIP_H

#include "Window.h"
#include <QVariant>
#include <QString>

class ToolTip : public QDeclarativeView
{
    Q_OBJECT
public:
    explicit ToolTip(QWidget *parent = 0);
    ~ToolTip();

protected:
    void init();
    void setupSignalSlot();
    void initWindowProperty(const QVariantMap &prop);

protected:
    void focusInEvent(QFocusEvent *event);

signals:
    void windowEvent(const QVariant &event);

public slots:
    void setWindowSource(const QString &qml, const QVariant &parameter = QVariant());
    QVariant invoke(const QVariant &method, const QVariant &parameter = QVariant());

};

#endif // TOOLTIP_H
