/*
  Description: A game where one has to cross the roads, dodge obstacles and get to the other side while collecting all the coins. 
 Author: Vinesh Vivekanand
 Date of last edit: December 9th,2019
 */



float birdX;
float birdY;
float carX;
float carY;
boolean gameOver=false; 
boolean waterDeath=false;
boolean characters=false;
boolean cloudsMove=true;
boolean charactersChosen=false;
boolean coin1=false;
boolean coin2=false;
boolean coin3=false;
boolean coin4=false;
boolean coin5=false;
boolean coin6=false;
boolean moving=true;
boolean cheatCode=false;
float log1;
PImage crocR;
float crocRX, crocRX2, crocRX3, crocRX4, crocRX5, crocRX6, crocRX7;
PImage crocL;
PImage blackCar, pinkCar, redCar, orangeCar, blueCar, greenCar, greenLeftCar, pinkLeftCar, blackRightCar, orangeRightCar, redRightCar, blueRightCar;
PImage dog;
PImage bunny;
PImage penquin;
PImage lion;
PImage fox;
PImage monkey;
PImage frog;
PImage bird;

PImage birdSmall;
PImage cloud;
PImage coin;

PImage character;
PImage play;
PImage pylon;

float crocLX, crocLX2, crocLX3, crocLX4, crocLX5;
float blackCarX;
float pinkCarX;
float redCarX;
float orangeCarX;
float blueCarX;
float greenCarX;
float greenLeftCarX;
float pinkLeftCarX;

float blackRightCarX;
float orangeRightCarX;
float redRightCarX;
float blueRightCarX;

float coin1X, coin2X, coin3X, coin4X, coin5X, coin6X;

int begin; 
int duration;
int time;

int  coin1Y;
int  coin2Y;
int  coin3Y;
int  coin4Y;
int  coin5Y;
int  coin6Y;



void settings() {
  size(1250, 700);
}

void setup() {
  carX=1070;
  carY=548;
  birdY=650;
  birdX=width/2;
  log1=-60;
  crocR=loadImage("CrocodileRight.png");
  crocL=loadImage("CrocodileLeft.png");
  blackCar=loadImage("Black Car.png");
  pinkCar=loadImage("Pink Car.png");
  redCar=loadImage("Red Car.png");
  orangeCar=loadImage("Orange Car.png");
  blueCar=loadImage("Blue Car.png");
  greenCar=loadImage("Green Car.png");
  greenLeftCar=loadImage("Green Car Left.png");
  pinkLeftCar=loadImage("Pink Car Left.png");
  blackRightCar=loadImage("Black Car Right.png");
  orangeRightCar=loadImage("Orange Car Right.png");
  redRightCar=loadImage("Red Car Right.png");
  blueRightCar=loadImage("Blue Car Right.png");

  dog=loadImage("Dog.png");
  bunny=loadImage("Bunny.png");
  penquin=loadImage("Penquin.png");
  lion=loadImage("Lion.png");
  fox=loadImage("Fox.png");
  monkey=loadImage("Monkey.png");
  frog=loadImage("Frog.png");
  bird=loadImage("Bird.png");

  birdSmall=loadImage("Bird Small.png");
  cloud=loadImage("Cloud.png");
  coin=loadImage("Coin.png");
  play=loadImage("Play.png");
  character=loadImage("Character .png");
  pylon=loadImage("Pylon.png");
  crocRX=-50;                                                                                                                                                                                                                                                              
  crocRX2=-60;
  crocRX3=-80;
  crocRX4=-120;
  crocRX5=-150;
  crocRX6=-70;
  crocRX7=-120;
  crocLX=1400;
  crocLX2=1600;
  crocLX3=1800;
  crocLX4=1700;
  crocLX5=1900;
  blackCarX=500;
  pinkCarX=-100;
  redCarX=1100;
  greenCarX=-550;
  blueCarX=800;
  orangeCarX=1300;
  greenLeftCarX=1450;
  pinkLeftCarX=1650;
  blackRightCarX=-350;
  orangeRightCarX=-850;
  redRightCarX=300;
  blueRightCarX=500;

  coin1X=58;
  coin2X=865;
  coin3X=1179;
  coin4X=704;
  coin5X=1024;
  coin6X=224;

  coin1Y=491;
  coin2Y=409;
  coin3Y=576;
  coin4Y=252;
  coin5Y=177;
  coin6Y=177;

  begin = millis();
  time = duration = 30;
}

