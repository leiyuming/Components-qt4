#include "Invoker.h"

Invoker::Invoker(QObject *parent) :
    QObject(parent)
{
}

QVariant Invoker::Method(QObject *object, const QString &method, const QVariant connectionType, const QVariant &parameter0, const QVariant &parameter1, const QVariant &parameter2, const QVariant &parameter3, const QVariant &parameter4, const QVariant &parameter5, const QVariant &parameter6, const QVariant &parameter7, const QVariant &parameter8, const QVariant &parameter9)
{
    QVariant retValue;
    if (parameter0.isNull()) {
        QMetaObject::invokeMethod(object, method.toLocal8Bit().data(), (Qt::ConnectionType)connectionType.toInt(), Q_RETURN_ARG(QVariant, retValue));
    }
    else if (parameter1.isNull()) {
        QMetaObject::invokeMethod(object, method.toLocal8Bit().data(), (Qt::ConnectionType)connectionType.toInt(), Q_RETURN_ARG(QVariant, retValue),
                                  Q_ARG(QVariant, parameter0)
                                  );
    }
    else if (parameter2.isNull()) {
        QMetaObject::invokeMethod(object, method.toLocal8Bit().data(), (Qt::ConnectionType)connectionType.toInt(), Q_RETURN_ARG(QVariant, retValue),
                                  Q_ARG(QVariant, parameter0),
                                  Q_ARG(QVariant, parameter1)
                                  );
    }
    else if (parameter3.isNull()) {
        QMetaObject::invokeMethod(object, method.toLocal8Bit().data(), (Qt::ConnectionType)connectionType.toInt(), Q_RETURN_ARG(QVariant, retValue),
                                  Q_ARG(QVariant, parameter0),
                                  Q_ARG(QVariant, parameter1),
                                  Q_ARG(QVariant, parameter2)
                                  );
    }
    else if (parameter4.isNull()) {
        QMetaObject::invokeMethod(object, method.toLocal8Bit().data(), (Qt::ConnectionType)connectionType.toInt(), Q_RETURN_ARG(QVariant, retValue),
                                  Q_ARG(QVariant, parameter0),
                                  Q_ARG(QVariant, parameter1),
                                  Q_ARG(QVariant, parameter2),
                                  Q_ARG(QVariant, parameter3)
                                  );
    }
    else if (parameter5.isNull()) {
        QMetaObject::invokeMethod(object, method.toLocal8Bit().data(), (Qt::ConnectionType)connectionType.toInt(), Q_RETURN_ARG(QVariant, retValue),
                                  Q_ARG(QVariant, parameter0),
                                  Q_ARG(QVariant, parameter1),
                                  Q_ARG(QVariant, parameter2),
                                  Q_ARG(QVariant, parameter3),
                                  Q_ARG(QVariant, parameter4)
                                  );
    }
    else if (parameter6.isNull()) {
        QMetaObject::invokeMethod(object, method.toLocal8Bit().data(), (Qt::ConnectionType)connectionType.toInt(), Q_RETURN_ARG(QVariant, retValue),
                                  Q_ARG(QVariant, parameter0),
                                  Q_ARG(QVariant, parameter1),
                                  Q_ARG(QVariant, parameter2),
                                  Q_ARG(QVariant, parameter3),
                                  Q_ARG(QVariant, parameter4),
                                  Q_ARG(QVariant, parameter5)
                                  );
    }
    else if (parameter7.isNull()) {
        QMetaObject::invokeMethod(object, method.toLocal8Bit().data(), (Qt::ConnectionType)connectionType.toInt(), Q_RETURN_ARG(QVariant, retValue),
                                  Q_ARG(QVariant, parameter0),
                                  Q_ARG(QVariant, parameter1),
                                  Q_ARG(QVariant, parameter2),
                                  Q_ARG(QVariant, parameter3),
                                  Q_ARG(QVariant, parameter4),
                                  Q_ARG(QVariant, parameter5),
                                  Q_ARG(QVariant, parameter6)
                                  );
    }
    else if (parameter8.isNull()) {
        QMetaObject::invokeMethod(object, method.toLocal8Bit().data(), (Qt::ConnectionType)connectionType.toInt(), Q_RETURN_ARG(QVariant, retValue),
                                  Q_ARG(QVariant, parameter0),
                                  Q_ARG(QVariant, parameter1),
                                  Q_ARG(QVariant, parameter2),
                                  Q_ARG(QVariant, parameter3),
                                  Q_ARG(QVariant, parameter4),
                                  Q_ARG(QVariant, parameter5),
                                  Q_ARG(QVariant, parameter6),
                                  Q_ARG(QVariant, parameter7)
                                  );
    }
    else if (parameter9.isNull()) {
        QMetaObject::invokeMethod(object, method.toLocal8Bit().data(), (Qt::ConnectionType)connectionType.toInt(), Q_RETURN_ARG(QVariant, retValue),
                                  Q_ARG(QVariant, parameter0),
                                  Q_ARG(QVariant, parameter1),
                                  Q_ARG(QVariant, parameter2),
                                  Q_ARG(QVariant, parameter3),
                                  Q_ARG(QVariant, parameter4),
                                  Q_ARG(QVariant, parameter5),
                                  Q_ARG(QVariant, parameter6),
                                  Q_ARG(QVariant, parameter7),
                                  Q_ARG(QVariant, parameter8)
                                  );
    }
    else {
        QMetaObject::invokeMethod(object, method.toLocal8Bit().data(), (Qt::ConnectionType)connectionType.toInt(), Q_RETURN_ARG(QVariant, retValue),
                                  Q_ARG(QVariant, parameter0),
                                  Q_ARG(QVariant, parameter1),
                                  Q_ARG(QVariant, parameter2),
                                  Q_ARG(QVariant, parameter3),
                                  Q_ARG(QVariant, parameter4),
                                  Q_ARG(QVariant, parameter5),
                                  Q_ARG(QVariant, parameter6),
                                  Q_ARG(QVariant, parameter7),
                                  Q_ARG(QVariant, parameter8),
                                  Q_ARG(QVariant, parameter9)
                                  );
    }
    return retValue;

}

