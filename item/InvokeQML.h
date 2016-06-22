#ifndef INVOKEQML_H
#define INVOKEQML_H

#include <QObject>
#include <QVariant>

class InvokeQML : public QObject
{
    Q_OBJECT
public:
    explicit InvokeQML(QObject *parent = 0);
    enum INTERFACE_ARG_COUNT {
        ARG_NONE,
        ARG_ONE,
        ARG_TWO,
        ARG_THREE
    };

    static QVariant interface(int argcount,
                              QObject *qml,
                              const QString &funName,
                              const QVariant &value1 = QVariant(),
                              const QVariant &value2 = QVariant(),
                              const QVariant &value3 = QVariant()
                              );

signals:

public slots:

};

#endif // INVOKEQML_H