void draw() {
  background(255);
  imageMode(CENTER); // makes the location of image in the center 

  noStroke(); // landscaping 
  fill(0, 255, 0);
  rect(0, 609, 1250, 80); // grass
  rect(0, 369, 1250, 80);
  fill(110);
  rect(0, 449, 1250, 160); // road
  rect(0, 0, 1250, 160); // road
  fill(18, 162, 255);
  rect(0, 129, 1250, 240); // lake 


  for (int i = 20; i < 1230; i = i+50) { // loops the road lines on both sides 
    stroke(255, 230, 3);
    strokeWeight(5);
    line(i, 528, i+30, 528);
    line(i, 41, i+30, 41);
  }

  for (int j = 303; j < 550; j = j+80) {// loops the set of pylons 
    image (pylon, j, 74, 60, 60);
  }

  for (int j = 860; j < 957; j = j+80) {// loops a different set of pylons
    image (pylon, j, 74, 60, 60);
  }

  for (int j = 1100; j < 1205; j = j+80) {// loops a different set of pylons
    image (pylon, j, 74, 60, 60);
  }

  for (int j = 63; j < 169; j = j+80) {// loops a different set of pylons
    image (pylon, j, 74, 60, 60);
  }
 
  if (birdX>=273 && birdX<=570 && birdY>=42 && birdY<=126) {// if bird lands on pylon == death 
    gameOver=true;
  } else if (birdX>=832 && birdX<=966 && birdY>=42 && birdY<=126) {
    gameOver=true;
  } else if (birdX>=1071 && birdY>=42 && birdY<=126) {
    gameOver=true;
  } else if (birdX<=168 && birdY>=42 && birdY<=126) {
    gameOver=true;
  }

  for (int p = 0; p < 1260; p = p+100) {// black rects of the finish & start line 
    noStroke();
    fill(0);
    rect(p, 0, 50, 10);
    rect(p, 689, 50, 10);
  }
  for (int p = 50; p < 1260; p = p+100) {// white rects of the finish & start line 
    fill(220);
    rect(p, 0, 50, 10);
    rect(p, 689, 50, 10);
  }


  noStroke(); 

  if (birdX<-20 || birdX>1270 || birdY>702) {// if bird moves off the screen parameters== death
    gameOver=true;
  }

  //if (birdX>=carX && birdX<carX+101 && birdY<=carY+40 && birdY>=carY) {
  //  gameOver=true;
  //}

  if (birdY>=291 && birdY<=360 && birdX>=599 && birdX<=652) { // causes death if you jump in the water 
    gameOver=false;
  } else if (birdY>=291 && birdY<=360 && (birdX<=597 || birdX>=654)) {
    gameOver=true;
  } else if (birdY>=217 && birdY<=277 && birdX>=599 && birdX<=822) {
    gameOver=false;
  } else if (birdY>=217 && birdY<=277 && (birdX<=597 || birdX>=822)) {
    gameOver=true;
  } else if (birdY>=135 && birdY<=201 && birdX>=109 && birdX<=656) {
    gameOver=false;
  } else if (birdY>=135 && birdY<=201 && (birdX<=107 || birdX>=657 && birdX<733)) {
    gameOver=true;
  } else if (birdY>=135 && birdY<=201 && birdX>=1053) {
    gameOver=true;
  }

  int u=-10;
  int c=-70;
  while (c<=1247) { // loops 1 set waves in the water 
    c+=150;

    u=90;
    while (u<=305) {
      noFill();
      strokeWeight(5);
      stroke(11, 91, 155);
      arc(c, u, 130, 130, radians(40), radians(80));
      arc(c+100, u, 130, 130, radians(100), radians(140)); 
      u+=70;
    }
  } 

  int t=20;
  int z=-150;
  while (z<=1247) {// loops second set waves in the water 
    z+=150;

    t=130;
    while (t<=305) {
      noFill();
      strokeWeight(5);
      stroke(11, 91, 155);
      arc(z, t, 130, 130, radians(40), radians(80));
      arc(z+100, t, 130, 130, radians(100), radians(140)); 
      t+=70;
    }
  } 

  noStroke(); // lilipads
  fill(9, 90, 47);
  ellipse(625, 330, 50, 50);
  ellipse(625, 249, 50, 50);
  ellipse(704, 249, 50, 50);
  ellipse(784, 249, 50, 50);



  for (int x = 144; x <= 624; x = x+80  ) {// loops lilipads with triangle cut out
    fill(9, 90, 47);
    ellipse(x, 170, 50, 50);
    fill(18, 162, 255);
    triangle(x, 170, x-20, 130, x+20, 130);
  }

  for (int x = 784; x <= 1025; x = x+80  ) {// loops second set of lilipads 
    fill(9, 90, 47);
    ellipse(x, 170, 50, 50);
    fill(18, 162, 255);
    triangle(x, 170, x-20, 130, x+20, 130);
  }

  int y=-10;
  int x=-10;
  while (x<=1247) { // loops the grass
    x+=12;

    y=372;
    while (y<=440) {
      stroke(0);
      strokeWeight(1);
      fill(15, 170, 58);  
      triangle(x, y, x-10, y+20, x+10, y+20);
      y+=28;
    }
  } 
  
  int q=10;
  int d=10;
  while (d<=1250) { // loops the grass
    d+=80;

    q=607;
    while (q<=688) {
      fill(200);  
     ellipse(d,q,10,10);
      q+=40;
    }
  } 
  
   int k=10;
  int a=-10;
  while (a<=1250) { // loops the grass
    a+=20;

    k=617;
    while (k<=671) {
      fill(15, 170, 58);  
      triangle(a, k, a-10, k+20, a+10, k+20);
      k+=40;
    }
  } 
  
   


  image(coin, coin1X, coin1Y, 70, 70); // creates images on coins 
  image(coin, coin3X, coin3Y, 70, 70);
  image(coin, coin5X, coin5Y, 70, 70);
  image(coin, coin6X, coin6Y, 70, 70);
  image(coin, coin4X, coin4Y, 70, 70);
  image(coin, coin2X, coin2Y, 70, 70);

  if (birdX>=21 && birdX<=88 && birdY>=455 && birdY<=511) {// if bird is over coin, ==true
    coin1=true;
  } else if (coin1==true) { // if true set coin at the bottom right on screen 
    coin1X=1200;
    coin1Y=649;
  } else { // else leave it where it is
    coin1X=58;
    coin1Y=491;
  }

  if (birdX>=819 && birdX<=905 && birdY>=367 && birdY<=443) {// if bird is over coin, ==true
    coin2=true;
  } else if (coin2==true) {// if true set coin at the bottom right on screen 
    coin2X=1150;
    coin2Y=649;
  } else {// else leave it where it is
    coin2X=865;
    coin2Y=409;
  }

  if (birdX>=1145 && birdX<=1223 && birdY>=536 && birdY<=607) {// if bird is over coin, ==true
    coin3=true;
  } else if (coin3==true) {// if true set coin at the bottom right on screen 
    coin3X=1100;
    coin3Y=649;
  } else {// else leave it where it is
    coin3X=1179;
    coin3Y=576;
  }

  if (birdX>=672 && birdX<=732 && birdY>=208 && birdY<=278) {// if bird is over coin, ==true
    coin4=true;
  } else if (coin4==true) {// if true set coin at the bottom right on screen 
    coin4X=1050;
    coin4Y=649;
  } else {// else leave it where it is
    coin4X=704;
    coin4Y=252;
  }

  if (birdX>=989 && birdX<=1059 && birdY>=134 && birdY<=198) {// if bird is over coin, ==true
    coin5=true;
  } else if (coin5==true) {// if true set coin at the bottom right on screen 
    coin5X=1000;
    coin5Y=649;
  } else {// else leave it where it is
    coin5X=1024;
    coin5Y=177;
  }

  if (birdX>=186 && birdX<=266 && birdY>=134 && birdY<=198) {// if bird is over coin, ==true
    coin6=true;
  } else if (coin6==true) {// if true set coin at the bottom right on screen 
    coin6X=950;
    coin6Y=649;
  } else {// else leave it where it is
    coin6X=224;
    coin6Y=177;
  }

  image(crocR, crocRX, 250); // create constantly moving crocodiles
  crocRX+=5;
  image(crocR, crocRX2, 250);
  crocRX2+=2;
  image(crocR, crocRX3, 250);
  crocRX3+=7;
  image(crocR, crocRX4, 250);
  crocRX4+=10;
  image(crocL, crocLX, 330);
  crocLX+=-3;
  image(crocL, crocLX2, 330);
  crocLX2+=-6;
  image(crocL, crocLX3, 330);
  crocLX3+=-10;
  image(crocR, crocRX5, 170);
  crocRX5+=6;
  image(crocR, crocRX6, 170);
  crocRX6+=12;
  image(crocR, crocRX7, 170);
  crocRX7+=3;
  image(crocL, crocLX4, 170);
  crocLX4+=-1;
  image(crocL, crocLX5, 170);
  crocLX5+=-7;


  if (crocRX>1400) { // when crocodile reaches end of screen, reappear on opposite side 
    crocRX=-70;
  } else if (crocRX2>1400) {
    crocRX2=-60;
  } else if (crocRX3>1400) {
    crocRX3=-80;
  } else if (crocRX4>1400) {
    crocRX4=-120;
  } else if (crocRX5>1400) {
    crocRX5=-120;
  } else if (crocRX6>1400) {
    crocRX6=-160;
  } else if (crocRX7>1400) {
    crocRX7=-180;
  } else if (crocLX<-70) {
    crocLX=1400;
  } else if (crocLX2<-70) {
    crocLX2=1600;
  } else if (crocLX3<-70) {
    crocLX3=1800;
  } else if (crocLX4<-70) {
    crocLX4=1900;
  } else if (crocLX5<-70) {
    crocLX5=1800;
  }


  if (birdX>=crocRX-80 && birdX<crocRX+80 && birdY>209 && birdY<287) {// if the bird is inbewteen the tail and the head of the crocodile == death
    gameOver=true;
  } else if (birdX>=crocRX2-80 && birdX<crocRX2+80 && birdY>209 && birdY<287) {
    gameOver=true;
  } else  if (birdX>=crocRX3-80 && birdX<crocRX3+80 && birdY>209 && birdY<287) {
    gameOver=true;
  } else  if (birdX>=crocRX4-80 && birdX<crocRX4+80 && birdY>209 && birdY<287) {
    gameOver=true;
  } else  if (birdX>=crocRX5-80 && birdX<crocRX5+80 && birdY>134 && birdY<203) {
    gameOver=true;
  } else  if (birdX>=crocRX6-80 && birdX<crocRX6+80 && birdY>134 && birdY<203) {
    gameOver=true;
  } else  if (birdX>=crocRX7-80 && birdX<crocRX7+80 && birdY>134 && birdY<203) {
    gameOver=true;
  } else  if (birdX>=crocLX-80 && birdX<crocLX+80 && birdY>287 && birdY<357) {
    gameOver=true;
  } else if (birdX>=crocLX2-80 && birdX<crocLX2+80 && birdY>287 && birdY<357) {
    gameOver=true;
  } else if (birdX>=crocLX3-80 && birdX<crocLX3+80 && birdY>287 && birdY<357) {
    gameOver=true;
  } else if (birdX>=crocLX4-80 && birdX<crocLX4+80 && birdY>134 && birdY<203) {
    gameOver=true;
  } else if (birdX>=crocLX5-80 && birdX<crocLX5+80 && birdY>134 && birdY<203) {
    gameOver=true;
  }

  
  image(blackCar, blackCarX, 568); // create images of different constantly moving cars
  blackCarX-=4;
  image(pinkCar, pinkCarX, 484);
  pinkCarX+=7;
  image(redCar, redCarX, 575);
  redCarX-=4;
  image(orangeCar, orangeCarX, 568);
  orangeCarX-=4;
  image(blueCar, blueCarX, 575);
  blueCarX-=4;
  image(greenCar, greenCarX, 490);
  greenCarX+=7;
  image(greenLeftCar, greenLeftCarX, 568);
  greenLeftCarX-=4;
  image(pinkLeftCar, pinkLeftCarX, 575);
  pinkLeftCarX-=4;
  image(blackRightCar, blackRightCarX, 490);
  blackRightCarX+=7;
  image(orangeRightCar, orangeRightCarX, 490);
  orangeRightCarX+=7;
  image(redRightCar, redRightCarX, 484);
  redRightCarX+=7;
  image(blueRightCar, blueRightCarX, 484);
  blueRightCarX+=7;


  if (blackCarX<-70) { // if cars reach off the screen, make them reappear on the opposite side 
    blackCarX=1400;
  } else if (pinkCarX>1600) {
    pinkCarX=-50;
  } else if (redCarX<-70) {
    redCarX=1400;
  } else if (greenCarX>1600) {
    greenCarX=-50;
  } else if (blueCarX<-70) {
    blueCarX=1400;
  } else if (orangeCarX<-70) {
    orangeCarX=1400;
  } else if (greenLeftCarX<-70) {
    greenLeftCarX=1400;
  } else if (pinkLeftCarX<-70) {
    pinkLeftCarX=1400;
  } else if (blackRightCarX>1600) {
    blackRightCarX=-50;
  } else if (orangeRightCarX>1600) {
    orangeRightCarX=-50;
  } else if (redRightCarX>1600) {
    redRightCarX=-50;
  } else if (blueRightCarX>1600) {
    blueRightCarX=-50;
  }

  if (birdX>=blackCarX-60 && birdX<blackCarX+60 && birdY>533 && birdY<608) { // crash collision for black car 
    gameOver=true;
  } else if (birdX>=pinkCarX-60 && birdX<pinkCarX+60 && birdY>450 && birdY<525) { // crash collision for pink car 
    gameOver=true;
  } else if (birdX>=redCarX && birdX<redCarX+60 && birdY>533 && birdY<608) { // crash collision for red car 
    gameOver=true;
  } else if (birdX>=greenCarX-60 && birdX<greenCarX+60 && birdY>450 && birdY<525) {// crash collision for green car 
    gameOver=true;
  } else if (birdX>=blueCarX && birdX<blueCarX+60 && birdY>533 && birdY<608) {// crash collision for blue car 
    gameOver=true;
  } else if (birdX>=orangeCarX && birdX<orangeCarX+60 && birdY>533 && birdY<608) {// crash collision for orange car 
    gameOver=true;
  } else if (birdX>=greenLeftCarX && birdX<greenLeftCarX+60 && birdY>533 && birdY<608) {// crash collision for green car moving left 
    gameOver=true;
  } else if (birdX>=pinkLeftCarX && birdX<pinkLeftCarX+60 && birdY>533 && birdY<608) {// crash collision for pink car moving left  
    gameOver=true;
  } else if (birdX>=blackRightCarX && birdX<blackRightCarX+60 && birdY>450 && birdY<525) {// crash collision for black car moving left 
    gameOver=true;
  } else if (birdX>=orangeRightCarX && birdX<orangeRightCarX+60 && birdY>450 && birdY<525) {// crash collision for orange car moving right 
    gameOver=true;
  } else if (birdX>=redRightCarX && birdX<redRightCarX+60 && birdY>450 && birdY<525) {// crash collision for red car moving right  
    gameOver=true;
  } else if (birdX>=blueRightCarX && birdX<blueRightCarX+60 && birdY>450 && birdY<525) {// crash collision for blue car moving right 
    gameOver=true;
  }

  fill(0);// makes the count down black until game over where it turns red 

  if (gameOver==true || time==0) {// if you die or time runs out 
    fill(255, 0, 0);
    textSize(169);
    text("GAME OVER", 128, height/2);// print Game Over
    birdX=width/2; // reset X positiion 
    birdY=650;// reset Y position 
    coin1=false;// make coins reappear 
    coin2=false;
    coin3=false;
    coin4=false;
    coin5=false;
    coin6=false;
    begin = millis();// reset timer 
    time = duration;
    
  }
  if (charactersChosen==true) {// if the character button is pressed then create the if statement
    if (mouseX>=172 && mouseX<=342 && mouseY>=43 && mouseY<=305 && mousePressed ) {// if you click on the dog make dog the new character 
      birdSmall=dog;  
      characters=false;
    } else if (mouseX>=361 && mouseX<=637 && mouseY>=45 && mouseY<=303 && mousePressed ) {// if you click on the bunny make bunny the new character 
      birdSmall=bunny;  
      characters=false;
    } else if (mouseX>=624 && mouseX<=872 && mouseY>=66 && mouseY<=304 && mousePressed ) {// if you click on the penquin make penquin the new character 
      birdSmall=penquin; 
      characters=false;
    } else if (mouseX>=903 && mouseX<=1099 && mouseY>=77 && mouseY<=310 && mousePressed ) {// if you click on the lion make lion the new character 
      birdSmall=lion; 
      characters=false;
    } else if (mouseX>=148 && mouseX<=388 && mouseY>=348 && mouseY<=585 && mousePressed) {// if you click on the fox make fox the new character 
      birdSmall=fox; 
      characters=false;
    } else if (mouseX>=400 && mouseX<=613 && mouseY>=346 && mouseY<=564 && mousePressed ) {// if you click on the monkey make monkey the new character 
      birdSmall=monkey; 
      characters=false;
    } else if (mouseX>=664 && mouseX<=842 && mouseY>=361 && mouseY<=554 && mousePressed ) {// if you click on the frog make frog the new character 
      birdSmall=frog; 
      characters=false;
    } else if (mouseX>=886 && mouseX<=1082 && mouseY>=339 && mouseY<=563 && mousePressed ) {// if you click on the bird make bird the new character 
      birdSmall=bird; 
      characters=false;
    }
  }


  image (birdSmall, birdX, birdY, 95, 95);// create starting image of bird

  if (time > 0)  time = duration  - (millis()-begin )/1000;// counts down clock 
  textSize(60);
  text(time, 250, 663);


  if (mouseX>=37 && mouseX<=103 && mouseY>=618 && mouseY<=678 && mousePressed) {// if you click the character button, open the character options
    characters=true;
    charactersChosen=true;
  } else if (mouseX>=127 && mouseX<=203 && mouseY>=618 && mouseY<=678 && mousePressed) {// if you click the play button go back to home screen 
    cloudsMove=true;
  }


  image(play, 171, 660, 80, 80); // play button image 
  image(character, 80, 652, 80, 80);// chracter button image 



  if (characters==true) {// if the character button is chosen create these images 
    image(dog, 250, 180);
    image(bunny, 500, 180);
    image(penquin, 750, 180);
    image(lion, 1000, 180);
    image(fox, 270, 480);
    image(monkey, 500, 520);
    image(frog, 750, 460);
    image(bird, 1000, 470);
  }

  if (cloudsMove==true) {// home page
    fill(135, 169, 234);
    rect(0, 0, 1250, 700); // blue background 

    for (int X = 40; X <= 1250; X = X+120  ) {// create larger middle clouds
      image(cloud, X, 30, 200, 200);
      image(cloud, X, 430, 200, 200);
    }

    for (int X = 40; X <= 1250; X = X+170  ) {// create smaller edge clouds
      image(cloud, X, 100, 250, 250);
      image(cloud, X, 196, 350, 350);
      image(cloud, X, 250, 250, 250);
      image(cloud, X, 346, 350, 350);
      image(cloud, X, 450, 250, 250);
      image(cloud, X, 566, 350, 350);
      image(cloud, X, 630, 200, 200);
    }


    image(play, 633, 511, 200, 200);// make play button 


    fill(214, 125, 125);
    textSize(129);
    text("Highway Mayhem", 138, height/2); // print title of game
    fill(0);
    textSize(129);
    text("Highway Mayhem", 128, 340); // print it again for bubble lettering 
  }  

  if (mouseX>=530 &&  mouseX<=716 && mouseY>=409 && mouseY<=555 && mousePressed ) { // if play button is clicked, start game
    cloudsMove=false;
  }

if(mouseX>=85 && mouseX<=95 && mouseY>=681 && mouseY<=692 && mousePressed){// press buttom left circle for cheat win 
  cheatCode=true;
}


  if (coin1==true && coin2==true && coin3==true && coin4==true && coin5==true && coin6==true && gameOver==false && time>0 && birdY<0 || cheatCode==true && gameOver==false) {// if the goins are collected, you don't get hit by the obstackes and you beat the timer, you win 
    fill(random(255), random(255), random(255));
    textSize(129);
    text("WINNER!!!", 330, height/2);// print winner sign 
        fill(0);
        textSize(50);
    text("Press 'r' to reset", 420, 400);// print winner sign 
  }
  
}

