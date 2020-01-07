ArrayList<Flue> flueListe = new ArrayList<Flue>();

void setup(){
  size(500,500);
}

void draw()
{
  clear();
  for(int i=0; i<flueListe.size(); i++)
  {
    Flue f = flueListe.get(i);
   f.flyt();
    f.tegnFlue();
    f.vendom();
  }
}

void keyPressed()
{
  if (keyPressed)
  {
    if(key == 'e'||key == 'E')
    {
  flueListe.add(new Flue(random(1,2)));
    }
    else
    {
      flueListe.add(new Flue(1));
    }
  }
}

void mousePressed()
{
  flueListe.add(new Flue(mouseX, mouseY));
}

/////////////////////////////////////////////////////////
class Flue
{
  
  float positionX,positionY;
  float distanceFlyttet;
  float vinkel = 0; 
  float scale;
  float fartX;
  float fartY;
  
  Flue(float a)
  {
    positionX  = random(0,height);
    positionY  = random(0,width);
    vinkel     = random(0,2*PI);
    scale = a;
  }
  
  Flue(float a, float b)
  {
    positionX = a;
    positionY = b;
    vinkel    = random(0,2*PI);
    scale = 1;
  }
  
  void vendom()
  {
  if(positionX>500)
    {
     vinkel = vinkel + 180;
    }
    if(positionX<0)
    {
     vinkel = vinkel - 180;
    }
    if(positionY>500)
    {
     vinkel = vinkel + 180;
    }
    if(positionY<0)
    {
     vinkel = vinkel - 180;
    }
  }
  void flyt()
  {
          
         fartX=1*cos(vinkel);
         fartY=1*sin(vinkel);
    positionX = positionX + fartX;
    positionY = positionY + fartY;
   
  }

  void tegnFlue()
  {
    pushMatrix();
      translate(positionX,positionY);
      rotate(vinkel);
      scale(scale);
        ellipse(0,0,20,8);
        ellipse(0,0-8,15,10);
        ellipse(0,0+8,15,10);
        ellipse(0+6,0,8,8);
    popMatrix();
  } 
}
//////////////////////////////////////////////////////
