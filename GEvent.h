#ifndef GEVENT_H
#define GEVENT_H
#include <QObject>
#include <QQmlEngine>
class Gevent : public QObject
{
    Q_OBJECT
    //Q_PROPERTY(qint64 nowtime READ times WRITE settime)
    //Q_PROPERTY(qint64 endtime READ endTime WRITE setEndtime)

signals:
    Q_INVOKABLE void posChanged();
    //Q_INVOKABLE void clearlrcview();
public:
    Gevent(QObject *p = 0):QObject(p){}
    ~Gevent(){}
    Q_INVOKABLE bool ifcollision(int Ex,int Ey,int Mx,int My,int iw,int ih);
    Q_INVOKABLE int xRefresh();
    Q_INVOKABLE int yRefresh();
};
#endif // GEVENT_H
