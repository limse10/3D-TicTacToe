class Bot {

  Cell play() {

    int x=floor(random(3));
    int y=floor(random(3));
    int z=floor(random(3));
    Cell choice = cells[x][y][z];
    if (!choice.hasClicked) {
      return choice;
    } else {
      play();
    }
      return null;

  }
}