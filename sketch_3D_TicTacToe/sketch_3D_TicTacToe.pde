import java.util.Collections;

Cell[][][] cells = new Cell[3][3][3];
Bot bot1 = new Bot();
Bot bot2 = new Bot();
Button button1 = new Button();
Button button2 = new Button();
float xSpacing, ySpacing, sizeX, sizeY;
int turncount=0;
boolean win, p2cwin, p1cwin = false;
color p2c=color(255, 142, 153);
color p1c=color(137, 207, 240);
color h2 = color(255, 101, 101);
color h1=color(91, 151, 250);
boolean turn=true; //false=p2, true=p1
boolean playerTurn=true;
int mode=0; // mode0=2player, mode1=AI
Cell botChoice;
int p1score, p2score=0;
boolean lookingforward=false;
boolean potentialwin=false;
int finalvalue=0;


ArrayList<Turn> history = new ArrayList<Turn>();


void setup() {

  size(360, 640);
  //fullScreen();

  sizeX=width;
  sizeY=height-height/15;

  xSpacing=sizeX/3;
  ySpacing=sizeY/9;


  background(41);


  button1.create(0, xSpacing, sizeY, height, color(100, 240, 75));
  button2.create(xSpacing, 2*xSpacing, sizeY, height, color(200, 145, 50));


  //initialise cells
  for (int i=0; i<3; i++) {
    for (int j=0; j<3; j++) {
      for (int k=0; k<3; k++) {
        cells[i][j][k]=new Cell();
        cells[i][j][k].createCell(i, j, k);
      }
    }
  }


  resetGame();
}

void draw() {
  textSize(15);
  textAlign(BOTTOM, BOTTOM);



  //redraw background
  background(200);
  //







  //show all cells
  for (int i=0; i<3; i++) {
    for (int j=0; j<3; j++) {
      for (int k=0; k<3; k++) {
        cells[i][j][k].show();
      }
    }
  }
  //

  //draw grid
  stroke(41);
  strokeWeight(sizeY/480);
  for (int i=1; i<3; i++) {
    line(sizeX/3*i, 0, sizeX/3*i, sizeY);
  }
  for (int i=1; i<9; i++) {

    if (i%3==0) {
      strokeWeight(sizeY/80);
      stroke(0);
      line(0, ySpacing*i, sizeX, ySpacing*i);
    } else {
      strokeWeight(sizeY/480);
      stroke(41);
      line(0, ySpacing*i, sizeX, ySpacing*i);
    }
  }




  button1.show(button1);
  button2.show(button2);





  if (!win) {

    if ((mode==1 || mode==2)&& !turn ) {
      botChoice=bot1.choose(history);
      if (botChoice==null) {

        botChoice=bot1.play();
      } 

      if (botChoice!=null) {
        turncount++;
        botChoice.hasClicked=true;
        botChoice.state=2;
        botChoice.col=p2c;
        botChoice.check();
        turn=true;
        history.add(new Turn(int(botChoice.pos.x), int(botChoice.pos.y), int(botChoice.pos.z), botChoice.state));
      }

      if (mode==1) {
        playerTurn=true;
      } else if (mode==2) {
        playerTurn=false;
      }
    }
    if (p1cwin) {
      p1score++;
    }
    if (p2cwin) {

      p2score++;
    }
  }


  if (!win) {

    if (mode==2 && turn) {
      botChoice=bot2.play();
      if (botChoice==null) {
        botChoice=bot2.play();
      } else if (frameCount % 1 ==0) {
        turncount++;
        botChoice.hasClicked=true;
        botChoice.state=1;
        botChoice.col=p1c;
        botChoice.check();
        turn=false;
        history.add(new Turn(int(botChoice.pos.x), int(botChoice.pos.y), int(botChoice.pos.z), botChoice.state));
      }
    }
    if (p1cwin) {
      p1score++;
    }
    if (p2cwin) {

      p2score++;
    }
  }






  if (win && !lookingforward) {

    //System.out.println("p1c win");
    fill(0, 40);
    rect(0, 0, width, height);
    fill(41);
    textSize(height/13);
    textAlign(CENTER, CENTER);
    if (mode==2 && mousePressed) {
      resetGame();
    }
    if (p1cwin) {
      text("PLAYER 1 WINS", width/2, height/2);
    }
    if (p2cwin) {
      text("PLAYER 2 WINS", width/2, height/2);
    }

    for (int i = 0; i<history.size(); i++) {
      println(history.get(i).x + " " + history.get(i).y + " " + history.get(i).z + " " + history.get(i).turn);
    }
    println("");
  }
}



