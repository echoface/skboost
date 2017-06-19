#ifndef IMAGECONVERTOR_H
#define IMAGECONVERTOR_H

#include <QObject>
#include <QSize>

class ImageConvertor : public QObject
{
    Q_OBJECT
public:
    explicit ImageConvertor(QObject *parent = 0);

    Q_INVOKABLE bool ConvertAndSave(QString source, QString save_name, QSize size);
signals:

public slots:
};

#endif // IMAGECONVERTOR_H
