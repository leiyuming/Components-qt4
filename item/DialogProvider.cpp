#include "dialogprovider.h"
#include "dialog.h"

#include <QColorDialog>
#include <QColor>
#include <QFontDialog>
#include <QFont>
#include <QFileDialog>
#include <QSettings>
#include <QDebug>

DialogProvider::DialogProvider(QObject *parent) :
    QObject(parent)
{
    parentWidget = NULL;
}

void DialogProvider::setParentWidget(QWidget *widget)
{
    parentWidget = widget;
}

QVariant DialogProvider::showDialog(const QString &qml, const QVariant &parameter)
{
    Dialog *dlg = new Dialog(parentWidget);
    dlg->showDialog(qml, parameter);
    QVariant ret = dlg->getResult();
    delete dlg;
    return ret;
}
