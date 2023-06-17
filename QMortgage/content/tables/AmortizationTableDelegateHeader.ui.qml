

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls

Rectangle {
    id: headingDelegate
    implicitWidth: 100
    implicitHeight: 20
    color: "lightblue"
    Label {
        color: "#20394c"
        text: model.display
        anchors.fill: headingDelegate
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.family: "Roboto"
    }
}
