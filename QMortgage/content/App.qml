// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls
import QMortgage

ApplicationWindow {
    id: window
    width: 480
    height: 640

    color: "#002b36"

    visible: true
    title: "QMortgage"

    Screen01 {
        id: mainScreen
        anchors{
            fill: parent
            margins: 16
        }
    }
}

