color white= #ffffff;
color black= #000000;
float ballx, bally, balld;
float vx, vy;
float ax, ay;
color color1 = #42213d;
color color2 = #123456;
color color3=#C0FFEE;
color color4= #abcdef;
color color5=#959384;
boolean aKey, dKey, wKey, sKey;
float x, y, d;
float x2, y2, d2;
boolean a2Key, d2Key, w2Key, s2Key;
float holex, holey, holed;
int points1=0;
int points2=0;
float playerSpeed;
float player1Size, player2Size;
import processing.sound.*;
SoundFile fail;
SoundFile success;
SoundFile music;
boolean green=true;
int mode =0;
final int INTRO =0;
final int GAME = 1;
final int PAUSE=2;
final int GAMEOVER=3;
void setup(){
  size(1000, 1000, P2D);
  fail = new SoundFile(this, "FAILURE.wav");
  success = new SoundFile(this, "SUCCESS.wav");
  music=new SoundFile(this, "MUSIC.mp3");
  ballx=width/2;
  bally=height/2;
  balld=50;

  //ax=random(0,2);
  //ay=random(0,2);
  x=width/2;
  y=height/2-200;
  x2=width/2;
  y2=height/2+200;
  d=100;
  d2=100;
  holex=width/2;
  holey=100;
  holed=100;
  music.loop();
  music.amp(1);
}
void draw(){
  if (mode==INTRO) {
    intro();
  } else if (mode==GAMEOVER) {
    gameOver();
  } else {
    
    if (random(0, 500)<1) {
      vx=random(0,50);
      vy=random(0,50);
      }
      
    if (random(0, 250)<1) {
      playerSpeed=random(1,25);
      player1Size=random(50,200);
      player2Size=random(50,200);
      }  
    
    background(color4);
    strokeWeight(5);
    stroke(black);
    fill(255, 0, 0);
    if(green)fill(0,255,0);
    else fill(255,0,0);
    circle(ballx, bally, balld);
    ballx+=vx;
    bally+=vy; 
    vy+=ay;
    vx+=ax;
    if(bally<=balld/2) vy=-vy;
    if(bally>=height-balld/2) vy=-vy;   
    if(ballx<=balld/2){
      vx=-vx;
      ballx=balld/2;
    }
    if(ballx>=width-balld/2){
      vx=-vx;
      ballx=width-balld/2;
    }
    strokeWeight(5);
    stroke(0);
    fill(0);
    stroke(255);
    strokeWeight(5);
    fill(color2);
    circle(x, y, player1Size);
    fill(color3);
    circle(x2, y2, player2Size);
    if(aKey) x-=playerSpeed;
    if(dKey) x+=playerSpeed;
    if(wKey) y-=playerSpeed;
    if(sKey) y+=playerSpeed;
    if(a2Key) x2-=playerSpeed;
    if(d2Key) x2+=playerSpeed;
    if(w2Key) y2-=playerSpeed;
    if(s2Key) y2+=playerSpeed;
    if(dist(x, y, ballx, bally) <=d/2+balld/2){
      if(green){
        vx=(ballx-x)/8;
        vy=(bally-y)/8;
      }

    }
    if(dist(x2, y2, ballx, bally) <=d2/2+balld/2){
      if(green){
        vx=(ballx-x2)/8;
        vy=(bally-y2)/8;
      }

    }
    //if(dist(holex, holey, ballx, bally) <=holed/2+balld/2){
    //  points2+=2;
    //  ballx=width/2;
    //  bally=height/2;
    //  success.play();
    //}
    //if(dist(holex, height-holey, ballx, bally) <=holed/2+balld/2){
    //  points1+=2;
    //  ballx=width/2;
    //  bally=height/2;
    //  success.play();
    //}
    if(bally<=balld/2){
      if(green){
        points2++;
        ballx=width/2;
        bally=height/2;
        success.play();
        vx=0;
        vy=0;
      }
    }
    if(bally>=height-balld/2){
      if(green){
        points1++;
        ballx=width/2;
        bally=height/2;
        success.play();
        vx=0;
        vy=0;
      }
    }
    textSize(40);
    textAlign(CENTER, CENTER);
    fill(255, 0, 0);
    text(points1, x, y);
    text(points2, x2, y2);
    
    if (x<d/2) {
      x=d/2;
    }
    if (y<d/2) {
      y=d/2;
    }
    if (x>width-d/2) {
      x=width-d/2;
    }
    if (y>height-d/2) {
      y=height-d/2;
    }
    if (x2<d/2) {
      x2=d/2;
    }
    if (y2<d/2) {
      y2=d/2;
    }
    if (x2>width-d/2) {
      x2=width-d/2;
    }
    if (y2>height-d/2) {
      y2=height-d/2;
    }
    
  }
}
void keyPressed(){
  if(key=='a'){
    aKey=true;
  }
  if(key=='d'){
    dKey=true;
  }
  if(key=='w'){
    wKey=true;
  }
  if(key=='s'){
    sKey=true;
  }
  if(keyCode==LEFT){
    a2Key=true;
  }
  if(keyCode==RIGHT){
    d2Key=true;
  }
  if(keyCode==UP){
    w2Key=true;
  }
  if(keyCode==DOWN){
    s2Key=true;
  }
}
void keyReleased(){
  if(key=='a'){
    aKey=false;
  }
  if(key=='d'){
    dKey=false;
  }
  if(key=='w'){
    wKey=false;
  }
  if(key=='s'){
    sKey=false;
  }
  if(keyCode==LEFT){
    a2Key=false;
  }
  if(keyCode==RIGHT){
    d2Key=false;
  }
  if(keyCode==UP){
    w2Key=false;
  }
  if(keyCode==DOWN){
    s2Key=false;
  }
  if(key=='r'){
    mode=1;
  }
}
