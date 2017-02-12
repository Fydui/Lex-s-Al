#include "GEvent.h"
#include "time.h"
//const int i_w = 80;//105; //被检测图元宽
//const int i_h = 95;//115; //被检测图元高
//const int image_Ew = 105;
//const int image_Eh = 115;

//检测两个图元是否碰撞
bool Gevent::ifcollision(int Ex, int Ey, int Mx, int My,int iw,int ih) //Ex为一号图元的x坐标,Mx为二号图元的x坐标
{
    int i_w = iw;
    int i_h = ih;
    if(Ex <= Mx){
        if( Ex <= Mx && Mx <= (Ex + i_w)){
            if(Ey <= My && My <= (Ey + i_h)){
                return true;
            }
            else if(Ey <= (My+i_h) && (My+i_h) <= (Ey + i_h)){
                return true;
            }
        }
    }
    if(Ex >= Mx){
        if( Ex <= (Mx+i_w) && (Mx+i_w) <= (Ex + i_w)){
            if(Ey <= (My+i_h) && (My+i_h) <= (Ey + i_h)){
                return true;
            }
            else if(Ey <= My && My <= (Ey+i_h)){
                return true;
            }
        }
    }
    return false;
}

int Gevent::xRefresh(){
    //int xa = 0,xb = 960;
    srand((unsigned)time(0));
    return rand() % 960;//(rand() % (xa-xb) + xa);
}
int Gevent::yRefresh(){
    //int ya = 0, yb = 540;
    srand((unsigned)time(0));
    return rand() % 540;//(rand() % (ya-yb) + ya);
}
