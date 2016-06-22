#ifndef INVOKER_H
#define INVOKER_H

#include <QObject>
#include <QVariant>
#include <QString>

class Invoker : public QObject
{
    Q_OBJECT
public:
    explicit Invoker(QObject *parent = 0);
    static QVariant Method(QObject *object,
                           const QString &method,
                           const QVariant connectionType = Qt::AutoConnection,
                           const QVariant &parameter0 = QVariant(),
                           const QVariant &parameter1 = QVariant(),
                           const QVariant &parameter2 = QVariant(),
                           const QVariant &parameter3 = QVariant(),
                           const QVariant &parameter4 = QVariant(),
                           const QVariant &parameter5 = QVariant(),
                           const QVariant &parameter6 = QVariant(),
                           const QVariant &parameter7 = QVariant(),
                           const QVariant &parameter8 = QVariant(),
                           const QVariant &parameter9 = QVariant()
            );
    static QVariant Invoke(QObject *object,
                           const QVariant &method,
                           const QVariant connectionType = Qt::AutoConnection,
                           const QVariant &parameter0 = QVariant(),
                           const QVariant &parameter1 = QVariant(),
                           const QVariant &parameter2 = QVariant(),
                           const QVariant &parameter3 = QVariant(),
                           const QVariant &parameter4 = QVariant(),
                           const QVariant &parameter5 = QVariant(),
                           const QVariant &parameter6 = QVariant(),
                           const QVariant &parameter7 = QVariant(),
                           const QVariant &parameter8 = QVariant()
            );
    
signals:
    
public slots:
    QVariant method(QObject *object,
                    const QString &method,
                    const QVariant connectionType = Qt::AutoConnection,
                    const QVariant &parameter0 = QVariant(),
                    const QVariant &parameter1 = QVariant(),
                    const QVariant &parameter2 = QVariant(),
                    const QVariant &parameter3 = QVariant(),
                    const QVariant &parameter4 = QVariant(),
                    const QVariant &parameter5 = QVariant(),
                    const QVariant &parameter6 = QVariant(),
                    const QVariant &parameter7 = QVariant(),
                    const QVariant &parameter8 = QVariant(),
                    const QVariant &parameter9 = QVariant()
            );
    QVariant invoke(QObject *object,
                    const QVariant &method,
                    const QVariant connectionType = Qt::AutoConnection,
                    const QVariant &parameter0 = QVariant(),
                    const QVariant &parameter1 = QVariant(),
                    const QVariant &parameter2 = QVariant(),
                    const QVariant &parameter3 = QVariant(),
                    const QVariant &parameter4 = QVariant(),
                    const QVariant &parameter5 = QVariant(),
                    const QVariant &parameter6 = QVariant(),
                    const QVariant &parameter7 = QVariant(),
                    const QVariant &parameter8 = QVariant()
            );
};

#endif // INVOKER_H
