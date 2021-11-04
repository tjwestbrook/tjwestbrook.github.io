import React, { useState, useEffect, useRef } from 'react';
import { ReactP5Wrapper } from "react-p5-wrapper";
import { setTokenToLocalStorage, getTokenFromLocalStorage, removeTokenFromLocalStorage } from '../../utils'

export default function Pong() {
  // eslint-disable-next-line no-unused-vars
  const [newGame, setNewGame] = useState(true)
  const gameOver = useRef(false);

  useEffect((newGame) => {
    // eslint-disable-next-line no-unused-expressions
    newGame ? (setTokenToLocalStorage("key", "value"), setNewGame(!newGame))
    : getTokenFromLocalStorage("key")
    return () => {
      gameOver ? removeTokenFromLocalStorage("key")
      : setTokenToLocalStorage("key", "value")
    }
  }, [newGame, gameOver]);

  return <ReactP5Wrapper sketch={sketch} newGame={newGame} gameOver={gameOver} />
}


function sketch(p5) {
/* eslint-disable no-sequences */ /* eslint-disable no-unused-expressions */
p5.updateWithProps = props => {
    if (props.newGame) {
      // gameSettings = {
      //   tile 
      // }
    }
  };

  let width = 600; let height = 400;
  let bg = p5.color(255,255,0);
  let bscore = 0; let pscore = 0;
  let bsl = 5; let psl = 10;
  let lvl = 1; let last_lvl = 5;
  let ball = []; let paddle = [];
  let pause = false; let speed = [];

  p5.setup = () => {
    p5.createCanvas(width, height);
    InitializeObjects(ball,paddle);
    //Initializing image(s)
    // img1 = loadImage("gold medal.jpg");
    // //Initializing all audio files
    // sounds = new Minim(this);
    // mp = sounds.loadFile("boing.mp3");  //Audio file for the paddle hitting the ball
    // mp2 = sounds.loadFile("fail.mp3");  //Audio file for the ball hitting the right-side wall
    // mp3 = sounds.loadFile("hooray.mp3");  //Audio file for beating a single level
    // mp4 = sounds.loadFile("bravo.mp3");  //Audio file for beating all of the levels
    // mp5 = sounds.loadFile("failed.mp3");  //Audio file for losing
    // mp6 = sounds.loadFile("Imma Try it Out.mp3");  //Audio file for background music
    // mp6.loop( );  //Calling background music method/function
  }

  p5.draw = () => {
    // Background
    p5.background(bg); p5.stroke(0); p5.strokeWeight(2);
    p5.line(width/2, 0, width/2, 15); //top vertical line
    p5.line(width/2, 45, width/2, height); //bottom v line
    p5.fill(p5.red(bg)-40, p5.green(bg)-40, p5.blue(bg)-40);
    p5.ellipse(width/2, height/2, 70, 70); //center circle
    // Instructions
    p5.textSize(20); p5.text("Controls:", 10, 70);
    p5.textSize(16); p5.fill(0); p5.strokeWeight(0);
    p5.text("Move the paddle with your mouse", 10, 90);
    p5.text("or finger and click / tap to pause.", 10, 107);
    p5.text("Don't let the Ball Score reach 5!", 10, 127);
    // Scoreboard
    p5.textSize(32); p5.stroke(0); p5.strokeWeight(1);
    p5.textSize(32); p5.text(`Level ${lvl}`, (width/2)-50, 40);
    p5.text("Ball Score: "+bscore, 10, 390);
    p5.text("Your Score: "+pscore, 390, 390);
    p5.line(0, 355, width, 355); // floor/score line
    // Move/Add objects
    move(ball[0],paddle[0]);
    if (lvl > 2) move(ball[1], paddle[0])
    if (lvl > 4) move(ball[2],paddle[0])
    if (pscore === psl*lvl) lvl < last_lvl ? win() : won()
    else if (pscore === psl*lvl+1) newLvl();
    if (lvl === last_lvl) bossLevel(ball[2]);
    if (bscore >= bsl) { // You lose
      p5.stroke(0); p5.line(width/2, 15, width/2, 45);
      p5.textSize(50); p5.text("YOU LOSE!", (width/2)-120, height/2);
      p5.textSize(20); p5.text("try again?", (width/2)-42, (height/2)+55);
      p5.noFill(); p5.rect((width/2)-52, (height/2)+35, 110, 30); bg = 255;
      ball.every((b,i) => b.pos((i*30)+20,20)); //return true
      // mp5.play();
    }
  }

  p5.mousePressed = () => { // pause
    pause = !pause
    pause ? (speed = [],
      ball.every(b => (speed.push(b.s), b.s = 0)))
    : ball.every((b,i) => b.s = speed[i])
    // mp3.rewind(); // mp4.rewind(); // mp5.rewind();
  }

  function InitializeObjects(b,p) {
    b.push(new Ball (p5.color(240, 0, 100)))
    b.push(new Ball (p5.color(200, 255, 0), 10, 4))
    b.push(new Ball (p5.color(0, 255, 0), 7, 5))
    p.push(new Paddle (p5.color(10, 200, 230)))
  }

  class Paddle {
    constructor(c, w=15, h=80, x=550) {
      this._c = c // color
      this._w = w // width
      this._h = h // height
      this._x = x // x position
    }
    get w() { return this._w }
    get len() { return this._h } set len(h) { this._h = h }
    get y() { return p5.mouseY - this._h/2 }
    get ylen() { return this.y + this.len }
    get x() { return this._x }
    display() {
      p5.fill(this._c); p5.strokeWeight(2); //p5.noStroke();
      p5.rect(this._x, this.y, this._w, this._h);
    };
  }

  class Ball {
    constructor(c,r=15,s=3,xd=1,yd=1,x=width/2,y=height/2) {
      this._c = c // color
      this._r = r // radius
      this._s = s // speed
      this._xd = xd // x direction
      this._yd = yd // y direction
      this._x = x // x position
      this._y = y // y position
    }
    get r() { return this._r }
    get s() { return this._s } set s(s) { this._s = s }
    sas(s=this._s, r=this._r) { this._s = s; this._r = r; return 1 }
    get xd() { return this._xd } set xd(x) { this._xd = x }
    get x() { return this._x } get y() { return this._y }
    pos(x,y) { this._x = x; this._y = y; return 1 }
    move() {
      if (this._r > this._y || this._y+this._r > height-45) this._yd *= -1
      if (this._r > this._x) this._xd *= -1
        this._x += this._xd * this._s;
        this._y -= this._yd * this._s;
        (() => { // render ball
          p5.fill(this._c); p5.strokeWeight(2); //p5.noStroke();
          p5.ellipse(this._x, this._y, this._r*2, this._r*2);
        })();
      }
  }

  function move(b,p) {
    p.display(); b.move()
    if (b.xd === 1 && b.x+b.r>p.x) {
      b.x+b.r > width ? ( // ball hit wall
        bscore += 1, b.xd *= -1,
        p5.stroke(250, 0, 0), p5.strokeWeight(5),
        p5.line(width, 0, width, height),
        p5.textSize(32), p5.text("+1", (width/2)-100, 350)
        ) // mp2.rewind(); // mp2.play();
      : (p.y<b.y+b.r && b.y-b.r<p.ylen && b.x+b.r<p.x+p.w) ? (
          pscore += 1, b.xd *= -1,
          p5.stroke(250, 0, 0), p5.strokeWeight(2),
          p5.line(p.x, p.y, p.x, p.ylen), p5.fill(0),
          p5.textSize(32), p5.text("+1", (width/2)+250, 350)
        ) : '' // mp.rewind(); // mp.play();
    }
  }

  function bossLevel(b) {  //Final/Boss level background
    let p = width/12 // 600/12=50
    bg = (p < b.x && b.x < p*2) || (p*3 < b.x && b.x < p*4)
    || (p*5 < b.x && b.x < p*6) || (p*7 < b.x && b.x < p*8)
    || (p*9 < b.x && b.x < p*10) || (p*11 < b.x && b.x < width)
    ? 0 : 255
  }

  function win() {
    p5.stroke(0); p5.line(width/2, 15, width/2, 45);
    p5.textSize(50); p5.text("YOU WON!", (width/2)-110, height/2);
    lvl < last_lvl-1 ?
    (p5.textSize(20), p5.text(`Keep playing for Level ${lvl}!`, (width/2)-110, (height/2)+50))
    : (p5.textSize(20), p5.text("Keep playing for THE FINAL ROUND!", (width/2)-162, (height/2)+55))
    // mp3.play();
  }

  function newLvl() { lvl += 1;
    lvl === 2 ? (bg = p5.color(0, 235, 100), ball[0].sas(4,10))
    : lvl === 3 ? (bg = p5.color(235, 100, 0), ball[1].sas(4,10))
    : lvl === 4 ? (bg = p5.color(100, 0, 235), paddle[0].len = 50)
    : ball.every(b => b.sas(5,7))
    // mp3.rewind();
  }

  function won() {
    p5.textSize(50); p5.text("YOU WIN!", (width/2)-110, height/2);
    p5.textSize(20); p5.text("play again?", (width/2)-42, (height/2)+55);
    p5.noFill(); p5.rect((width/2)-47, (height/2)+35, 115, 30);
    ball.every((b,i) => b.pos((i*30)+20,20)); bg = 255;
    // image(img1, (width/2)-75, 0, 150, 150);  //Calling image for winning
    // mp4.play();
  }
}
