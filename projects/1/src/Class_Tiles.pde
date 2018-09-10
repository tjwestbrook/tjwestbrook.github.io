class Tiles { //tile variables
  int tilex, tiley;
  int tilelength, tileradius, tilespace;
  color tilecolor;
  
  Tiles (int x, int y, int l, int r, int s) { //constructor for tiles
    tilex = x;
    tiley = y;
    tilelength = l;
    tileradius = r;
    tilespace = s;
  }
  
  void display() { //displays tile
    fill(tilecolor);
    rect(tilex, tiley, tilelength, tilelength, tileradius);
  }
  
  color getColor() { //returns the color of the tile
    return tilecolor;
  }
  
  void setColor(color c) { //changes the color of the tile
     tilecolor = c;
  }
}

void InitializeTiles() { //initializes tiles
  int length = 55; //width and height of tile
  int space = 2; //space between tiles
  int xtile = (width/2) - length*(num_of_col/2) - space*(num_of_col/2); //x placement of first [0][0] tile
  int ytile = height - (height/6); //y placement of first tile
  int radius = 2; //amount of curvature
  
  for (int y = 0; y < num_of_row; y++) {
    int z = 0; //resets x-position
    for (int x = 0; x < num_of_col; x++) {
      tile[y][x] = new Tiles(xtile + z, ytile, length, radius, space); //initializing every tile
      z = z + length + space; //moves tiles' x-positions over
    }
    ytile = ytile - length - space; //moves tiles' y-positions over
  }
}