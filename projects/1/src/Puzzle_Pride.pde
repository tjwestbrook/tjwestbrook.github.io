import processing.core.PImage; //imports image library to import images
PImage[] img = new PImage[14]; //initializing images of flags for reference

int width = 600;
int height = 600;
int backgroundColor = 245; //some form of gray for the background

int num_of_row = 6; //number of rows
int num_of_col = 6; //number of columns
int btilex = -1; //blank tile's x position
int btiley = -1; //blank tile's y position
int textx = 10; //text's x position
int texty = 120; //text's y position
int level = 1; //game starts at level 1
boolean won = false; //determines if level was won
Tiles[][] tile = new Tiles[6][6]; //declaring all tiles

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

void setup() {
  size(600, 600);
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