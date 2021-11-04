import { ReactP5Wrapper } from "react-p5-wrapper";

export default function PuzzlePride() {
  return <ReactP5Wrapper sketch={sketch} />
}

function sketch(p5) {
/* eslint-disable no-unused-expressions */
  let width = () => .8*p5.windowWidth; let height = () => p5.max(700,.4*p5.windowHeight); //dimensions of p5 canvas
  let len = () => p5.min(.1*width(), 66); let rad = 2; //length & radius of tiles
  let last_lvl = 14; let lvl = p5.getItem('level') || 1;
  let tile = []; let tiles = p5.getItem('tiles');
  let newGame = tiles ? false : true; let play = true;
  let rowNum = 6; let colNum = 6;
  let btilex = 0; let btiley = 0;
  const facts = [];
  const img = []; let imgy = 14;
  let imgx = () => width() - 1.2*imgw();
  let imgw = () => p5.max(200,.2*width());
  let imgh = () => p5.max(120,.12*width());
  let textx = 5; let texty = () => width() > 500 ? 144 : 244;
  let bgcolor = () => p5.color('rgba(0,0,0,0.33)');
  let blank = (x=btilex,y=btiley) => { btilex = x; btiley = y; return bgcolor() };
  let levelButton = p5.createButton('Reset Level');
  let gameButton = p5.createButton('Restart Game');
  let reset = () => { play = true; newGame = true; p5.redraw() }
  let restart = () => { lvl = 1; reset(); }
  levelButton.mousePressed(reset);
  gameButton.mousePressed(restart);

  // pride flag colors
  //pride-rainbow
  let Red = p5.color(209, 34, 41) // #D12229
  let Orange = p5.color(246, 138, 30) // #F68A1E
  let Yellow = p5.color(253, 224, 26) // #FDE01A
  let Green = p5.color(0, 121, 64) // #007940
  let Indigo = p5.color(36, 64, 142) // #24408E
  let Violet = p5.color(115, 41, 130) // #732982
  //transgender
  let Light_Blue = p5.color(91, 206, 250) // #5BCEFA
  let Pink = p5.color(245, 169, 184) // #F5A9B8
  let White = p5.color(255, 255, 255) // #FFFFFF
  //bisexual
  let Pink_BS = p5.color(214, 2, 112) // #D60270
  let Purple = p5.color(155, 79, 150) // #9B4F96
  let Blue = p5.color(0, 56, 168) // #0038A8
  //pansexual
  let Magenta = p5.color(255, 33, 140) // #FF218C
  let Yellow_PS = p5.color(255, 216, 0) // #FFD800
  let Cyan = p5.color(33, 177, 255) // #21B1FF
  //asexual
  let Black = p5.color(0, 0, 0) // #000000
  let Grey = p5.color(163, 163, 163) // #A3A3A3
  // let White = p5.color(255, 255, 255) // #FFFFFF
  let Purple_AS = p5.color(128, 0, 128) // #800080
  // //polysexual
  // let Pink_PS = p5.color(247, 20, 186) // #F714BA
  // let Green_PS = p5.color(1, 214, 106) // #01D66A
  // let Blue_PS = p5.color(21, 148, 246) // #1594F6
  //genderqueer
  let Lavender = p5.color(181, 126, 220) // #B57EDC
  // let White = p5.color(255, 255, 255) // #FFFFFF
  let Green_GQ = p5.color(74, 129, 35) // #4A8123
  //nonbinary
  let Yellow_NB = p5.color(252, 244, 52) // #FCF434
  // let White = p5.color(255, 255, 255) // #FFFFFF
  let Purple_NB = p5.color(156, 89, 209) // #9C59D1
  let Black_NB = p5.color(44, 44, 44) // #2C2C2C
  //genderfluid
  let Pink_GF = p5.color(255, 118, 164) // #FF76A4
  // let White = p5.color(255, 255, 255) // #FFFFFF
  let Purple_GF = p5.color(192, 17, 215) // #C011D7
  // let Black = p5.color(0, 0, 0) // #000000
  let Blue_GF = p5.color(47, 60, 190) // #2F3CBE
  //bigender
  let Pink_BG = p5.color(196, 121, 162) // #C479A2
  let Light_Pink = p5.color(237, 165, 205) // #EDA5CD
  let Purple_BG = p5.color(214, 199, 232) // #D6C7E8
  let Light_Blue_BG = p5.color(154, 199, 232) // #9AC7E8
  let Blue_BG = p5.color(109, 130, 209) // #6D82D1
  //intersex
  // let Yellow_PS = p5.color(255, 216, 0) // #FFD800
  let Violet_IS = p5.color(121, 2, 170) // #7902AA
  //international-bear-brotherhood
  let Dark_Brown = p5.color(97, 55, 4) // #613704
  let Orange_BB = p5.color(212, 99, 0) // #D46300
  let Golden_Yellow = p5.color(253, 220, 98) // #FDDC62
  let Tan = p5.color(253, 229, 183) // #FDE5B7
  let Gray = p5.color(84, 84, 84) // #545454
  //lipstick-lesbian
  let Dark_Pink = p5.color(163, 2, 98) // #A30262
  let Dusty_Pink = p5.color(181, 86, 144) // #B55690
  let Pink_LL = p5.color(209, 98, 164) // #D162A4
  let Lavender_LL = p5.color(228, 172, 207) // #E4ACCF
  let Red_LL = p5.color(197, 78, 84) // #C54E54
  let Brown = p5.color(138, 30, 4) // #8A1E04
  //twink
  let Twink_Pink = p5.color(255, 176, 255) // #FFB0FF
  let Twink_Yellow = p5.color(255, 255, 128) // #FFFF80
  //straight-ally
  let str8_Red = p5.color(240, 0, 0) // #F00000
  let str8_Orange = p5.color(254, 126, 0) // #FE7E00
  let str8_Yellow = p5.color(255, 255, 0) // #FFFF00
  let str8_Green = p5.color(0, 122, 65) // #007A41
  let str8_Indigo = p5.color(64, 65, 254) // #4041FE
  let str8_Violet = p5.color(160, 1, 190) // #A001BE

  p5.preload = () => {
    img.push(p5.loadImage("/assets/pride-flags/pride-flag.png"))
    facts.push("This is the LGBTQ+ pride flag.\nL = Lesbian: a woman attracted to other women.\nG = Gay: a man/person attracted to other men/the same sex.\nB = Bisexual: a person attracted to both men and women.\nT = Transgender: a person whose gender identity doesn't match their assigned sex at birth.\nQ = Questioning: someone who is questioning their sexuality and/or gender identity.")
    img.push(p5.loadImage("/assets/pride-flags/Transgender-Pride-Flag.png"))
    facts.push("This is the transgender pride flag.\nTrans or transgender means one's gender identity does not match their assigned sex at birth.\nFtM (female-to-male): A man who was born female.\nMtF (male-to-female): A woman who was born male.")
    img.push(p5.loadImage("/assets/pride-flags/Bisexual-Pride-Flag.png"))
    facts.push("This is the bisexual pride flag.\nBisexual means being attracted to both sexes.")
    img.push(p5.loadImage("/assets/pride-flags/Pansexual-Pride-Flag.png"))
    facts.push("This is the pansexual pride flag.\nPansexual means being attracted toward all sexes and genders, or lack there of.")
    img.push(p5.loadImage("/assets/pride-flags/Asexual-Pride-Flag.png"))
    facts.push("This is the asexual pride flag.\nAsexual means having no sexual attraction towards anyone.\nAnother term called aromantic means having no romantic attraction towards anyone.\nAnother term called agender means identifying with no gender.")
    img.push(p5.loadImage("/assets/pride-flags/Genderqueer-Pride-Flag.png"))
    facts.push("This is the genderqueer pride flag.\nGenderqueer means identifying with neither, both, or a combination of male and female genders.")
    img.push(p5.loadImage("/assets/pride-flags/Nonbinary-Pride-Flag.png"))
    facts.push("This is the non-binary pride flag.\nNon-binary, similar to genderqueer, means identifying with a gender that isn't exclusively male or female.")
    img.push(p5.loadImage("/assets/pride-flags/Genderfluid-Pride-Flag.png"))
    facts.push("This is the genderfluid pride flag.\nGenderfluid means identifying with a gender which can vary over time\nEx: In one instance, a person could identify as a man, and in another, a woman.")
    img.push(p5.loadImage("/assets/pride-flags/Bigender-Pride-Flag.png"))
    facts.push("This is the bigender pride flag.\nBigender means identifying with two genders, either simultaneously or varying between the two.\nEx: Someone who identifies as both a man and woman at the same time. ")
    img.push(p5.loadImage("/assets/pride-flags/Bear-Pride-Flag.png"))
    facts.push("This is the bear pride flag.\nA bear is a large, hairy, masuline, gay man.")
    img.push(p5.loadImage("/assets/pride-flags/Lipstick-Pride-Flag.png"))
    facts.push("This is the lipstick lesbian pride flag.\nA lipstick lesbian is a feminine, gay woman.")
    img.push(p5.loadImage("/assets/pride-flags/Twink-Pride-Flag.png"))
    facts.push("This is the twink pride flag.\nA twink is a young, thin, feminine, gay man with little body hair.")
    img.push(p5.loadImage("/assets/pride-flags/Intersex-Pride-Flag.png"))
    facts.push("This is the intersex pride flag.\nIntersex means being born both male and female physically in some aspect.")
    img.push(p5.loadImage("/assets/pride-flags/Straight-Ally-Pride-Flag.png"))
    facts.push("This is the cis/straight ally pride flag.\nAn ally is a supporter of the LGBTQ+ community.")
  }

  p5.setup = () => {
    p5.createCanvas(width(), height());
    initializeTiles(tile);
    p5.noLoop();
  }

  function resetGame(resize=0) {
    p5.clear(); p5.background(bgcolor());
    p5.image(img[lvl-1], imgx(), imgy, imgw(), imgh());
    if (resize && userWon()) { displayFact(); }
    levelButton.position(.2*width()-50, 1.7*height());
    gameButton.position(.2*width()+50, 1.7*height());
    instructions();
  }

  p5.draw = () => {
    if (play && lvl <= last_lvl) {
      play = !play; resetGame();
      newGame ? (colorTiles(), scramble()) : restoreTiles();
    } else if (userWon()) { displayFact(); play = !play }
  }

  p5.windowResized = () => {
    p5.resizeCanvas(width(), height(), 1);
    resetGame(1); tiles = tile; tile = [];
    initializeTiles(tile); restoreTiles();
  }

  p5.keyPressed = () => {
    if (!play) {
      let [x, y] = move((() => {
        return {
          ArrowUp: 0,
          ArrowDown: 1,
          ArrowLeft: 2,
          ArrowRight: 3
        }[p5.key]
      })());
      if (x>=0 && x<colNum && y>=0 && y<rowNum) swapTiles(x, y)
      p5.redraw()
    }
  }

  p5.mousePressed = () => {
    if (!play) {
      let [x, y] = move(mousePressMove(p5.mouseX, p5.mouseY))
      if (x>=0 && x<colNum && y>=0 && y<rowNum) swapTiles(x, y)
      p5.redraw()
    } else if (userWon() && p5.mouseX > imgx() && p5.mouseY < imgy + imgh()) {
      newGame = true; lvl += 1; p5.redraw()
    }
  }

  function mousePressMove(x, y) {
    let bx = tile[btilex][btiley].x
    let by = tile[btilex][btiley].y
    let l = len()
    if (y < by && y > by-l && x > bx && x < bx+l) return 1 //up
    if (y > by+l && y < by+2*l && x > bx && x < bx+l) return 0 //down
    if (x < bx && x > bx-l && y > by && y < by+l) return 3 // left
    if (x > bx+l && x < bx+2*l && y > by && y < by+l) return 2 // right
    return 4
  }

  function move(d=p5.floor(p5.random(0,4)), x=btilex, y=btiley) {
    switch(d) {
      case 0: return [x, y -= 1] // up
      case 1: return [x, y += 1] // down
      case 2: return [x += 1, y] // left
      case 3: return [x -= 1, y] // right
      default: return [-1, -1]
    }
  }

  function instructions() {
    p5.strokeWeight(1); p5.stroke(1);
    p5.fill(p5.color(0, 255, 0)); p5.textSize(20);
    p5.text("Level "+lvl+": Solve this flag!", textx, texty() - 90);
    p5.fill(p5.color(221, 160, 221)); p5.textSize(14);
    p5.text("Use the arrow keys / mouse to move tiles. ", textx, texty() - 60);
    p5.text("The blank space will end on the bottom. ", textx, texty() - 40);
  }

  function displayFact() {
    p5.strokeWeight(1); p5.stroke(1);
    p5.fill(p5.color(175, 238, 238));
    p5.textWrap(p5.WORD); p5.textSize(14);
    p5.text(facts[lvl], textx, texty(), .9*width());
    p5.textSize(17);
    if (lvl < last_lvl) { p5.fill(p5.color(238, 221, 130));
      p5.text(`You won! Click the flag to play level ${lvl+1}. `, (width()/2) - 150, height() - 69);
    } else { p5.fill(White); p5.stroke(0); p5.removeItem('level'); p5.removeItem('tiles');
      p5.text("Congratulations! You beat the game!", (width()/2)-150, texty() + 100); lvl += 1
    }
  }

  class Tile {
    constructor(x=0,y=0,l=len(),r=rad) {
      this.x = x
      this.y = y
      this.len = l
      this.rad = r
    }
    draw(s) { p5.scale(s); p5.rect(this.x, this.y, this.len, this.len, this.rad) }
    delete(s) { p5.erase(); this.draw(s); p5.noErase() }
    not(c=blank()) {  return !this._color.levels.every((x, i) =>
      x !== c.levels[i] ? false : true) }
    get flagColor() { return this._flagColor }
    get color() { return this._color }
    set flagColor(c) { this.color = this._flagColor = c }
    set color(c) { this._color = c; this.render() }
    render(s=1) {
      this.delete(s); p5.strokeWeight(1);
      !this.not() ? p5.stroke(White) : p5.stroke(Black)
      p5.fill(this._color); this.draw(s);
      p5.removeItem('tiles'); p5.storeItem('tiles', tile);
      p5.removeItem('level'); p5.storeItem('level', lvl);
    };
  }

  function initializeTiles(tile) {
    let xtile = (width()/2) - len()*(colNum/2) - rad*(colNum/2); // x of tile[0][y]
    let ytile = height() - 1.5*(height()/7); //y of tile[x][0]
    let space = len() + rad;
    for (let x = 0; x < colNum; x++) {
      let tileColumn = [];
      for (let y = 0; y < rowNum; y++) {
        tileColumn.push(new Tile(xtile, ytile - space * y))
      }
      tile.push(tileColumn);
      xtile += space;
    }
    colorTiles();
  }

  function restoreTiles() {
    for (let y = 0; y < rowNum; y++) {
      for (let x = 0; x < colNum; x++) {
        tile[x][y].color = p5.color(tiles[x][y]._color.levels);
        if (!tile[x][y].not()) blank(x,y)
      }
    }
  }

  function swapTiles(x, y) { // swap tile[x][y] and blank tile
    tile[btilex][btiley].color = tile[x][y].color;
    tile[x][y].color = blank(x,y);
  }

  function scramble(t=2000) {
    for (let i = 0; i < t; i++) {
      let [x, y] = [-1, -1]
      while (x<0 || x>=colNum || y<0 || y>=rowNum) { [x, y] = move() }
      swapTiles(x, y)
    }
  }

  function userWon() { // not blank or flag color ? break : cont
    return tile.every(row => {
      return row.every(t => {
        return t.not() && t.not(t.flagColor) ? false : true
      })
    })
  }

  function colorTiles() {
    for (let y = 0; y < rowNum; y++) {
      for (let x = 0; x < colNum; x++) {
        tile[x][y].flagColor = (
          lvl===1 ? //gay pride flag
            y===0 ? Violet
            : y===1 ? Indigo
            : y===2 ? Green
            : y===3 ? Yellow
            : y===4 ? Orange : Red
          : lvl===2 ? //transgender pride flag
            y===0 || y===5 ? Light_Blue
            : y===1 || y===4 ? Pink : White
          : lvl===3 ? //bisexual pride flag
            y===0 || y===1 ? Blue
            : y===2 || y===3 ? Purple : Pink_BS
          : lvl===4 ? //pansexual pride flag
            y===0 || y===1 ? Cyan
            : y===2 || y===3 ? Yellow_PS : Magenta
          : lvl===5 ? //asexual/demisexual pride flag
            y===0 || y===1 ? Purple_AS
            : y===2 ? White
            : y===3 ? Grey : Black
          : lvl===6 ? //genderqueer pride flag
            y===0 || y===1 ? Green_GQ
            : y===2 || y===3 ? White : Lavender
          : lvl===7 ? //non-binary pride flag
            y===0 || y===1 ? Black_NB
            : y===2 ? Purple_NB
            : y===3 ? White : Yellow_NB
          : lvl===8 ? //genderfluid pride flag
            y===0 ? Blue_GF
            : y===1 ? Black
            : y===2 || y===3 ? Purple_GF
            : y===4 ? White : Pink_GF
          : lvl===9 ? //bigender pride flag
            y===0 ? Blue_BG
            : y===1 ? Light_Blue_BG
            : y===2 ? White
            : y===3 ? Purple_BG
            : y===4 ? Light_Pink : Pink_BG
          : lvl===10 ? //bear pride flag
            y===0 ? Gray
            : y===1 ? White
            : y===2 ? Tan
            : y===3 ? Golden_Yellow
            : y===4 ? Orange_BB : Dark_Brown
          : lvl===11 ? //lipstick lesbian pride flag
            y===0 ? Brown
            : y===1 ? Red_LL
            : y===2 ? Lavender_LL
            : y===3 ? Pink_LL
            : y===4 ? Dusty_Pink : Dark_Pink
          : lvl===12 ? //twink pride flag
            y===0 || y===1 ? Twink_Yellow
            : y===2 || y===3 ? White : Twink_Pink
          : lvl===13 ? //intersex pride flag
            ((y===1 || y===4) && (x === 2 || x === 3)) ||
            ((y===2 || y===3) && (x === 1 || x === 4)) ?
            Violet_IS : Yellow_PS
          : //lvl===14 ? //straight ally pride flag
            y===0 ? x === 3 || x === 2 ? White : str8_Violet
            : y===1 ? x === 2 || x === 3 ? Black : str8_Indigo
            : y===2 ? x === 0 || x === 5 ? White : str8_Green
            : y===3 ? x === 0 || x === 5 ? Black : str8_Yellow
            : y===4 ? x === 2 || x === 3 ? str8_Orange : White
            : x === 2 || x === 3 ? str8_Red : Black
        )
      }
    }
    lvl === 14 ? blank(3,0) : blank(5,0)
  }
}