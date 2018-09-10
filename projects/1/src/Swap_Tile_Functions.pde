boolean canTilesSwap(int tilex, int tiley) {
  if (tilex < 0 || tilex > 5 || tiley < 0 || tiley > 5) { return false; } //if the "tile" is out of the region, it cannot swap 
  else {
    switchColor = tile[tiley][tilex].getColor(); //gets color of tile clicked
    //returns true if the tile is in one of the four regions that are allowed to be swapped with
    if (tilex == btilex) {
      if (tiley == btiley - 1) { return true; }
      else if (tiley == btiley + 1) { return true; }
    }
    else if (tiley == btiley) {
      if (tilex == btilex - 1) { return true; }
      else if (tilex == btilex + 1) { return true; }
    }
  }
  return false;
}

void switchTiles( int tilex, int tiley, color tilecolor) {
  tile[btiley][btilex].setColor(tilecolor); //sets the color of the blank tile to the new tile color
  tile[tiley][tilex].setColor(blank); //sets the colored tile to be blank
}

void scramble() {
  findBlankTile(); //finds the blank tile first
  boolean canSwapTiles = false;
  
  while (canSwapTiles == false) {
    int rtilex = btilex;
    int rtiley = btiley;
    int[] situation = {btiley - 1, btiley + 1, btilex - 1, btilex + 1}; //sets all possibilities for blank tile
    int randSit = (int)random(4); //randomly chooses one of the four possible outcomes
    
    //sets the random tile's x and y positions depending on which random choice was made
    if (randSit == 0) { rtiley = situation[0]; }
    if (randSit == 1) { rtiley = situation[1]; }
    if (randSit == 2) { rtilex = situation[2]; }
    if (randSit == 3) { rtilex = situation[3]; }
    boolean canSwap = canTilesSwap(rtilex, rtiley); //returns whether or not it is possible to swap the blank and random tile
  
    if (canSwap == true) { //if it is possible...
      color rcolor = tile[rtiley][rtilex].getColor(); //gets the random tile's color
      switchTiles(rtilex, rtiley, rcolor); //swaps the blank and random tile
      canSwapTiles = true; //gets out of the while loop
    }
  }
}

void findBlankTile() { //identifies blank tile
  for (int y = 0; y < num_of_row; y++) {
    for (int x = 0; x < num_of_col; x++) {
      if (tile[y][x].getColor() == blank) { //if this tile is blank...
        btilex = x; //sets x-position of blank tile
        btiley = y; //sets y-position of blank tile
      }
    }
  }
}