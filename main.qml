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

    property int onex: -960
    Image {
        id: bg_sea_sec
        x: onex;
        y: 0;
        source: "///Data/imge/BG_sea.png"
        Image {
            id: bg_sea
            clip: true
            source: "///Data/imge/BG_sea.png"
            SequentialAnimation on x {
                loops: Animation.Infinite       //无限循环
                PropertyAnimation {
                    properties: ;
                    easing.type: Easing.Linear;//InCubic;
                    easing.amplitude:0.1;
                    to: 1920;

                }
            }
        }
    }


    Image {
        id: shore
        source: "///Data/imge/shore.png"
    }

}

