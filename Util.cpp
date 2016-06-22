#include "Util.h"
#include "item/Dialog.h"
#include "item/Window.h"
#include "item/PopWindow.h"
#include "item/ToolTip.h"

#include <QDesktopServices>
#include <QDesktopWidget>
#include <QUrl>
#include <QColorDialog>
#include <QColor>
#include <QFontDialog>
#include <QFont>
#include <QFileDialog>
#include <QStringList>
#include <QFileIconProvider>
#include <QIcon>
#include <QDir>
#include <QFileInfo>
#include <QCursor>
#include <QToolTip>
#include <QEventLoop>
#include <QRegExp>
#include <QDebug>

Util::Util(QObject *parent) :
    QObject(parent)
{
    init();
}

Util::~Util()
{
    delete m_popWindow;
    delete m_toolTip;
}

void Util::init()
{
    m_popWindow = new PopWindow();
    m_toolTip = new ToolTip();
}

void Util::debug(const QVariant &msg)
{
    qDebug() << msg;
}

void Util::warning(const QVariant &msg)
{
    qWarning() << msg;
}

void Util::critical(const QVariant &msg)
{
    qCritical() << msg;
}

void Util::fatal(const QString &msg)
{
    qFatal(msg.toLocal8Bit().data());
}

bool Util::openUrl(const QString &url)
{
    return QDesktopServices::openUrl(url);
}

bool Util::openStandardLocation(int type)
{
    return openUrl(QDesktopServices::storageLocation((QDesktopServices::StandardLocation)type).replace('\\', '/'));
}

QVariant Util::getColor(const QString &defaultValue)
{
    QColorDialog dlg(defaultValue);
    if (dlg.exec() == QColorDialog::Accepted) {
        return dlg.currentColor().name();
    }
    return defaultValue;
}

QVariant Util::getFont(const QString &defaultValue)
{
    bool ok = false;
    QFont font = QFontDialog::getFont(&ok, defaultValue);
    if (ok) {
        return font.family();
    }
    return defaultValue;
}

QVariant Util::getOpenFileName()
{
    return QFileDialog::getOpenFileName();
}

QVariant Util::getOpenFileNames()
{
    return QFileDialog::getOpenFileNames();
}

QVariant Util::getSaveFileName()
{
    return QFileDialog::getSaveFileName();
}

QVariant Util::getExistingDirectory()
{
    return QFileDialog::getExistingDirectory();
}

QVariant Util::getStandardLocation(int type)
{
    return QDesktopServices::storageLocation((QDesktopServices::StandardLocation)type).replace('\\', '/');
}

QImage Util::getFileIcon(const QString &file)
{
    QIcon icon = QFileIconProvider().icon(file);
    return icon.pixmap(icon.actualSize(QSize(256, 256))).toImage();
}

QIcon Util::getIcon(const QString &fileName)
{
    return QIcon(fileName);
}

QVariant Util::getFileInfoList(const QString &path)
{
    QVariantList list;
    QDir dir(path);
    foreach (QFileInfo file, dir.entryInfoList(QDir::NoDotAndDotDot)) {
        QVariantMap info;
        info["name"] = file.fileName();
        info["type"] = file.isDir()
                ? "dir"
                : file.isFile()
                  ? "file"
                  : file.isSymLink()
                    ? "symlink"
                    : "unknown";
        if (info["type"].toString() == "symlink") {
            info["path"] = file.symLinkTarget();
        }
        else {
            info["path"] = file.filePath();
        }
        list << info;
    }
    return list;
}

QVariant Util::showDialog(const QString &qml, const QVariant &parameter, QObject *parent)
{
    Dialog *dlg = new Dialog(qobject_cast<QWidget *>(parent));
    dlg->showDialog(qml, parameter);
    QVariant ret = dlg->getResults();
    delete dlg;
    return ret;
}

QObject *Util::showWindow(const QString &qml, const QVariant &parameter, QObject *parent)
{
    Window *window = new Window(qobject_cast<QWidget *>(parent));
    window->showWindow(qml, parameter);
    return (QObject*)window;
}

