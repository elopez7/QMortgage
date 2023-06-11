

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls

Item {
    id: delegate
    implicitWidth: 100
    implicitHeight: 20

    Rectangle {
        id: rectangle
        anchors.fill: delegate
        color: "white"
        Label {
            color: "black"
            text: tableData
        }
    }
}
