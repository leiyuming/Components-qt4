#include "Settings.h"

Settings::Settings(QObject *parent) :
    QObject(parent)
{
    setting = NULL;
}

void Settings::setFileName(const QString &filename)
{
    if (filename.isEmpty()) {
        setting = new QSettings(this);
    }
    else {
        setting = new QSettings(filename, QSettings::IniFormat, this);
    }
}

QStringList Settings::allKeys() const
{
    return setting->allKeys();
}

void Settings::beginGroup(const QString &prefix)
{
    setting->beginGroup(prefix);
}

QStringList Settings::childGroups() const
{
    return setting->childGroups();
}

QStringList Settings::childKeys() const
{
    return setting->childKeys();
}

void Settings::clear()
{
    setting->clear();
}

bool Settings::contains(const QString &key) const
{
    return setting->contains(key);
}

void Settings::endGroup()
{
    setting->endGroup();
}

QString Settings::fileName() const
{
    return setting->fileName();
}

QString Settings::group() const
{
    return setting->group();
}

bool Settings::isWritable() const
{
    return setting->isWritable();
}

void Settings::remove(const QString &key)
{
    setting->remove(key);
}

void Settings::setValue(const QString &key, const QVariant &value)
{
    setting->setValue(key, value);
}

void Settings::sync()
{
    setting->sync();
}

QVariant Settings::value(const QString &key, const QVariant &defaultValue) const
{
    return setting->value(key, defaultValue);
}

void Settings::setIniCodec(const QString &codecName)
{
    setting->setIniCodec(codecName.toLocal8Bit().data());
}
