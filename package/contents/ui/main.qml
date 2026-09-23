/* =========================================================================
 *
 * kde-digital-clock
 * Copyright (C) 2026 sonnytricky
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 * 
 * ========================================================================== */

import QtQuick 2.15
import QtQuick.Layouts 1.15
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 3.0 as PlasmaComponents

PlasmoidItem {
    id: root

    // Optimale Größe definieren
    implicitWidth: clockLabel.implicitWidth + 20
    implicitHeight: clockLabel.implicitHeight + 10

    // JavaScript-Funktion zur Formatierung der Uhrzeit
    function updateTime() {
        var now = new Date();
        var hours = String(now.getHours()).padStart(2, '0');
        var minutes = String(now.getMinutes()).padStart(2, '0');
        var seconds = String(now.getSeconds()).padStart(2, '0');
        
        return hours + ":" + minutes + ":" + seconds;
    }

    // Timer, der jede Sekunde die Zeit aktualisiert
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            clockLabel.text = root.updateTime()
        }
    }

    // UI-Element: Der Text der Uhr
    PlasmaComponents.Label {
        id: clockLabel
        anchors.centerIn: parent
        text: root.updateTime()
        font.pixelSize: 24
        font.bold: true
    }
}