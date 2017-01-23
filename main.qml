﻿import QtQuick 2.7
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

    Image {
        id: bg_sea_static//静态背景
        source: "///Data/imge/BG_sea.png"
    }

    /*          //滚动背景 我觉得看上去晕 所以去掉了
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
*/
    Image {
        id: shore
        source: "///Data/imge/shore.png"
    }

    property bool pd: false
    function myCheck(x1){
        pd = myEvent.ifcollision(x1.x,x1.y,figure.x,figure.y)
        if(pd === true){
            mytime.interval = false;
            read.source = "///Data/imge/read.png"
            speak.text = "GAME OVER!\n       您坚持了:"+ timetext.text + "s"
            figure.source = ""
        }
    }


    property int c: 0
    function timed(){
        timetext.text = c;
        c += 1;
    }
    Timer {
        id: mytime
        interval: 1000;
        running: true;
        repeat: true;
        onTriggered: timed();
    }
    Text {
        id: timetext
        font.pointSize: 25
        color: "red"
        text: ""
    }

    Item{
        width: 960
        height:540
        Image {
            id:read
            anchors.centerIn: parent;
            source: ""
        }
        Text {
            id: speak
            font.pointSize: 24
            anchors.centerIn: parent
            text: ""
        }
    }

    Text {

        id:gameover
        font.pointSize: 24
    }
    Image {
        id: row_1
        source: "///Data/imge/SH_CA.png"
        y: 40
        clip: true
        SequentialAnimation on x {
            PropertyAnimation {
                loops: Animation.Infinite
                easing.type: Easing.InQuart;
                duration: 15000
                to: 1500
            }
        }
        onXChanged: myCheck(row_1);
    }
    Image {
        id: row_2
        source: "///Data/imge/SH_CLT.png"
        y: 160
        clip: true
        SequentialAnimation on x {
            PropertyAnimation {
                loops: Animation.Infinite
                easing.type: Easing.OutInQuad;
                duration: 11000
                to: 1500
            }
        }
        onXChanged: myCheck(row_2);
    }

    Image {
        id: row_3
        source: "///Data/imge/SH_DD.png"
        y: 280
        clip: true
        SequentialAnimation on x {
            PropertyAnimation {
                loops: Animation.Infinite
                easing.type: Easing.InQuad;
                duration: 9000
                to: 1500
            }
        }
        onXChanged: myCheck(row_3);
    }

    Image {
        id: row_4
        source: "///Data/imge/SH_CV.png"
        y: 400
        clip: true
        SequentialAnimation on x {
            PropertyAnimation {
                loops: Animation.Infinite
                easing.type: Easing.Linear;
                duration: 18000
                to: 1500
            }
        }
        onXChanged: myCheck(row_4);
    }

    Image {
        id: row_1p
        source: "///Data/imge/SH_CV.png"
        y: 40
        clip: true
        SequentialAnimation on x {
            PropertyAnimation {
                loops: Animation.Infinite
                easing.type: Easing.Linear;
                duration: 16000
                to: 1500
            }
        }
        onXChanged: myCheck(row_1p);
    }
    Image {
        id: row_2p
        source: "///Data/imge/SH_CA.png"
        y: 160
        SequentialAnimation on x {
            PropertyAnimation {
                loops: Animation.Infinite
                easing.type: Easing.OutInQuart;
                duration: 14000
                to: 1500
            }
        }
        onXChanged: myCheck(row_2p);
    }

    Image {
        id: row_3p
        source: "///Data/imge/SH_CLT.png"
        y: 280
        SequentialAnimation on x {
            PropertyAnimation {
                loops: Animation.OutSine
                easing.type: Easing.Linear;
                duration: 12000
                to: 1500
            }
        }
        onXChanged: myCheck(row_3p);
    }


    Image {
        id: row_4p
        source: "///Data/imge/SH_DD.png"
        y: 400
        SequentialAnimation on x {
            PropertyAnimation {
                loops: Animation.InOutQuint
                easing.type: Easing.Linear;
                duration: 10000
                to: 1500
            }
        }
        onXChanged: myCheck(row_4p);
    }

    Image {
        id: figure;
        x: 850;
        y: 40;
        source: "///Data/imge/Lexinton_l.png";
    }

    Item {
        id: key
        focus: true
        //Keys.enabled: true
        Keys.onPressed: {
            if(event.key === Qt.Key_Up){
                if(figure.y > 40)
                    figure.y -= 20;
            }
            else if(event.key === Qt.Key_Down){
                if(figure.y < 390)
                    figure.y += 20;
            }
            else if(event.key === Qt.Key_Left){
                if(figure.x > 0)
                    figure.x -= 20
            }
            else if(event.key === Qt.Key_Right){
                if(figure.x < 850)
                    figure.x += 20
            }
        }
    }

}