void keyPressed() {
  if (key == 'w' || key == 'W' || keyCode == UP ) { // if "w" or "up arrow" is pressed move up and prevent the choice of characters and make game over false until one dies again 
    birdY-=80;    
    gameOver=false;
    characters=false;
    charactersChosen=false;
  } else if (key == 's' || key == 'S' || keyCode == DOWN) { // if "s" or "down arrow" is pressed move up and prevent the choice of characters and make game over false until one dies again 
    birdY+=80;      
    gameOver=false;
    characters=false;
    charactersChosen=false;
  } else if (key == 'd' || key == 'D' || keyCode == RIGHT) { // if "d" or "right arrow" is pressed move up and prevent the choice of characters and make game over false until one dies again 
    birdX+=80;      
    gameOver=false;
    characters=false;
    charactersChosen=false;
  } else if (key == 'a' || key == 'A' || keyCode == LEFT) { // if "a" or "left arrow" is pressed move up and prevent the choice of characters and make game over false until one dies again 
    birdX-=80;      
    gameOver=false;
    characters=false;
    charactersChosen=false;
  }else if (key == 'r' || key == 'R' ) {// resets the game and the cheat code 
    gameOver=true;
    cheatCode=false;
  }
}

void mousePressed() {// print x and y locations which helps pin point where to place any images of objects 
  println(mouseX);
  println(mouseY);
}
