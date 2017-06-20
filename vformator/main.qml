import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    id: window
    visible: true
    width: 960; height: 720;
    minimumHeight: 720; minimumWidth: 960;
    title: qsTr("Fancy Tools")
    property real dpi: Screen.devicePixelRatio.toFixed(2)

    Item {
        anchors.fill: parent
        Rectangle {
            id: header
            height: 48*dpi; color: "orange"
            anchors.left: parent.left; anchors.right: parent.right
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 22*dpi
                text: qsTr("拖动Image文件到下面示例区域")
            }
        }

        Image {
            id: image_source
            anchors.top: header.bottom; anchors.left: parent.left;
            anchors.right: parent.right;anchors.bottom: size_chooser.top
            anchors.margins: 10*dpi
            fillMode: Image.PreserveAspectFit
            source: "qrc:/image/image/image.jpg"
            DropArea {
                anchors.fill: parent
                onDropped: {
                    if (drop.hasUrls) {
                        var url = drop.urls[0]
                        var reg = /[^\s]+\.(jpg|png|bmp|BMP|PNG|JPG|jpeg)$/;
                        if (reg.test(url)) {

                            image_source.source = url;

                            bt_save.source_name = url.slice(7);

                            var arr = url.split('.');
                            var index = cb_img_format.find(arr.pop())
                            if (-1 != index) {
                                cb_img_format.currentIndex = index;
                            }
                            spinbox_width.value = image_source.sourceSize.width;
                            spinbox_height.value = image_source.sourceSize.height;

                            drop.accept();
                        }
                    }
                }
            }

        }
        Rectangle {
            id: bt_save
            width: 48*dpi; height: 48*dpi;
            radius: 32; z: 3;
            anchors.bottom: parent.bottom; anchors.right: parent.right
            property var save_size_width: 512
            property var save_size_height: 512
            property var source_name: ""
            property var save_name: ""
            Image {
                anchors.fill: parent
                source: "qrc:/image/image/save.jpeg"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if (bt_save.source_name.length == 0) {
                        info_dlg.open("Source File Not Recognazed,Try again")
                        return;
                    }

                    fileDialog.open_with_callback(bt_save.folder_selected);

                    var success = ImageConvertor.ConvertAndSave(bt_save.source_name,
                                                                bt_save.save_name,
                                                                Qt.size(bt_save.save_size_width,bt_save.save_size_height));
                    if (success) {
                        info_dlg.open("Ok! File Save in:")
                    }
                }
            }
            function folder_selected(urls) {
                bt_save.save_name = urls[0].slice(7) + "/test.png";
                console.log(bt_save.save_name)
            }
        }
        Rectangle {
            id: size_chooser
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom;
            width: 640*dpi; height: 48*dpi
            property var lable_width: 64*dpi
            property var spinbox_width: 192*dpi
            property var cb_width: 128*dpi
            Label {
                id: l_width
                height: parent.height; width: size_chooser.lable_width
                text: "Width:"
                background: Rectangle {color: "pink"}
                font.pixelSize: 14*dpi
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.left: parent.left
            }
            SpinBox {
                id: spinbox_width
                anchors.left: l_width.right
                height: parent.height; width: size_chooser.spinbox_width
                value: 512; from: 1; to : 65535
                editable: true
                onValueChanged: {
                    bt_save.save_size_width = value;
                }
            }
            Label {
                id: l_height
                height: parent.height; width: size_chooser.lable_width
                text: "Height:"
                background: Rectangle {color: "pink"}
                font.pixelSize: 14*dpi
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.left: spinbox_width.right
            }
            SpinBox {
                id: spinbox_height
                anchors.left: l_height.right
                height: parent.height; width: size_chooser.spinbox_width
                value: 512; from: 1; to : 65535
                editable: true
                onValueChanged: {
                    bt_save.save_size_height = value;
                }
            }
            ComboBox {
                id: cb_img_format
                anchors.left: spinbox_height.right
                height: parent.height;width: size_chooser.cb_width
                model: ["jpg", "png","jpeg"]
            }
        }

        Rectangle {
            id: info_dlg
            visible: false
            anchors.fill: parent;
            anchors.margins: 40*dpi; opacity: 0.85; radius: 40;
            anchors.verticalCenter: parent.verticalCenter;
            anchors.horizontalCenter: parent.horizontalCenter;
            Label {
                id: lable
                anchors.fill: parent
                text: qsTr("")
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 25*dpi
            }
            function open(info) {
                lable.text = info;
                info_dlg.visible = true;
            }
            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    info_dlg.visible = false;
                    lable.text = "";
                }
            }
        }

    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: shortcuts.home
        selectFolder: true
        property var callback: null
        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrls)
            if (fileDialog.callback) {
                fileDialog.callback(fileDialog.fileUrls)
            }
        }
        onRejected: {
            console.log("Canceled")
        }
        Component.onCompleted: visible = false

        function open_with_callback(cb) {
            fileDialog.callback = cb
            fileDialog.open();
        }
    }

/*
    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        nameFilters: [ "Video files (*.mp4 *.flv)"]
        onAccepted: {
            var save_urls = folder.toLocaleString().substring(7) + "/img_";
            save_urls += Math.random().toString(36).substr(2,6) + ".png";
            console.log(save_urls)
            qr_canvas.save(save_urls);
        }
        onRejected: {
            console.log("Canceled")
        }
    }
    */
}
