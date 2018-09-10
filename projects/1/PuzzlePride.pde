var processingCode = "...";
var jsCode = Processing.compile(processingCode).sourceCode;
/* @pjs preload="
  pride_flags/gay_pride_flag.png,
  pride_flags/transgender_pride_flag.png,
  pride_flags/bisexual_pride_flag.png,
  pride_flags/pansexual_pride_flag.png,
  pride_flags/asexual_demisexual_pride_flag.png,
  pride_flags/genderqueer_pride_flag.png,
  pride_flags/nonbinary_pride_flag.png,
  pride_flags/genderfluid_pride_flag.png,
  pride_flags/bigender_pride_flag.png,
  pride_flags/intersex_pride_flag.png,
  pride_flags/bear_pride_flag.png,
  pride_flags/lipstick_lesbian_pride_flag.jpg,
  pride_flags/twink_pride_flag.jpg,
  pride_flags/straight_ally_pride_flag.png";
*/

int width = 600;
int height = 600;
int backgroundColor = 245; //some form of gray for the background

void setup() {
  size(width, height);
  background(backgroundColor);
  
  //declaring all images
  img[0] = loadImage("pride_flags/gay_pride_flag.png");
  img[1] = loadImage("pride_flags/transgender_pride_flag.png");
  img[2] = loadImage("pride_flags/bisexual_pride_flag.png");
  img[3] = loadImage("pride_flags/pansexual_pride_flag.png");
  img[4] = loadImage("pride_flags/asexual_demisexual_pride_flag.png");
  img[5] = loadImage("pride_flags/genderqueer_pride_flag.png");
  img[6] = loadImage("pride_flags/nonbinary_pride_flag.png");
  img[7] = loadImage("pride_flags/genderfluid_pride_flag.png");
  img[8] = loadImage("pride_flags/bigender_pride_flag.png");
  img[9] = loadImage("pride_flags/intersex_pride_flag.png");
  img[10] = loadImage("pride_flags/bear_pride_flag.png");
  img[11] = loadImage("pride_flags/lipstick_lesbian_pride_flag.jpg");
  img[12] = loadImage("pride_flags/twink_pride_flag.jpg");
  img[13] = loadImage("pride_flags/straight_ally_pride_flag.png");

int num_of_row = 6; //number of rows
int num_of_col = 6; //number of columns
int btilex = -1; //blank tile's x position
int btiley = -1; //blank tile's y position
int textx = 10; //text's x position
int texty = 120; //text's y position
int level = 1; //game starts at level 1

boolean won = false; //determines if level was won
Tiles[][] tile = new Tiles[6][6]; //declaring all tiles
PImage img[14];

//colors in all flags
color red = color(255, 0, 0);
color darkRed = color(176, 48, 96);
color lightRed = color(219, 112, 147);
color orange = color(255, 102, 0);
color lightOrange = color(238, 221, 130);
color yellow = color(255, 255, 0);
color lightYellow = color(238, 221, 130);
color green = color(0, 255, 0);
color darkGreen = color(34, 139, 34);
color blue = color(0, 0, 255);
color babyBlue = color(175, 238, 238);
color lightBlue = color(0, 191, 255);
color purple = color(138, 43, 266);
color lightPurple = color(147, 112, 219);
color lavender = color(221, 160, 221);
color pink = color(255, 20, 147);
color lightPink = color(255, 192, 203);
color violet = color(218, 112, 214);
color darkViolet = color (186, 85, 211);
color brown = color(160, 82, 45);
color gray = color(139, 137, 137);
color lightGray = color(205, 201, 201);
color black = color(0);
color blank = color(backgroundColor);
color switchColor = blank; //blank

  InitializeTiles(); //initializes all tiles
  flagImage(); //sets up and displays the flag image
  for (int i = 0; i < 2000; i++) { scramble(); } //scrambles all the tiles
  instructions(); //displays instructions
}

void draw() {
  for (int y = 0; y < num_of_row; y++) {
    for (int x = 0; x < num_of_col; x++) {
      tile[y][x].display(); //continuously updates the game
    }
  }
  image(img[level - 1], 390, 20); //displays image
  if (userWon() && won == false) { //displays winning fact
    won = true;
    fill(red);
    textSize(14);
    if (level < 14) { text("You won! Press ENTER for next level. ", textx, texty + 475); }
    else { text("Congratulations! You beat the game! ", textx, texty + 60); }
    displayFact(level);
  }
}

