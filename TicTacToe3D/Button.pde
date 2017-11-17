class Button {

  int state=1;
  float xl;
  float xr;
  float yu;
  float yd;
  color col;
  String txt;

  void create(float xl_, float xr_, float yu_, float yd_, color col_) {
    xl=xl_;
    xr=xr_;
    yu=yu_;
    yd=yd_;
    col=col_;
  }
  void show(Button button) {

    if (button==button1) {
      txt=String.valueOf(mode+1);
    }

    if (button == button2) {
      txt=p1score+" : "+p2score;
    }


    fill(col);
    rect(xl, yu, xr-xl, yd-yu);
    textSize(ySpacing/3);
    stroke(0);
    fill(0);
    textAlign(CENTER, CENTER);
    text(txt, (xl+xr)/2, (yu+yd)/2);
  }

  void onClick(Button button) {

    if (button == button1) {
      if ((mouseX>xl&&mouseX<xr)&&(mouseY>yu&&mouseY<yd)) {
        //System.out.println("clicked");
        resetGame();
        
          p1score=0;
          p2score=0;
        
        if (state==1) {
          state=2;
          mode=1;
        } else if (state==2) {
          state=3;
          mode=2;
        } else if (state==3) {
          state=1;
          mode=0;
        }

        System.out.println(state);
      }
    }
  }
}