QObject *Util::popWindow(const QString &qml, const QVariant &parameter, QObject *parent)
{
    m_popWindow->initWindow(qml, parameter);
    QRect itemRect(0, 0, 1, 1);
    QPoint pt;
    if (parent) {
        QGraphicsItem *qmlItem = qobject_cast<QGraphicsItem*>(parent);
        itemRect = qmlItem->boundingRect().toRect();
        pt = mapToScreen(parent);
    }
    else {
        pt = cursorPosition();
    }
    QDesktopWidget dw;
    QRect screenRect = dw.availableGeometry();
    itemRect.moveTo(pt);
    QRect popWindowRect = m_popWindow->rect();
    if (itemRect.bottom() + popWindowRect.height() < screenRect.bottom()) {
        if (itemRect.left() + popWindowRect.width() < screenRect.right()) {
            m_popWindow->move(itemRect.bottomLeft());
        }
        else {
            m_popWindow->move(screenRect.right() - popWindowRect.width(), itemRect.bottom());
        }
    }
    else {
        if (itemRect.left() + popWindowRect.width() < screenRect.right()) {
            m_popWindow->move(itemRect.left(), itemRect.top() - popWindowRect.height());
        }
        else {
            m_popWindow->move(screenRect.right() - popWindowRect.width(), itemRect.top() - popWindowRect.height());
        }
    }
    m_popWindow->setParent(qobject_cast<QWidget*>(getTopParentWidget(parent)), Qt::Window | Qt::FramelessWindowHint);
    m_popWindow->show();
    return (QObject*)m_popWindow;
}

QObject *Util::showToolTip(const QString &qml, const QVariant &parameter, QObject *parent)
{
    m_toolTip->setWindowSource(qml, parameter);
    QRect itemRect(0, 0, 1, 1);
    QPoint pt;
    if (parent) {
        QGraphicsItem *qmlItem = qobject_cast<QGraphicsItem*>(parent);
        itemRect = qmlItem->boundingRect().toRect();
        pt = mapToScreen(parent);
    }
    else {
        pt = cursorPosition();
    }
    QDesktopWidget dw;
    QRect screenRect = dw.availableGeometry();
    itemRect.moveTo(pt);
    QRect popWindowRect = m_toolTip->rect();
    if (itemRect.bottom() + popWindowRect.height() < screenRect.bottom()) {
        if (itemRect.left() + popWindowRect.width() < screenRect.right()) {
            m_toolTip->move(itemRect.bottomLeft());
        }
        else {
            m_toolTip->move(screenRect.right() - popWindowRect.width(), itemRect.bottom());
        }
    }
    else {
        if (itemRect.left() + popWindowRect.width() < screenRect.right()) {
            m_toolTip->move(itemRect.left(), itemRect.top() - popWindowRect.height());
        }
        else {
            m_toolTip->move(screenRect.right() - popWindowRect.width(), itemRect.top() - popWindowRect.height());
        }
    }
    m_toolTip->show();
    return (QObject*)m_toolTip;
}

void Util::hideToolTip()
{
    m_toolTip->hide();
}

QObject *Util::toolTip()
{
    return m_toolTip;
}

QPoint Util::cursorPosition()
{
    return QCursor::pos();
}

QPoint Util::mapToWindow(QObject *item)
{
    QPoint point(-1, -1);
    QGraphicsItem *qmlItem = qobject_cast<QGraphicsItem*>(item);
    if (qmlItem) {
        point = qmlItem->mapToScene(0, 0).toPoint();
    }
    return point;
}

QPoint Util::mapToScreen(QObject *item)
{
    QPoint point(-1, -1);
    QGraphicsItem *qmlItem = qobject_cast<QGraphicsItem*>(item);
    if (qmlItem) {
        QPoint pt = qmlItem->mapToScene(0, 0).toPoint();
        QWidget *w = qmlItem->scene()->views()[0];
        while (w) {
            pt = pt + w->geometry().topLeft();
            if (w->parentWidget()) {
                w = w->parentWidget();
            }
            else {
                break;
            }
        }
        point = pt;
    }
    return point;
}

QRect Util::screenAvailableGeometry()
{
    QDesktopWidget dw;
    return dw.availableGeometry();
}

QRect Util::screenGeometry()
{
    QDesktopWidget dw;
    return dw.screenGeometry();
}

QString Util::makeUrl(const QVariantMap &urlInfo)
{
    QUrl url(urlInfo["authority"].toString());
    QVariantMap parameter = urlInfo["parameter"].toMap();
    foreach (QString key, parameter.keys()) {
        url.addQueryItem(key, parameter[key].toString());
    }
    return url.toEncoded();
}

QString Util::format(const QString &content, const QVariantList &parameters)
{
    QString ret = content;
    foreach (QVariant parameter, parameters) {
        ret = QString(ret).arg(parameter.toString());
    }
    return ret;
}

QObject *Util::getTopParentWidget(QObject *item)
{
    QWidget *pw = NULL;
    QGraphicsItem *qmlItem = qobject_cast<QGraphicsItem*>(item);
    if (qmlItem) {
        pw = qmlItem->scene()->views()[0];
        while (pw) {
            if (pw->parentWidget()) {
                pw = pw->parentWidget();
            }
            else {
                break;
            }
        }
    }
    return (QObject*)pw;
}



















