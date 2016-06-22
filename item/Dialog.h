#ifndef DIALOG_H
#define DIALOG_H

#include <QDialog>
#include <QVariant>
#include <QString>
#include <QDeclarativeView>
#include <QEventLoop>

class Dialog : public QDeclarativeView
{
    Q_OBJECT
    Q_PROPERTY(QVariant results READ getResults WRITE setResults NOTIFY resultsChanged)
    
public:
    explicit Dialog(QWidget *parent = 0);
    ~Dialog();

private:
    void init();
    void setupSignalSlot();
    void initDialogProperty(const QVariantMap &prop);
    void setModal();

protected:
    void focusInEvent(QFocusEvent *event);

public slots:
    void close();
    void showDialog(const QString &qml, const QVariant &parameter = QVariant());
    QVariant invoke(const QVariant &method, const QVariant &parameter = QVariant());

signals:
    void resultsChanged();
    void windowEvent(const QVariant &event);

public:
    QVariant getResults();
    void setResults(QVariant results);

private:
    QVariant m_results;
    QEventLoop eventloop;
};

#endif // DIALOG_H
