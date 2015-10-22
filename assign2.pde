int state;
// start bg
PImage start1;
PImage start2;
// end bg
PImage end1;
PImage end2;
//  background
PImage bg1;
PImage bg2;
int bg1x,bg2x;
// fighter
PImage shipImg;
int shipx;
int shipy;
float shipspeed = 5;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

// treasure
PImage treasureImg;
int treasureX=floor (random(600));
int treasureY=floor (random(450));
// enemy
PImage enemyImg;
int enemyX;
int enemyY=floor (random(0,400));
// hp
PImage hpImg;
int hpX=55;                                       

void setup () {  
  size(640,480) ; 
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");  
  shipImg=loadImage("img/fighter.png");
  enemyImg=loadImage("img/enemy.png"); 
  hpImg=loadImage("img/hp.png");
  treasureImg=loadImage("img/treasure.png");
  
  shipx = 640/2;
  shipy = 480/2; 
 
  bg1x=640;
  bg2x=0;
  
  state=0;                                  
}

void draw() {
  background(0);
  // start
  if (state==0){
   image(start2,0,0);
     if ((454>mouseX && mouseX>208) && (412>mouseY && mouseY>379)){
       image(start1,0,0);
        if (mousePressed){state++;
       }
     }
   }
 // play
 if (state==1){
 // moving background
  image(bg1,bg1x-640,0);
  image(bg2,bg2x-640,0);
  bg1x++;
  bg2x++;
  bg1x%=1280;
  bg2x%=1280;
 // ship 
   image(shipImg,shipx,shipy);
 if (upPressed == true){
   if (shipy > 0){
    shipy -= shipspeed;
   }
  }
  if (downPressed == true) {
    if (shipy < 430){
    shipy += shipspeed;
    }
  }
  if (leftPressed == true){
    if (shipx>0 ) {
    shipx -= shipspeed;
  }}
  if (rightPressed == true){
     if (590>shipx ) {
    shipx += shipspeed;
  } }
 // treasure   
  image(treasureImg, treasureX, treasureY);
  
  if (treasureX<shipx+40 && treasureX+40>shipx){
     if (treasureY>shipy-40 && treasureY-40<shipy){
       if (hpX<196){
         hpX+=20;
       }
       if (hpX>=196){
         hpX=216;
       }
     treasureX=floor (random(600));
     treasureY=floor (random(440));
  }
  }
  
 // enemy
  image(enemyImg,enemyX,enemyY);
  
      enemyX += 4;
      enemyX%=620;
            
  //enemy go to ship
     if (enemyY>shipy){enemyY-=2;}
     if (enemyY<shipy){enemyY+=2;}
  //hit enemy    
  if (enemyX<shipx+50 && enemyX+50>shipx){   
    if (enemyY-50<shipy && enemyY>shipy-50){
    hpX-=40;
    enemyX=-50;
    enemyY=floor (random(0,400));
    }
  }

    
 // hp 
  fill(#FF0000);
 rectMode(CORNERS);
  rect(15,30,hpX,10);
  image(hpImg,10,10); 
if (hpX<=15){
  state++;
}
 }
  
 // end
  if (state==2){
   image(end2,0,0);
     if ((433>mouseX && mouseX>209) && (345>mouseY && mouseY>312)){
       image(end1,0,0);
        if (mousePressed){
        state=0;
        hpX=50;
      }
  
     }
   }
 }
 
//fighter moving
void keyPressed() {
  if (key == CODED) {  
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
    
   
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