void keyPressed() {
  findBlankTile(); //finds blank tile's x and y positions
  int tilex = btilex;
  int tiley = btiley;
  
  if (key == CODED && !userWon()) { //if user presses a key, the tile's x/y coordinates are set
    if (keyCode == UP) { tiley = btiley - 1; }
    else if (keyCode == DOWN) { tiley = btiley + 1; }
    else if (keyCode == LEFT) { tilex = btilex + 1; }
    else if (keyCode == RIGHT) { tilex = btilex - 1; }
  }
  if (canTilesSwap(tilex, tiley)) { switchTiles(tilex, tiley, switchColor); } //if tiles can be swapped, swap them
}

void keyTyped() {
  if (userWon() && level < 14) {
    clear(); //resets board
    background(backgroundColor); //sets background again
    level = level + 1; //changes level
    flagImage(); //displays new flag
    for (int i = 0; i < 2000; i++) { scramble(); } //scrambles flag
    instructions(); //displays instructions
    won = false;
  }
}

void instructions() { //displays instructions
  fill(red);
  textSize(20);
  text("LEVEL " + level + ": Try to solve this flag!", textx, texty - 90);
  fill(black);
  textSize(14);
  text("Use the arrow keys to move up/down/left/right. ", textx, texty + 20 - 90);
  text("The blank space will always end on the bottom. ", textx, texty + 40 - 90);
}


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




