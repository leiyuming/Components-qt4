#ifndef UIMOVECONTROL_H
#define UIMOVECONTROL_H

#include <QObject>
#include <QWidget>

class UiMoveControl : public QObject
{
    Q_OBJECT
public:
    explicit UiMoveControl(QObject *parent = 0);

public:
    void setWindow(QWidget *window);
    
signals:
    
public slots:
    void setEnable(bool enable);
    void onMousePressed(int x, int y);
    void onMouseMoved(int x, int y);

private:
    QWidget *window;
    int old_x, old_y;
    bool enable;
};

#endif // UIMOVECONTROL_H