QVariant Invoker::Invoke(QObject *object, const QVariant &method, const QVariant connectionType, const QVariant &parameter0, const QVariant &parameter1, const QVariant &parameter2, const QVariant &parameter3, const QVariant &parameter4, const QVariant &parameter5, const QVariant &parameter6, const QVariant &parameter7, const QVariant &parameter8)
{
    return Method(object, "invoke", connectionType, method, parameter0, parameter1, parameter2, parameter3, parameter4, parameter5, parameter6, parameter7, parameter8);
}

QVariant Invoker::method(QObject *object, const QString &method, const QVariant connectionType, const QVariant &parameter0, const QVariant &parameter1, const QVariant &parameter2, const QVariant &parameter3, const QVariant &parameter4, const QVariant &parameter5, const QVariant &parameter6, const QVariant &parameter7, const QVariant &parameter8, const QVariant &parameter9)
{
    return Method(object, method, connectionType, parameter0, parameter1, parameter2, parameter3, parameter4, parameter5, parameter6, parameter7, parameter8, parameter9);
}

QVariant Invoker::invoke(QObject *object, const QVariant &method, const QVariant connectionType, const QVariant &parameter0, const QVariant &parameter1, const QVariant &parameter2, const QVariant &parameter3, const QVariant &parameter4, const QVariant &parameter5, const QVariant &parameter6, const QVariant &parameter7, const QVariant &parameter8)
{
    return Method(object, "invoke", connectionType, method, parameter0, parameter1, parameter2, parameter3, parameter4, parameter5, parameter6, parameter7, parameter8);
}
