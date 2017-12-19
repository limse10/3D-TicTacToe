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






  Cell choose(ArrayList<Turn> turns) {
    lookingforward=true;
    Cell chosen=null;
    ArrayList<Integer>results = new ArrayList<Integer>();
    ArrayList<Cell>index = new ArrayList<Cell>();
    for (Turn cell : turns) {
      //if (cells[cell.x][cell.y][cell.z].state==0) {
        results.add(cells[cell.x][cell.y][cell.z].lookforward(1));
        index.add(cells[cell.x][cell.y][cell.z]);
      //}
    }

    for (int i = 0; i<results.size(); i++) {
      if (results.get(i)==1) {
        chosen=index.get(i);
      } else {
        chosen=null;
      }
    }

    lookingforward=false;

    System.out.println(results);
    return chosen;
  }
}