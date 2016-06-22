#ifndef EVENTLOOP_H
#define EVENTLOOP_H

#include <QObject>
#include <QEventLoop>

class EventLoop : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool running READ running WRITE setRunning NOTIFY runningChanged)
public:
    explicit EventLoop(QObject *parent = 0);

    bool running() const;
    void setRunning(bool running);
    
signals:
    void runningChanged();
    
public slots:

private:
    bool isRunning;
    QEventLoop eventloop;
};

#endif // EVENTLOOP_H
