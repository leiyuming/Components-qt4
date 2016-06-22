#ifndef DIALOGPROVIDER_H
#define DIALOGPROVIDER_H

#include <QObject>
#include <QString>
#include <QVariant>

class DialogProvider : public QObject
{
    Q_OBJECT
public:
    explicit DialogProvider(QObject *parent = 0);

signals:
    
public slots:
    void setParentWidget(QWidget *widget);
    QVariant showDialog(const QString &qml, const QVariant &parameter = QVariant());

private:
    QWidget *parentWidget;
};

#endif // DIALOGPROVIDER_H
