
import QtQuick 2.7
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import my.Gevent 1.0
import QtMultimedia 5.5

ApplicationWindow {
    visible: true
    width: 960
    height: 540
    title: qsTr("Game");
    maximumHeight: 540;
    maximumWidth: 960;
    minimumHeight: 540;
    minimumWidth: 960;

    Audio {
        id:bgm
        source: "///Data/2nd_anniversary_c.mp3"
    }

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
        pd = myEvent.ifcollision(x1.x,x1.y,figure.x,figure.y,80,95)
        if(pd === true){
            mytime.interval = false;
            read.source = "///Data/imge/read.png"
            speak.text = "GAME OVER!\n       您坚持了:"+ timetext.text + "\n您收集了" + alsum +"块铝";
            figure.source = "";
            mytime.stop();
        }
    }


    property int c: 0
    function timed(){
        timetext.text = "您坚持了:"+c+"秒";
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
            MouseArea {
                width: parent.width
                height: parent.height
                onClicked: {
                    figure.source = "///Data/imge/Lexinton_l.png"
                    c = 0;
                    alsum = 0;
                    read.source = ""
                    speak.text = ""
                    mytime.start()
                    mytime.restart()
                    mytime.running = true;
                    mytime.repeat = true;
                }
            }
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
        onXChanged: {
            myCheck(row_1);
            bgm.play()
        }
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
        source: "///Data/imge/SH_BC.png"
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
        source: "///Data/imge/SH_BB.png"
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
/*
    Timer {
        id:xyRefresh
        interval: 1000;
        running: true;
        repeat: true;
        onTriggered: {
            al.x = myEvent.xRefresh();
            al.y = myEvent.yRefresh();
        }
    }*/
    property int alsum: 0
    Image{
        id: al;
        source: "";
    }

    Item {
        Image{
            id: alimg;
            x:800;
            y:0;
            source: "///Data/imge/AL.png";
        }
        Text{
            id: alsumtext
            x: 850
            y: 0
            font.pointSize: 20
            color: "black"
            text: "铝X " + alsum;
        }
    }

    Timer {
        id: alRe
        interval: 5000;
        running: true;
        repeat: true;
        onTriggered: inspection(); // 检测函数 inspection()
    }


    property int x: 0;
    property int y: 0;
    function inspection(){
        x = myEvent.xRefresh();
        y = myEvent.yRefresh();
        if(al.source != "///Data/imge/AL.png"){
            al.source = "///Data/imge/AL.png";
            al.x = x;
            al.y = y;
        }
    }
    function inspectionAL(){
        if(true === myEvent.ifcollision(al.x,al.y,figure.x,figure.y,80,95)){
            al.x = 0;
            al.y = 0;
            al.source = "///Data/"
            alsum++;
        }
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
             inspectionAL();
        }
    }


}

