import QtQuick
import QtQuick.Layouts as Layouts
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid
import org.kde.plasma.components as PlasmaComponents
import org.kde.kirigami as Kirigami


PlasmoidItem {
    id: root

    width: Kirigami.Units.gridUnit * 10
    height: Kirigami.Units.gridUnit * 4

    Layouts.RowLayout {
        id: row
        PlasmaComponents.Label {
            id: time
            text: "@" + getTime()
            font.pointSize: 72
        }
    }

    Timer {
        interval: 100
        running: true
        repeat: true
        onTriggered: updateTime()
    }

    function updateTime() {
        time.text = "@" + getTime()
    }


    function getTime() {
        var date = new Date()
        var hours = date.getUTCHours()
        var minutes = date.getUTCMinutes()
        var seconds = date.getUTCSeconds()
        var milliseconds = date.getUTCMilliseconds()

        hours = hours == 23 ? 0 : hours + 1

        var timeInMilliseconds = ((hours * 60 + minutes) * 60 + seconds) * 1000 + milliseconds
        var millisecondsInABeat = 86400

        if ( plasmoid.configuration.decimals ) {
            return Math.abs(timeInMilliseconds / millisecondsInABeat).toFixed(2)
        } else {
            return Math.floor(Math.abs(timeInMilliseconds / millisecondsInABeat))
        }
    }
}
