#ifndef SETTINGS_H
#define SETTINGS_H

#include <QSettings>
#include <QString>
#include <QVariant>
#include <QStringList>

class Settings : public QObject
{
    Q_OBJECT
public:
    explicit Settings(QObject *parent = 0);
    
signals:
    
public slots:
    void setFileName(const QString &filename = QString());
    QStringList allKeys() const;
    void beginGroup(const QString &prefix);
    QStringList childGroups() const;
    QStringList childKeys() const;
    void clear();
    bool contains(const QString &key) const;
    void endGroup();
    QString fileName() const;
    QString group() const;
    bool isWritable() const;
    void remove(const QString &key);
    void setValue(const QString &key, const QVariant &value);
    void sync();
    QVariant value(const QString &key, const QVariant &defaultValue = QVariant()) const;
    void setIniCodec(const QString &codecName);

private:
    QSettings *setting;
};

#endif // SETTINGS_H
