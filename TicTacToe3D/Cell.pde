class Cell {

  PVector pos=new PVector();
  boolean hasClicked=false;
  color col=color(0);
  int state=0;
  float xc, yc =0;
  int a, b, c;

  void createCell(int x, int y, int z) {
    pos.x=x;
    pos.y=y;
    pos.z=z;
    a=x;
    b=y;
    c=z;

    if (pos.z==0) {
      xc=pos.x*xSpacing;
      yc=pos.y*ySpacing;
      col=color(210);
    }


    if (pos.z==1) {
      xc=pos.x*xSpacing;
      yc=(3+pos.y)*ySpacing;
      col=color(140);
    }

    if (pos.z==2) {

      xc=pos.x*xSpacing;
      yc=(6+pos.y)*ySpacing;
      col=color(70);
    }
  }

  void show() {

    //if (state==1) {
    //  col=p2c;
    //}

    //if (state==2) {
    //  col=p1c;
    //}

    if (!hasClicked) {
      if (pos.z==0) {
        col=color(210);
      }
      if (pos.z==1) {
        col=color(140);
      }
      if (pos.z==2) {
        col=color(70);
      }
    }

    stroke(0);

    fill(col);
    rect(xc, yc, xSpacing, ySpacing);



    fill(0);
    //text(a +","+b+","+c+","+state, xc, yc+ySpacing);
  }

  void check() {
    int wincheck=0;      
    for (int i=-2; i<3; i++) {
      try {
        if (cells[i][b][c].state==state && state!=0) {
          wincheck++;
        }
      }
      catch(Exception e) {
      }
    }
    if (wincheck==3) {
      win=true;
      win=true;
      for (int i=-2; i<3; i++) {
        try {
          if (state==1) {
            cells[i][b][c].col=h1;
          }
          if (state==2) {
            cells[i][b][c].col=h2;
          }
        }
        catch(Exception e) {
        }
      }
    }




    wincheck=0;      
    for (int i=-2; i<3; i++) {
      try {
        if (cells[a][i][c].state==state && state!=0) {
          wincheck++;
        }
      }
      catch(Exception e) {
      }
    }
    if (wincheck==3) {
      win=true;
      win=true;
      for (int i=-2; i<3; i++) {
        try {
          if (state==1) {
            cells[a][i][c].col=h1;
          }
          if (state==2) {
            cells[a][i][c].col=h2;
          }
        }
        catch(Exception e) {
        }
      }
    }



    wincheck=0;      
    for (int i=-2; i<3; i++) {
      try {
        if (cells[a][b][i].state==state && state!=0) {
          wincheck++;
        }
      }
      catch(Exception e) {
      }
    }
    if (wincheck==3) {
      win=true;
      for (int i=-2; i<3; i++) {
        try {
          if (state==1) {
            cells[a][b][i].col=h1;
          }
          if (state==2) {
            cells[a][b][i].col=h2;
          }
        }
        catch(Exception e) {
        }
      }
    }






    wincheck=0;      
    for (int i=-2; i<3; i++) {
      try {
        if (cells[i][i][c].state==state && state!=0) {
          wincheck++;
        }
      }
      catch(Exception e) {
      }
    }
    if (wincheck==3) {
      win=true;
      for (int i=-2; i<3; i++) {
        try {
          if (state==1) {
            cells[i][i][c].col=h1;
          }
          if (state==2) {
            cells[i][i][c].col=h2;
          }
        }
        catch(Exception e) {
        }
      }
    }





    wincheck=0;      
    for (int i=-2; i<3; i++) {
      try {
        if (cells[i][2-i][c].state==state && state!=0) {
          wincheck++;
        }
      }
      catch(Exception e) {
      }
    }
    if (wincheck==3) {
      win=true;
      for (int i=-2; i<3; i++) {
        try {
          if (state==1) {
            cells[i][2-i][c].col=h1;
          }
          if (state==2) {
            cells[i][2-i][c].col=h2;
          }
        }
        catch(Exception e) {
        }
      }
    }




    wincheck=0;      
    for (int i=-2; i<3; i++) {
      try {
        if (cells[i][i][i].state==state && state!=0) {
          wincheck++;
        }
      }
      catch(Exception e) {
      }
    }
    if (wincheck==3) {
      win=true;
      for (int i=-2; i<3; i++) {
        try {
          if (state==1) {
            cells[i][i][i].col=h1;
          }
          if (state==2) {
            cells[i][i][i].col=h2;
          }
        }
        catch(Exception e) {
        }
      }
    }






    wincheck=0;      
    for (int i=-2; i<3; i++) {
      try {
        if (cells[i][2-i][2-i].state==state && state!=0) {
          wincheck++;
        }
      }
      catch(Exception e) {
      }
    }
    if (wincheck==3) {
      win=true;
      for (int i=-2; i<3; i++) {
        try {
          if (state==1) {
            cells[i][2-i][2-i].col=h1;
          }
          if (state==2) {
            cells[i][2-i][2-i].col=h2;
          }
        }
        catch(Exception e) {
        }
      }
    }





    wincheck=0;      

    for (int i=-2; i<3; i++) {
      try {
        if (cells[a][i][i].state==state && state!=0) {
          wincheck++;
        }
      }
      catch(Exception e) {
      }
    }
    if (wincheck==3) {
      win=true;
      for (int i=-2; i<3; i++) {
        try {
          if (state==1) {
            cells[a][i][i].col=h1;
          }
          if (state==2) {
            cells[a][i][i].col=h2;
          }
        }
        catch(Exception e) {
        }
      }
    }





    wincheck=0;      
    for (int i=-2; i<3; i++) {
      try {
        if (cells[i][b][i].state==state && state!=0) {
          wincheck++;
        }
      }
      catch(Exception e) {
      }
    }
    if (wincheck==3) {
      win=true;
      for (int i=-2; i<3; i++) {
        try {
          if (state==1) {
            cells[i][b][i].col=h1;
          }
          if (state==2) {
            cells[i][b][i].col=h2;
          }
        }
        catch(Exception e) {
        }
      }
    }




    wincheck=0;      
    for (int i=-2; i<3; i++) {
      try {
        if (cells[i][b][2-i].state==state && state!=0) {
          wincheck++;
        }
      }
      catch(Exception e) {
      }
    }
    if (wincheck==3) {
      win=true;
      for (int i=-2; i<3; i++) {
        try {
          if (state==1) {
            cells[i][b][2-i].col=h1;
          }
          if (state==2) {
            cells[i][b][2-i].col=h2;
          }
        }
        catch(Exception e) {
        }
      }
    }





    wincheck=0;      
    for (int i=-2; i<3; i++) {
      try {
        if (cells[2-i][i][2-i].state==state && state!=0) {
          wincheck++;
        }
      }
      catch(Exception e) {
      }
    }
    if (wincheck==3) {
      win=true;
      for (int i=-2; i<3; i++) {
        try {
          if (state==1) {
            cells[2-i][i][2-i].col=h1;
          }
          if (state==2) {
            cells[2-i][i][2-i].col=h2;
          }
        }
        catch(Exception e) {
        }
      }
    }





    wincheck=0;      
    for (int i=-2; i<3; i++) {
      try {
        if (cells[2-i][2-i][i].state==state && state!=0) {
          wincheck++;
        }
      }
      catch(Exception e) {
      }
    }
    if (wincheck==3) {
      win=true;
      for (int i=-2; i<3; i++) {
        try {
          if (state==1) {
            cells[2-i][2-i][i].col=h1;
          }
          if (state==2) {
            cells[2-i][2-i][i].col=h2;
          }
        }
        catch(Exception e) {
        }
      }
    }


    wincheck=0;      
    for (int i=-2; i<3; i++) {
      try {
        if (cells[a][2-i][i].state==state && state!=0) {
          wincheck++;
        }
      }
      catch(Exception e) {
      }
    }
    if (wincheck==3) {
      win=true;
      for (int i=-2; i<3; i++) {
        try {
          if (state==1) {
            cells[a][2-i][i].col=h1;
          }
          if (state==2) {
            cells[a][2-i][i].col=h2;
          }
        }
        catch(Exception e) {
        }
      }
    }






    if (win&&!turn) {
      p2cwin=true;
    }
    if (win&&turn) {
      p1cwin=true;
    }
  }
}