#ifndef UTIL_H
#define UTIL_H

#include <QObject>
#include <QString>
#include <QVariant>
#include <QImage>
#include <QIcon>
#include <QGraphicsItem>
#include <QGraphicsView>
#include <QGraphicsScene>

class PopWindow;
class ToolTip;

class Util : public QObject
{
    Q_OBJECT
public:
    explicit Util(QObject *parent = 0);
    ~Util();

private:
    void init();
    
signals:
    
public slots:
    void debug(const QVariant &msg);
    void warning(const QVariant &msg);
    void critical(const QVariant &msg);
    void fatal(const QString &msg);
    bool openUrl(const QString &url);
    bool openStandardLocation(int type);

    QVariant getColor(const QString &defaultValue);
    QVariant getFont(const QString &defaultValue);
    QVariant getOpenFileName();
    QVariant getOpenFileNames();
    QVariant getSaveFileName();
    QVariant getExistingDirectory();
    QVariant getStandardLocation(int type);

    QImage getFileIcon(const QString &file);
    QIcon getIcon(const QString &fileName);
    QVariant getFileInfoList(const QString &path);

    QVariant showDialog(const QString &qml, const QVariant &parameter = QVariant(), QObject *parent = NULL);
    QObject *showWindow(const QString &qml, const QVariant &parameter = QVariant(), QObject *parent = NULL);
    QObject *popWindow(const QString &qml, const QVariant &parameter = QVariant(), QObject *parent = 0);
    QObject *showToolTip(const QString &qml, const QVariant &parameter = QVariant(), QObject *parent = 0);
    void hideToolTip();
    QObject *toolTip();
    QObject *getTopParentWidget(QObject *item);

    QPoint cursorPosition();
    QPoint mapToWindow(QObject *item);
    QPoint mapToScreen(QObject *item);

    QRect screenAvailableGeometry();
    QRect screenGeometry();
    QString makeUrl(const QVariantMap &urlInfo);
    QString format(const QString &content, const QVariantList &parameters);

private:
    PopWindow *m_popWindow;
    ToolTip *m_toolTip;
};

#endif // UTIL_H
