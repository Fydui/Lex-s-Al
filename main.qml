import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {    
    visible: true
    width: 960
    height: 540
    title: qsTr("Game");
    maximumHeight: 540;
    maximumWidth: 960;
    minimumHeight: 540;
    minimumWidth: 960;

    Image {
        id: bg_sea
        source: "///Data/imge/BG_sea.png"
    }

    Image {
        id: shore
        source: "///Data/imge/shore.png"
    }
}

