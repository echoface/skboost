#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "source/imageconvertor.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    ImageConvertor img_convertor;

    //QString source("/Users/gh/psb.jpeg");
    //QString target("/Users/gh/new.jpg");
    //if (img_convertor.ConvertAndSave(source, target, QSize(512,512))) {
        //printf("ok success");
    //}

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    QString img_cvt = "ImageConvertor";
    QQmlContext* qml_context = engine.rootContext();
    qml_context->setContextProperty(img_cvt,&img_convertor);

    return app.exec();
}
