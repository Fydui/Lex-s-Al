import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import my.Gevent 1.0
ApplicationWindow {
    visible: true
    width: 960
    height: 540
    title: qsTr("Game");
    maximumHeight: 540;
    maximumWidth: 960;
    minimumHeight: 540;
    minimumWidth: 960;

    property int onex: 0

    Image {
        id: bg_sea
        x: 0
        clip: true
        source: "///Data/imge/BG_sea.png"
        SequentialAnimation on x {
            loops: Animation.Infinite       //无限循环
            PropertyAnimation {
                properties: ;
                easing.type: Easing.Linear;//InCubic;
                duration: 3000
                to: 920;
            }
        }
    }

    Image {
        id: bg_sea_sec
        x: -960
        source: "///Data/imge/BG_sea.png"
        clip: true
        SequentialAnimation on x {
            loops: Animation.Infinite
            PropertyAnimation {
                properties: ;
                easing.type: Easing.Linear;//InCubic;
                easing.amplitude:0.1;
                duration: 3000;
                to: 0;
            }
        }
    }

    Image {
        id: shore
        source: "///Data/imge/shore.png"
    }
/*
    Image {
        id: random_refresh
        source: path
        x: 0
        y: Dy
    }*/
    Image {
        id: figure;
        x: 850;
        y: 120;
        source: "///Data/imge/Lexinton_l.png";
    }
    Item {
        id: key
        focus: true
       //Keys.enabled: true
        Keys.onPressed: {
            if(event.key === Qt.Key_Up){
                if(figure.y > 40)
                    figure.y -= 10;
            }
            else if(event.key === Qt.Key_Down){
                if(figure.y < 390)
                    figure.y += 10;
            }
            else if(event.key === Qt.Key_Left){
                if(figure.x > 0)
                    figure.x -= 10
            }
            else if(event.key === Qt.Key_Right){
                if(figure.x < 850)
                    figure.x += 10
            }
        }
    }

}

