/*
* Game client is used for assembling the game and running all the functions for the player and overall game view.
*/
//by Jacob Dyck

public class Game{
  public int time;
  
  public Unit p[] = new Unit [10000];
  int numUnits;
  /*
  private boolean clicked = false;
  private int boundingX1 = 0;
  private int boundingX2 = 0;
  private int boundingY1 = 0;
  private int boundingY2 = 0;
  private boolean selectionBox = false;*/

  HeadsUpDisplay hud = new HeadsUpDisplay();
  
  public int resources; //total resources the player has, public so mouse can interact thoughts?
  
  final int SETTLER_COST = 2000; //cost of a settler ship STC.
  final int EXPLORE_COST = 1000; //cost of explorer ship STC.
  final int SMIN =30;
  final int SMAX = 45;
  final int MMIN = 46;
  final int MMAX = 50;
  final int LMIN = 51;
  final int LMAX = 76;
  
  
  public Game(){
    time=0;
    background(0);  
    p[0] = new MedPlanet(0, 0, true, 10, (int)random(MMIN, MMAX));  
    p[1] = new LargePlanet(-width/2, -height/2, true, 10, (int)random(LMIN, LMAX));  
    p[2] = new SmallPlanet(width/2, height/2, true, 10, (int)random(SMIN, SMAX));  
    p[3] = new Ship(width, height, true, 25);
    p[4] = new SmallPlanet(-width,-height, true, 10, (int)random(SMIN,SMAX));
    p[5] = new Ship(width+150,height+150,true,25);
    numUnits=6;
    
    ///resource recruitment testing
    resources+=50000;
  }
  
  public void gameUpdate() {  
    background(0);   
           
    //looping to update game visuals                 
    for (int i=0; i<numUnits; i++) {
    p[i].update();
    }
    
    //looping to update array of objects, cycling out dead ones
    for(int i=0; i<numUnits; i++) {
      if(!p[i].isAlive()){
        p[i]=p[numUnits-1];
        numUnits--;
      }
    }
  
    /*
    if (clicked) {    
        fill(255, 0);    
        stroke(255, 255);    
        rect(boundingX1, boundingY1, boundingX2 - boundingX1, boundingY2 - boundingY1);    
        int difX = boundingX2 - boundingX1;    
        int difY = boundingY2 - boundingY1;    
        if ((difX > 5 || difX < -5) || (difY > 5 || difY < -5)) {      
            selectionBox = true;
          } 
          else {      
                selectionBox = false;
          }
                                }  */
                                
      //looping to show menu on top of goings on in background.
      for (int i = 0; i < numUnits; i++) {    
            if (p[i] instanceof Planet) {      
                          if (p[i].menuDisplay) {        
                                    ((Planet)p[i]).displayMenu();
                }
            }
  }
          
          
      // this should always go last.
      hud.update(time, resources);
  
      mouseTracker();  
      time++;
  }
  
  //this is for movement of the field of view.
  public void mouseTracker() {  
      int speed =3;  
      int mr=100;   
      int xval=0;  
      int yval=0;    
      if (clicked) {    
            boundingX2 = mouseX;    
            boundingY2 = mouseY;
      }    
      if (mouseX<mr&&mouseY<mr) {    
            xval=speed;    
            yval=speed;
      }  
      else if (mouseX<mr&&mouseY>height-mr) {    
            xval=1;    
            yval=-speed;
      }  
      else if (mouseX>width-mr&&mouseY<mr) {    
            xval=-speed;    
            yval=speed;
      }  
      else if (mouseX>width-mr&&mouseY>height-mr) {    
            xval=-speed;    
            yval=-speed;
      }    
      else if (mouseX<50&&(mouseY>50&&mouseY<height-50)) {    
            xval=speed;    
            yval=0;
      }  
      else if (mouseX>width-50&&(mouseY>50&&mouseY<height-50)) {    
            xval=-speed;    
            yval=0;
      }  
      else if ((mouseX>50&&mouseX<width-50)&&mouseY<50) {    
            xval=0;    
            yval=speed;
      }  
      else if ((mouseX>50&&mouseX<width-50)&&mouseY>height-50) {    
            xval=0;    
            yval=-speed;
      }    
   for (int i=0; i<numUnits; i++) {    
        p[i].change(xval, yval);
}
  }
  
  public void recruitSettler(int x, int y){
    if(resources>SETTLER_COST){
      resources-=SETTLER_COST;
      p[numUnits] = new Ship(x,y,true, 25);
      numUnits++;
    }
  }
  
  //method for the upcoming explorer ship
  /*
    public void recruitSettler(int x, int y){
    if(resources>EXPLORE_COST){
      resources-=EXPLORE_COST);
      p[numUnits] = new ExploreShip(x,y,true, 25);
      numUnits++;
    }
  }
  */
  
  //this is used to populate planets.
  public Boolean checkDestination(int mx, int my) {    
      for (int i=0; i<numUnits; i++) {    
            if (p[i] instanceof Planet) {     
                    if (dist(mx, my, p[i].getX(), p[i].getY())<p[i].getSize()/2) {            
                              ((Planet) p[i]).populate();       
                                      return true;
                    }
            }
      }  
        return false;
  }
}
  
  
