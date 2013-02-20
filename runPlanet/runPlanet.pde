/*
* Main Run Program for Civ Space game
* Luke Harper v0.0.1
*/

int time;
Unit p[] = new Unit [10000];
int amountOfPlanets=3;
int numShips=0;

void setup()
{
  time=0;
  size(1000,650);
  background(0);
  p[0] = new MedPlanet(0, 0, true, 10, (int)random(40,60));
  p[1] = new LargePlanet(-width/2, -height/2, true, 10, (int)random(50,76));
  p[2] = new SmallPlanet(width/2, height/2, true, 10, (int)random(30,50));
  p[3] = new Planet(width, height, true, 10, 25);
  amountOfPlanets=4;
}

void draw()
{
  background(0);
  
  for(int i=0; i<amountOfPlanets; i++)
  {
   p[i].update();
  }  
  mouseTracker();
  time++;
}

public void mouseTracker()
{
  int speed =3;
  int mr=100; //mouseRange
  int xval=0;
  int yval=0;
  
  if(mouseX<mr&&mouseY<mr)
  {
    xval=speed;
    yval=speed;
  }
  else if(mouseX<mr&&mouseY>height-mr)
  {
    xval=1;
    yval=-speed;
  }
  else if(mouseX>width-mr&&mouseY<mr)
  {
    xval=-speed;
    yval=speed;
  }
  else if(mouseX>width-mr&&mouseY>height-mr)
  {
    xval=-speed;
    yval=-speed;
  }  
  else if(mouseX<50&&(mouseY>50&&mouseY<height-50))
  {
    xval=speed;
    yval=0;
  }
  else if(mouseX>width-50&&(mouseY>50&&mouseY<height-50))
  {
    xval=-speed;
    yval=0;
  }
  else if((mouseX>50&&mouseX<width-50)&&mouseY<50)
  {
    xval=0;
    yval=speed;
  }
  else if((mouseX>50&&mouseX<width-50)&&mouseY>height-50)
  {
    xval=0;
    yval=-speed;
  }
  for(int i=0; i<amountOfPlanets; i++)
  {
    p[i].change(xval,yval);
  } 
  
}
