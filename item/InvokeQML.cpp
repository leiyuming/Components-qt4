#include "InvokeQML.h"

InvokeQML::InvokeQML(QObject *parent) :
    QObject(parent)
{
}

QVariant InvokeQML::interface(int argcount,
                              QObject *qml,
                              const QString &funName,
                              const QVariant &value1,
                              const QVariant &value2,
                              const QVariant &value3
                              )
{
    QVariant retnValue;
    switch (argcount) {
        case ARG_NONE: {
            QMetaObject::invokeMethod(qml, funName.toLocal8Bit(), Q_RETURN_ARG(QVariant, retnValue));
            break;
        }
        case ARG_ONE: {
            QMetaObject::invokeMethod(qml, funName.toLocal8Bit(),
                                      Q_RETURN_ARG(QVariant, retnValue),
                                      Q_ARG(QVariant, value1)
                                      );
            break;
        }
        case ARG_TWO: {
            QMetaObject::invokeMethod(qml, funName.toLocal8Bit(),
                                      Q_RETURN_ARG(QVariant, retnValue),
                                      Q_ARG(QVariant, value1),
                                      Q_ARG(QVariant, value2)
                                      );
            break;
        }
        case ARG_THREE: {
            QMetaObject::invokeMethod(qml, funName.toLocal8Bit(),
                                      Q_RETURN_ARG(QVariant, retnValue),
                                      Q_ARG(QVariant, value1),
                                      Q_ARG(QVariant, value2),
                                      Q_ARG(QVariant, value3)
                                      );
            break;
        }
    }
    return retnValue;
}
