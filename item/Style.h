#ifndef STYLE_H
#define STYLE_H

#include <QObject>
#include <QVariant>
#include <QString>

class Style : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariant style READ style WRITE setStyle NOTIFY styleChanged)
public:
    explicit Style(QObject *parent = 0);
    static Style *Instance();
    static Style *instance;

public:
    QVariant style() const;
    void setStyle(const QVariant &style);
    
signals:
    void styleChanged();
    
private:
    QVariant m_style;
};

#endif // STYLE_H