void flagImage() {
  color tcolor = blank;
  
  if (level == 1) { //gay pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        //changes colors of tiles
        if (y == 0 && x == 5) { tcolor = blank; } //one blank tile
        else if (y == 0) { tcolor = purple; }
        else if (y == 1) { tcolor = blue; }
        else if (y == 2) { tcolor = green; }
        else if (y == 3) { tcolor = yellow; }
        else if (y == 4) { tcolor = orange; }
        else if (y == 5) { tcolor = red; }
        tile[y][x].setColor(tcolor); //sets color of tile
      }
    }
  }
  
  if (level == 2) { //transgender pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if (y == 0 || y == 5) { tcolor = babyBlue; }
        else if (y == 1 || y == 4) { tcolor = lightPink; }
        else if (y == 2 || y == 3) { tcolor = lightGray; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 3) { //bisexual pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if (y == 0 || y == 1) { tcolor = blue; }
        else if (y == 2 || y == 3) { tcolor = purple; }
        else if (y == 4 || y == 5) { tcolor = pink; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
    
  if (level == 4) { //pansexual pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if (y == 0 || y == 1) { tcolor = lightBlue; }
        else if (y == 2 || y == 3) { tcolor = yellow; }
        else if (y == 4 || y == 5) { tcolor = pink; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 5) { //asexual/demisexual pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if (y == 0 || y == 1) { tcolor = purple; }
        else if (y == 2) { tcolor = lightGray; }
        else if (y == 3) { tcolor = gray; }
        else if (y == 4 || y == 5) { tcolor = black; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 6) { //genderqueer pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if (y == 0 || y == 1) { tcolor = darkGreen; }
        else if (y == 2 || y == 3) { tcolor = lightGray; }
        else if (y == 4 || y == 5) { tcolor = lightPurple; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 7) { //polysexual pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if (y == 0 || y == 1) { tcolor = black; }
        else if (y == 2) { tcolor = purple; }
        else if (y == 3) { tcolor = lightGray; }
        else if (y == 4 || y == 5) { tcolor = yellow; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 8) { //genderfluid pride flag
  for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if (y == 0) { tcolor = blue; }
        else if (y == 1) { tcolor = black; }
        else if (y == 2 || y == 3) { tcolor = darkViolet; }
        else if (y == 4) { tcolor = lightGray; }
        else if (y == 5) { tcolor = lightPink; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 9) { //bigender pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if (y == 0 || y == 5) { tcolor = lavender; }
        else if (y == 1 || y == 4) { tcolor = lightGray; }
        else if (y == 2) { tcolor = lightPink; }
        else if (y == 3) { tcolor = babyBlue; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 10) { //intersex pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if ((y == 1 || y == 4) && (x == 2 || x == 3)) { tcolor = purple; }
        else if ((y == 2 || y == 3) && ( x == 1 || x == 4)) { tcolor = purple; }
        else { tcolor = yellow; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 11) { //bear pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if (y == 0) { tcolor = black; }
        else if (y == 1) { tcolor = lightGray; }
        else if (y == 2) { tcolor = lightOrange; }
        else if (y == 3) { tcolor = yellow; }
        else if (y == 4) { tcolor = orange; }
        else if (y == 5) { tcolor = brown; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 12) { //lipstick lesbian pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if (y == 0) { tcolor = darkRed; }
        else if (y == 1) { tcolor = lightRed; }
        else if (y == 2) { tcolor = lightPink; }
        else if (y  == 3) { tcolor = violet; }
        else if (y == 4) { tcolor = darkViolet; }
        else if (y == 5) { tcolor = purple; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 13) { //twink pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
         else if (y == 0 || y == 1) { tcolor = lightYellow; }
        else if (y == 2 || y == 3) { tcolor = lightGray; }
        else if (y == 4 || y == 5) { tcolor = lightPink; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 14) { //straight ally pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 3) { tcolor = blank; }
        
        else if (y == 0) {
          if (x == 2 || x == 3) { tcolor = lightGray; }
          else { tcolor = purple; }
          
        } else if (y == 1) {
          if (x == 2 || x == 3) { tcolor = black; }
          else { tcolor = blue; }
          
        } else if (y == 2) {
          if (x == 0 || x == 5) { tcolor = lightGray; }
          else { tcolor = green; }
          
        } else if (y == 3) {
          if (x == 0 || x == 5) { tcolor = black; }
          else { tcolor = yellow; }
          
        } else if (y == 4) {
          if (x == 2 || x == 3) { tcolor = orange; }
          else { tcolor = lightGray; }
          
        } else {
            if (x == 2 || x == 3) { tcolor = red; }
            else { tcolor = black; }
        }
        
        tile[y][x].setColor(tcolor);
      }
    }
  }
}

boolean userWon() {
  int checkWinCount = 0;
  
  if (level == 1) { //gay pride flag
    for (int x = 0; x < num_of_col; x++) {
      if (tile[0][x].getColor() == purple) { checkWinCount++; }
      if (tile[1][x].getColor() == blue) { checkWinCount++; }
      if (tile[2][x].getColor() == green) { checkWinCount++; }
      if (tile[3][x].getColor() == yellow) { checkWinCount++; }
      if (tile[4][x].getColor() == orange) { checkWinCount++; }
      if (tile[5][x].getColor() == red) { checkWinCount++; }
    }
  }

  else if (level == 2) { //transgender pride flag
    for (int x = 0; x < num_of_col; x++) {
      if (tile[0][x].getColor() == babyBlue) { checkWinCount++; }
      if (tile[1][x].getColor() == lightPink) { checkWinCount++; }
      if (tile[2][x].getColor() == lightGray) { checkWinCount++; }
      if (tile[3][x].getColor() == lightGray) { checkWinCount++; }
      if (tile[4][x].getColor() == lightPink) { checkWinCount++; }
      if (tile[5][x].getColor() == babyBlue) { checkWinCount++; }
    }
  }
  
  else if (level == 3) { //bisexual pride flag
    for (int x = 0; x < num_of_col; x++) {
      if (tile[0][x].getColor() == blue) { checkWinCount++; }
      if (tile[1][x].getColor() == blue) { checkWinCount++; }
      if (tile[2][x].getColor() == purple) { checkWinCount++; }
      if (tile[3][x].getColor() == purple) { checkWinCount++; }
      if (tile[4][x].getColor() == pink) { checkWinCount++; }
      if (tile[5][x].getColor() == pink) { checkWinCount++; }
    }
  }
  
  else if (level == 4) { //pansexual pride flag
    for (int x = 0; x < num_of_col; x++) {
      if (tile[0][x].getColor() == lightBlue) { checkWinCount++; }
      if (tile[1][x].getColor() == lightBlue) { checkWinCount++; }
      if (tile[2][x].getColor() == yellow) { checkWinCount++; }
      if (tile[3][x].getColor() == yellow) { checkWinCount++; }
      if (tile[4][x].getColor() == pink) { checkWinCount++; }
      if (tile[5][x].getColor() == pink) { checkWinCount++; }
    }
  }
  
  else if (level == 5) { //asexual/demisexual pride flag
     for (int x = 0; x < num_of_col; x++) {
       if (tile[0][x].getColor() == purple) { checkWinCount++; }
       if (tile[1][x].getColor() == purple) { checkWinCount++; }
       if (tile[2][x].getColor() == lightGray) { checkWinCount++; }
       if (tile[3][x].getColor() == gray) { checkWinCount++; }
       if (tile[4][x].getColor() == black) { checkWinCount++; }
       if (tile[5][x].getColor() == black) { checkWinCount++; }
     }
   }
  
  else if (level == 6) { //genderqueer pride flag
    for (int x = 0; x < num_of_col; x++) {
      if (tile[0][x].getColor() == darkGreen) { checkWinCount++; }
      if (tile[1][x].getColor() == darkGreen) { checkWinCount++; }
      if (tile[2][x].getColor() == lightGray) { checkWinCount++; }
      if (tile[3][x].getColor() == lightGray) { checkWinCount++; }  
      if (tile[4][x].getColor() == lightPurple) { checkWinCount++; }
      if (tile[5][x].getColor() == lightPurple) { checkWinCount++; }
    }
  }
  
  else if (level == 7) { //non-binary pride flag
    for (int x = 0; x < num_of_col; x++) {
      if (tile[0][x].getColor() == black) { checkWinCount++; }
      if (tile[1][x].getColor() == black) { checkWinCount++; }
      if (tile[2][x].getColor() == purple) { checkWinCount++; }
      if (tile[3][x].getColor() == lightGray) { checkWinCount++; }
      if (tile[4][x].getColor() == yellow) { checkWinCount++; }
      if (tile[5][x].getColor() == yellow) { checkWinCount++; }
    }
  }
  
  else if (level == 8) { //genderfluid pride flag
    for (int x = 0; x < num_of_col; x++) {  
      if (tile[0][x].getColor() == blue) { checkWinCount++; }
      if (tile[1][x].getColor() == black) { checkWinCount++; }
      if (tile[2][x].getColor() == darkViolet) { checkWinCount++; }
      if (tile[3][x].getColor() == darkViolet) { checkWinCount++; }
      if (tile[4][x].getColor() == lightGray) { checkWinCount++; }
      if (tile[5][x].getColor() == lightPink) { checkWinCount++; }
    }
  }
  
  else if (level == 9) { //bigender pride flag
    for (int x = 0; x < num_of_col; x++) {  
      if (tile[0][x].getColor() == lavender) { checkWinCount++; }
      if (tile[5][x].getColor() == lavender) { checkWinCount++; }
      if (tile[1][x].getColor() == lightGray) { checkWinCount++; }
      if (tile[4][x].getColor() == lightGray) { checkWinCount++; }
      if (tile[2][x].getColor() == lightPink) { checkWinCount++; }
      if (tile[3][x].getColor() == babyBlue) { checkWinCount++; }
    }
  }
  
  else if (level == 10) { //intersex pride flag
    if (tile[1][2].getColor() == purple) { checkWinCount++; }
    if (tile[1][3].getColor() == purple) { checkWinCount++; }
    if (tile[2][1].getColor() == purple) { checkWinCount++; }
    if (tile[2][4].getColor() == purple) { checkWinCount++; }
    if (tile[3][1].getColor() == purple) { checkWinCount++; }
    if (tile[3][4].getColor() == purple) { checkWinCount++; }
    if (tile[4][2].getColor() == purple) { checkWinCount++; }
    if (tile[4][3].getColor() == purple) { checkWinCount++; }
   
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (tile[y][x].getColor() == yellow) { checkWinCount++; }
      }
    }
  }
  
  else if (level == 11) { //bear pride flag
    for (int x = 0; x < num_of_col; x++) {
      if (tile[0][x].getColor() == black) { checkWinCount++; }
      if (tile[1][x].getColor() == lightGray) { checkWinCount++; }
      if (tile[2][x].getColor() == lightOrange) { checkWinCount++; }
      if (tile[3][x].getColor() == yellow) { checkWinCount++; }
      if (tile[4][x].getColor() == orange) { checkWinCount++; }
      if (tile[5][x].getColor() == brown) { checkWinCount++; }
    }
  }
  
  else if (level == 12) { //lipstick lesbian pride flag
    for (int x = 0; x < num_of_col; x++) {
      if (tile[0][x].getColor() == darkRed) { checkWinCount++; }
      if (tile[1][x].getColor() == lightRed) { checkWinCount++; }
      if (tile[2][x].getColor() == lightPink) { checkWinCount++; }
      if (tile[3][x].getColor() == violet) { checkWinCount++; }
      if (tile[4][x].getColor() == darkViolet) { checkWinCount++; }
      if (tile[5][x].getColor() == purple) { checkWinCount++; }
    }
  }
  
  else if (level == 13) { //twink pride flag
    for (int x = 0; x < num_of_col; x++) {
      if (tile[0][x].getColor() == lightYellow) { checkWinCount++; }
      if (tile[1][x].getColor() == lightYellow) { checkWinCount++; }
      if (tile[2][x].getColor() == lightGray) { checkWinCount++; }
      if (tile[3][x].getColor() == lightGray) { checkWinCount++; }
      if (tile[4][x].getColor() == lightPink) { checkWinCount++; }
      if (tile[5][x].getColor() == lightPink) { checkWinCount++; }
    }
  }
  
  else if (level == 14) { //straight ally pride flag
    if (tile[0][0].getColor() == purple) { checkWinCount++; }
    if (tile[0][1].getColor() == purple) { checkWinCount++; }
    if (tile[0][2].getColor() == lightGray) { checkWinCount++; }
    if (tile[0][4].getColor() == purple) { checkWinCount++; }
    if (tile[0][5].getColor() == purple) { checkWinCount++; }
    if (tile[1][0].getColor() == blue) { checkWinCount++; }
    if (tile[1][1].getColor() == blue) { checkWinCount++; }
    if (tile[1][2].getColor() == black) { checkWinCount++; }
    if (tile[1][3].getColor() == black) { checkWinCount++; }
    if (tile[1][4].getColor() == blue) { checkWinCount++; }
    if (tile[1][5].getColor() == blue) { checkWinCount++; }
    if (tile[2][0].getColor() == lightGray) { checkWinCount++; }
    if (tile[2][1].getColor() == green) { checkWinCount++; }
    if (tile[2][2].getColor() == green) { checkWinCount++; }
    if (tile[2][3].getColor() == green) { checkWinCount++; }
    if (tile[2][4].getColor() == green) { checkWinCount++; }
    if (tile[2][5].getColor() == lightGray) { checkWinCount++; }
    if (tile[3][0].getColor() == black) { checkWinCount++; }
    if (tile[3][1].getColor() == yellow) { checkWinCount++; }
    if (tile[3][2].getColor() == yellow) { checkWinCount++; }
    if (tile[3][3].getColor() == yellow) { checkWinCount++; }
    if (tile[3][4].getColor() == yellow) { checkWinCount++; }
    if (tile[3][5].getColor() == black) { checkWinCount++; }
    if (tile[4][0].getColor() == lightGray) { checkWinCount++; }
    if (tile[4][1].getColor() == lightGray) { checkWinCount++; }
    if (tile[4][2].getColor() == orange) { checkWinCount++; }
    if (tile[4][3].getColor() == orange) { checkWinCount++; }
    if (tile[4][4].getColor() == lightGray) { checkWinCount++; }
    if (tile[4][5].getColor() == lightGray) { checkWinCount++; }
    if (tile[5][0].getColor() == black) { checkWinCount++; }
    if (tile[5][1].getColor() == black) { checkWinCount++; }
    if (tile[5][2].getColor() == red) { checkWinCount++; }
    if (tile[5][3].getColor() == red) { checkWinCount++; }
    if (tile[5][4].getColor() == black) { checkWinCount++; }
    if (tile[5][5].getColor() == black) { checkWinCount++; }
  }
  
  if (checkWinCount == 35) { return true; }
  return false;
}




void displayFact(int level) {
  int textx = 5;
  int texty = 100;
  
  fill(blue);
  textSize(13);
  
  if (level == 1) {
    text("This is the LGBTQ+ pride flag. ", textx, texty);
    text("L = Lesbian: a woman attracted to other women. ", textx, texty + 20);
    text("G = Gay: a person attracted to others of the same sex or gender. ", textx, texty + 40);
    text("B = Bisexual: a person attracted to both men and women. ", textx, texty + 60);
    text("T = Transgender: a person whose gender identity does not match their assigned sex at birth. ", textx, texty + 80);
    text("Q = Questioning: someone who is questioning their sexuality and/or gender identity. ", textx, texty + 100);
  }
  else if (level == 2) {
    text("This is the transgender pride flag. ", textx, texty);
    text("Trans or transgender means one's gender identity does not ", textx, texty + 20);
    text("match their assigned sex at birth. ", textx, texty + 40);
    text("FtM (female-to-male): A man who was born female. ", textx, texty + 60);
    text("MtF (male-to-female): A woman who was born male. ", textx, texty + 80);
  }
  else if (level == 3) {
    text("This is the bisexual pride flag. ", textx, texty);
    text("Bisexual means being attracted to men and women. ", textx, texty + 20);
  }
  else if (level == 4) {
    text("This is the pansexual pride flag. ", textx, texty);
    text("Pansexual means being attracted toward all genders ", textx, texty + 20);
    text("or lack there of. ", textx, texty + 40);
  }
  else if (level == 5) {
    text("This is the asexual pride flag. ", textx, texty);
    text("Asexual means having no sexual attraction towards anyone. ", textx, texty + 20);
    text("Another term, aromantic, means having no romantic attraction towards anyone. ", textx, texty + 40);
    text("Another term, agender, means having no gender. ", textx, texty + 60);
  }
  else if (level == 6) {
    text("This is the genderqueer pride flag. ", textx, texty);
    text("Genderqueer means identifying with neither, both, or a ", textx, texty + 20);
    text("combination of masculine and feminine genders. ", textx, texty + 40);
  }
  else if (level == 7) {
    text("This is the non-binary pride flag. ", textx, texty);
    text("Non-binary, similar to genderqueer, means identifying with ", textx, texty + 20);
    text("a gender that is not exclusively male or female. ", textx, texty + 40);
  }
  else if (level == 8) {
    text("This is the genderfluid pride flag. ", textx, texty);
    text("Genderfluid means identifying with multiple genders at", textx, texty + 20);
    text("various times. ", textx, texty + 40);
    text("Ex: At one instance, a person may identify as agender, and at another, a man. ", textx, texty + 60);
  }
  else if (level == 9) {
    text("This is the bigender pride flag. ", textx, texty);
    text("Bigender means identifying with two genders, either ", textx, texty + 20);
    text("simultaneously or separately at different times. ", textx, texty + 40);
    text("Ex: Someone who identifies as both a man and woman at the same time. ", textx, texty + 60);
  }
  else if (level == 10) {
    text("This is the intersex pride flag. ", textx, texty);
    text("Intersex means being born both male and female ", textx, texty + 20);
    text("in some aspect, whether that is physical, hormonal, etc. ", textx, texty + 40);
  }
  else if (level == 11) {
    text("This is the bear pride flag. ", textx, texty);
    text("A bear is a large, hairy, masuline, gay man. ", textx, texty + 20);
  }
  else if (level == 12) {
    text("This is the lipstick lesbian pride flag. ", textx, texty);
    text("A lipstick lesbian is a feminine, gay woman.", textx, texty + 20);
  }
  else if (level == 13) {
    text("This is the twink pride flag. ", textx, texty);
    text("A twink is a young, thin man with a feminine manner and ", textx, texty + 20);
    text("very little body hair. ", textx, texty + 40);
  }
  else if (level == 14) {
    text("This is the cis/straight ally pride flag. ", textx, texty);
    text("An ally is a supporter of the LGBTQ+ community. ", textx, texty + 20);
  }
}