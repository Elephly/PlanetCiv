/* default unit class
*
*/

public abstract class Unit
{
  
  protected float xpos, ypos;
  protected boolean alive, selected;
  
  public float getX() { return xpos; }
  public float getY() { return ypos; }
  
  public Unit(int xp, int yp, boolean a)  
{
    xpos =xp;
    ypos =yp;
    alive = a;
    selected=false;
  }
  
  public void change(int updateX, int updateY)
  {
    xpos+=updateX;
    ypos+=updateY;
  }  
  
  
  public void die()
  {
    alive=false;    
  }
  
  public abstract void update();
}