//void setState(ArrayList<Turn> turns) {

//  turncount=0;
//  for (int i=0; i<3; i++) {
//    for (int j=0; j<3; j++) {
//      for (int k=0; k<3; k++) {

//        cells[i][j][k].state=0;
//        cells[i][j][k].hasClicked=false;
//      }
//    }
//  }

//  for (Turn cell : turns) {
//    if (cell.turn==1) {
//      cells[cell.x][cell.y][cell.z].state=1;
//      cells[cell.x][cell.y][cell.z].col=p1c;
//      cells[cell.x][cell.y][cell.z].hasClicked=true;
//      turn=false;
//      playerTurn=false;
//    }
//    if (cell.turn==2) {
//      cells[cell.x][cell.y][cell.z].state=2;
//      cells[cell.x][cell.y][cell.z].col=p2c;
//      cells[cell.x][cell.y][cell.z].hasClicked=true;
//      turn=true;
//      playerTurn=true;
//    }


//  }
//}



Cell playerChoice() {
  for (int i=0; i<3; i++) {
    for (int j=0; j<3; j++) {
      for (int k=0; k<3; k++) {

        if (!cells[i][j][k].hasClicked) {
          if (mouseX>cells[i][j][k].pos.x*xSpacing && mouseX < (1+cells[i][j][k].pos.x)*xSpacing) {


            if (cells[i][j][k].pos.z==0 && mouseY>cells[i][j][k].pos.y*ySpacing && mouseY < (1+cells[i][j][k].pos.y)*ySpacing) {
              return cells[i][j][k];
            }
            if (cells[i][j][k].pos.z==1 && mouseY>(3+cells[i][j][k].pos.y)*ySpacing && mouseY < (4+cells[i][j][k].pos.y)*ySpacing) {
              return cells[i][j][k];
            }
            if (cells[i][j][k].pos.z==2 && mouseY>(6+cells[i][j][k].pos.y)*ySpacing && mouseY < (7+cells[i][j][k].pos.y)*ySpacing) {
              return cells[i][j][k];
            }
          }
        }
      }
    }
  }
  return null;
}

void mousePressed() {

  //setState(history);



  if (!win&&playerTurn) {

    Cell playerChoice = playerChoice();
    if (playerChoice!=null) {
      if (!playerChoice.hasClicked) {

        turncount++;
        playerChoice.hasClicked=true;

        if (turn) {
          playerChoice.state=1;
          playerChoice.col=p1c;
          playerChoice.check();
          turn=false;
          if (mode==1||mode==2) {
            playerTurn=false;
          } else {
            playerTurn=true;
          }
        } else {
          playerChoice.state=2;
          playerChoice.col=p2c;
          playerChoice.check();
          turn=true;
          if (mode==1||mode==2) {
            playerTurn=false;
          } else {
            playerTurn=true;
          }
        }


        history.add(new Turn(int(playerChoice.pos.x), int(playerChoice.pos.y), int(playerChoice.pos.z), playerChoice.state));
      } else {
      }
    }
    //
  } else {
    resetGame();
  }

  if (p1cwin) {
    p1score++;
  }
  if (p2cwin) {

    p2score++;
  }
  button1.onClick(button1);
}


void resetGame() {
  history.clear();
  playerTurn=true;
  turncount=0;
  for (int i=0; i<3; i++) {
    for (int j=0; j<3; j++) {
      for (int k=0; k<3; k++) {

        cells[i][j][k].state=0;
        cells[i][j][k].hasClicked=false;
      }
    }
  }
  win=false;
  p1cwin=false;
  p2cwin=false;
  turn=true;
}