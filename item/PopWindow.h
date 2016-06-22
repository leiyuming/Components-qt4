#ifndef POPWINDOW_H
#define POPWINDOW_H

#include <QDeclarativeView>
#include <QVariant>
#include <QString>

class PopWindow : public QDeclarativeView
{
    Q_OBJECT
public:
    explicit PopWindow(QWidget *parent = 0);

private:
    void init();
    void setupSignalSlot();

protected:
    bool event(QEvent *event);

signals:
    void windowEvent(const QVariant &event);
    
public slots:
    void close();
    void initWindow(const QString &qml, const QVariant &parameter = QVariant());
    QVariant invoke(const QVariant &method, const QVariant &parameter = QVariant());

};

#endif // POPWINDOW_H
