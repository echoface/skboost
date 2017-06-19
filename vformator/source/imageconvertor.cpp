#include "imageconvertor.h"

#include <QPixmap>
#include <QDebug>


ImageConvertor::ImageConvertor(QObject *parent) : QObject(parent) {

}

bool ImageConvertor::ConvertAndSave(QString source, QString save_name, QSize size) {
    QPixmap pix_image(source);
    qDebug() << "size:" << size.width() << "x" << size.height();
    auto new_image = pix_image.scaled(size.width(), size.height());
    if (new_image.isNull()) {
        return false;
    }
    if (!new_image.save(save_name)) {
        return false;
    }
    return true;
}
