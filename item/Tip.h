#ifndef TIP_H
#define TIP_H

#include <QDeclarativeItem>

class Tip : public QDeclarativeItem
{
    Q_OBJECT
    Q_PROPERTY(QString text READ text WRITE setText)
public:
    explicit Tip(QDeclarativeItem *parent = 0);
    QString text() const;
    void setText(const QString &t);
    
signals:
    
public slots:
    
};

QML_DECLARE_TYPE(Tip)

#endif // TIP_H
