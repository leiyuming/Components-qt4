#ifndef WINDOW_H
#define WINDOW_H

#include <QVariant>
#include <QString>
#include <QDeclarativeView>

class Window : public QDeclarativeView
{
    Q_OBJECT
public:
    explicit Window(QWidget *parent = 0);
    ~Window();

protected:
    void init();
    void setupSignalSlot();
    void initWindowProperty(const QVariantMap &prop);

protected:
    void focusInEvent(QFocusEvent *event);

signals:
    void windowEvent(const QVariant &event);

public slots:
    void showWindow(const QString &qml, const QVariant &parameter = QVariant());
    QVariant invoke(const QVariant &method, const QVariant &parameter = QVariant());

};

#endif // WINDOW_H
