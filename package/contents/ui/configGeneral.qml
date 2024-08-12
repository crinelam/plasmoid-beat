import QtQuick
import QtQuick.Controls as QQC2
import org.kde.kirigami as Kirigami

Kirigami.FormLayout {
    id: page

    property alias cfg_decimals: decimals.checked

    QQC2.CheckBox {
        id: decimals
        text: "Show decimals"
    }
}