// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls
import QMortgage

Window {
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

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

