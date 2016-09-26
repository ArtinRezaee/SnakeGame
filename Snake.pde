
class snake    //class to include the snake data
{
  color c = color(0);
  int speed = 2;
  int xcord;
  int ycord;
  int size=1;
  int[] headx;
  int[] heady;
  int score=0;
  boolean gameOver;
}
snake mysnake;
int foodx = int (random(width/10))*10; //random number for food's x location
int foody = int (random (height/10))*10; //random number for food's Y location
int counter=1;
void setup()
{

  size(500,500); //Determining the size of the screen
  mysnake = new snake(); //creating a new array named mysnake
  mysnake.headx = new int[100000000]; //defining the size of the arrays
  mysnake.heady = new int[100000000];
}

void draw()
{
 background(#FFC352); //determining the color of the background


  display();//calling the function display to display the snake
  move();//calling the function move to move the snake around
  
  fill(255,0,0); //drawing the food
  rect (foodx,foody,10,10);

  foodAte(); //calling the function to increase the size of the snake if the food is ate
  hitSelf(); //calling the function to check and see if the snake hits itslef 
  
}
  void move()  //move function to code the snake's movements
  {

    keyPressed(); //calling the function keypressed to see which key is pressed
    
    if(mysnake.headx[0]>width-9 || mysnake.headx[0]<0) //game over and restarting conditions
    {
      mysnake.gameOver=true;
      mysnake.speed=0;
      textSize(40);
      fill(255);
      text("GAME OVER!",130,height/2);
      textSize(20);
      text("Click on the screen to restart",110,270);
      text("or press ESC to quit",165, 290);
      textSize(15);
      text("score:",400,30);
      text(mysnake.score,450,30);
      if(keyPressed==true && key==ESC)
      {
        exit();
      }
    }
    if (mysnake.heady[0]>height-9 || mysnake.heady[0]<0) //game over and restarting conditions
    {
      mysnake.gameOver=true;
      mysnake.speed=0;
      textSize(40);
      fill(255);
      text("GAME OVER!",130,height/2);
      textSize(20);
      text("Click on the screen to restart",110,270);
      text("or press ESC to quit",165, 290);
      textSize(15);
      text("score:",400,30);
      text(mysnake.score,450,30);
      if(keyPressed==true && key==ESC)
      {
        exit();
      }
    }
  }

void foodAte() //function to check and see if the food is ate and if so, increase the size of the snake
{
  if(foodx<=mysnake.headx[0] && foodx+10>=mysnake.headx[0] && foody<=mysnake.heady[0] && foody+10>=mysnake.heady[0] || foodx<=mysnake.headx[0]+10 && foodx+10>=mysnake.headx[0]+10 && foody<=mysnake.heady[0]+10 && foody+10>=mysnake.heady[0]+10)
  {
    mysnake.size=mysnake.size+10;
    mysnake.score++;
    foodx = int (random(width/10))*10; //random number for food's x location
    foody = int (random (height/10))*10; //random number for food's Y location
    fill(255,0,0); //drawing the food
    rect (foodx,foody,10,10);
  }
}

boolean hitSelf() //function to check and see if the snake hits itslef and if so, run the gameover condions
{
 
  for(int i=1; i<mysnake.size;i++)
  {
    if(mysnake.headx[0]==mysnake.headx[i] && mysnake.heady[0]==mysnake.heady[i])
    {
      mysnake.gameOver=true;
      noLoop();
      fill(255);
      textSize(40);
      text("GAME OVER!",130,height/2);
      textSize(20);
      text("Click on the screen to restart",110,270);
      text("or press ESC to quit",165, 290);
      textSize(15);
      text("score:",400,30);
      text(mysnake.score,450,30);
      if(keyPressed==true && key==ESC)
      {
        exit();
      }
     
  
    }
  }
  return false;
}
  void display() //displaying the snake 
{
  fill(mysnake.c);
  for (int i=0; i<mysnake.size ;i++)
  {
    mysnake.xcord= mysnake.headx[i];
    mysnake.ycord= mysnake.heady[i];
    rect(mysnake.xcord,mysnake.ycord,10,10);
}
 for(int i = mysnake.size; i > 0; i--)
 {
    mysnake.headx[i] = mysnake.headx[i-1];
    mysnake.heady[i] = mysnake.heady[i-1];
  }

}


void keyPressed() //conditions to move the snake
{
  if (key==CODED)
  {
    if (keyCode==UP)
    {
      mysnake.heady[0]=mysnake.heady[0]-mysnake.speed;
    }
    else if ( keyCode==DOWN)
    {
      mysnake.heady[0]=mysnake.heady[0]+mysnake.speed;
    }
    else if (keyCode==RIGHT)
    {
      mysnake.headx[0]=mysnake.headx[0]+mysnake.speed;
      if(mysnake.headx[0]==mysnake.headx[1])
      {
        mysnake.heady[0]=mysnake.heady[0]-mysnake.speed;
      }
    }
    else if (keyCode==LEFT)
    {
      mysnake.headx[0]=mysnake.headx[0]-mysnake.speed;
      if(mysnake.headx[0]==mysnake.headx[1])
      {
        mysnake.heady[0]=mysnake.heady[0]+mysnake.speed;
      }
    }
    else
    {
    }
 
  }
}
void mouseClicked()
{
//set all variables to default 
     mysnake.xcord=3;
     mysnake.ycord=3;
     mysnake.headx[0]=1;
     mysnake.heady[0]=1;
     mysnake.size=1;
     mysnake.score=0;
     mysnake.speed=2;
     loop();
}