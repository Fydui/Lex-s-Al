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

    property int sum: 3
    Item {
        Image {
            id: sg1
            x:340
            y:10
            source: "///Data/imge/SG.png"
        }
        Image {
            id: sg2
            x:410
            y:10
            source: "///Data/imge/SG.png"
        }
        Image {
            id: sg3
            x:480
            y:10
            source: "///Data/imge/SG.png"
        }
    }

    //property int fx: 850;//玩家的x坐标
    //property int fy: 40//120;//玩家的y坐标

    //我觉得下面这几个Image应该写成函数 卧槽 我为啥要用QML
    function myCheck(){
        var pd = myEvent.ifcollision(row_1.x,row_1.y,figure.x,figure.y)
        if(pd === true){
            //figure.x -= 200;
            sum--;
            if(sum !== 0){
                if(sum === 2) sg1.y = -60
                else if(sum === 1) sg2.y = -60
            }
        }
    }

    Image {
        id: row_1
        source: "///Data/imge/SH_CA.png"
        y: 200
        clip: true
        SequentialAnimation on x {
            PropertyAnimation {
                loops: Animation.Infinite
                easing.type: Easing.InQuart;
                duration: 15000
                to: 1500
            }
        }
        onXChanged: {
            myCheck();
        }
    }/*
    Image {
        id: row_2
        source: "///Data/imge/SH_CLT.png"
        x: 0
        y: 160
        SequentialAnimation on x {
            PropertyAnimation {
                loops: Animation.Infinite
                easing.type: Easing.OutInQuad;
                duration: 11000
                to: 1500
            }
        }
    }

    Image {
        id: row_3
        source: "///Data/imge/SH_DD.png"
        x: 0
        y: 280
        SequentialAnimation on x {
            PropertyAnimation {
                loops: Animation.Infinite
                easing.type: Easing.InQuad;
                duration: 9000
                to: 1500
            }
        }

    }

    Image {
        id: row_4
        source: "///Data/imge/SH_CV.png"
        x: 0
        y: 400
        SequentialAnimation on x {
            PropertyAnimation {
                loops: Animation.Infinite
                easing.type: Easing.Linear;
                duration: 18000
                to: 1500
            }
        }

    }

    Image {
        id: row_1p
        source: "///Data/imge/SH_CV.png"
        x: 0
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

    }
    Image {
        id: row_2p
        source: "///Data/imge/SH_CA.png"
        x: 0
        y: 160
        SequentialAnimation on x {
            PropertyAnimation {
                loops: Animation.Infinite
                easing.type: Easing.OutInQuart;
                duration: 14000
                to: 1500
            }
        }

    }

    Image {
        id: row_3p
        source: "///Data/imge/SH_CLT.png"
        x: 0
        y: 280
        SequentialAnimation on x {
            PropertyAnimation {
                loops: Animation.OutSine
                easing.type: Easing.Linear;
                duration: 12000
                to: 1500
            }
        }

    }


    Image {
        id: row_4p
        source: "///Data/imge/SH_DD.png"
        x: 0
        y: 400
        SequentialAnimation on x {
            PropertyAnimation {
                loops: Animation.InOutQuint
                easing.type: Easing.Linear;
                duration: 10000
                to: 1500
            }
        }

    }*/

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

