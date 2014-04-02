/*
  Author: Necip Onur Uzun
*/

boolean[] keys = new boolean[4];
final int U = 0;
final int D = 1;
final int W = 2;
final int S = 3;

String playerAName = "PlayerA";
String playerBName = "PlayerB";
int playerAX, playerAY, playerBX, playerBY, playerAScore, playerBScore;
int ballX, ballY, ballSize, ballDirectionX, ballDirectionY, ballSpeed;
int playerHeight = 100;
int playerWidth = 20;

void initBall()
{
  ballX = width/2;
  ballY = height/2;
  ballDirectionX *= -1;
}

void setup()
{
  size(600, 400);
  
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  playerAX = width - playerWidth;
  playerAY = (height/2);
  
  playerBX = playerWidth;
  playerBY = (height/2);
  
  initBall();
  ballSize = 20;
  
  ballSpeed = 2;
  ballDirectionX = 1;
  ballDirectionY = 1;
  
  playerAScore = 0;
  playerBScore = 0;
}

void draw()
{
  background(100);
  
  line(width/2, 0, width/2, height);
  
  textSize(16);
  fill(200);
  text(playerAScore, width/2 - 25, 30);
  text(playerBScore, width/2 + 20, 30);
  text(playerAName, width/2 - 100, 30);
  text(playerBName, width/2 + 40, 30);

  if (keys[U]) {
    if (playerAY > (playerHeight/2)) {
      playerAY=playerAY-5;
    }
  }
  if (keys[D]) {
    if (playerAY < height - (playerHeight/2)) {
      playerAY=playerAY+5;
    }
  }
  if (keys[W]) {
    if (playerBY > (playerHeight/2)) {
      playerBY=playerBY-5;
    }
  }
  if (keys[S]) {
    if (playerBY < height - (playerHeight/2)) {
      playerBY=playerBY+5;
    }
  }
  fill(20);
  rect(playerAX, playerAY, playerWidth, playerHeight);
  rect(playerBX, playerBY, playerWidth, playerHeight);
  
  fill(30);
  ellipse(ballX, ballY, ballSize, ballSize);
  ballMove();
}

void ballMove() {
  ballY = ballY + ballDirectionY * ballSpeed;
  ballX = ballX + ballDirectionX * ballSpeed;
  if(ballY > (height-ballSize/2)) {
    ballDirectionY = -1;
  }
  if(ballY < ballSize/2) {
    ballDirectionY = 1;
  }
  if((ballX > playerAX - playerWidth) && (ballY < playerAY + (playerHeight/2) && ballY > playerAY - (playerHeight/2))) {
    ballDirectionX = -1;
  }
  
  if(ballX > width - playerWidth/2) {
    playerAScore++;
    initBall();
  }
  
  if((ballX < playerBX + playerWidth) && (ballY < playerBY + (playerHeight/2) && ballY > playerBY - (playerHeight/2))) {
    ballDirectionX = 1;
  }
  
  if(ballX < playerWidth/2) {
    playerBScore++;
    initBall();
  }
}

void keyPressed() {
  int mybutton = key;

  switch (mybutton) {
    case 65535:
      if (keyCode == UP) {
        keys[U] = true;
      }
      if (keyCode == DOWN) {
        keys[D] = true;
      }
      break;
      case 'w':
        keys[W] = true;
        break;
      case 's':
        keys[S] = true;
        break;
  }
}

void keyReleased() {
  int mybutton = key;

  switch (mybutton) {
    case 65535:
      if (keyCode == UP) {
        keys[U] = false;
      }
      if (keyCode == DOWN) {
        keys[D] = false;
      }
      break;
      case 'w':
        keys[W] = false;
        break;
      case 's':
        keys[S] = false;
        break;
  }
}
