ArrayList<Feather> feathers;
PImage img;

void setup(){
  //create an empty array list. this will serve as our particle system array
  feathers = new ArrayList<Feather>();
  
  size(500,500);
  imageMode(CENTER);
  background(0);
  noStroke();
  
  img = loadImage("feather.png");
}

void draw(){
  //clear drawing area
  background(0);
  //loop through our feathers and animate them
  for(int i = feathers.size()-1; i >=0; i--){
    Feather feather = feathers.get(i);
    feather.update();
    feather.render();
    //if below renderable area
    if(feather.getY() > height+50)feathers.remove(i);
  }
}

void mouseClicked(){
  //create a new feather at mouseX,mouseY, with a speed of 3
  feathers.add(new Feather(mouseX, mouseY, 2));
}
class Feather{
  //class vars
  float x;
  float y;
  float speed;
  float fallingAngle = 0;
  
  float arcAngle = 0; 
  int arcRadius = 100;
  
  float angleSpeed = 0.03;
  //constructor
  Feather(float xIn, float yIn, float speedIn){
    x = xIn;
    y = yIn;
    speed = speedIn;
  }
  void update(){
    fallingAngle += angleSpeed;
    if(fallingAngle > TWO_PI) fallingAngle = 0;
    arcAngle += angleSpeed/2;
    if(arcAngle > TWO_PI) arcAngle = 0;
    
    //println(cos(arcAngle));
    float sinVal = sin(fallingAngle);
    if(sinVal < 0) sinVal /= 2;
    y += speed*sinVal;
    
  }
  void render(){
    //fill(255,0,0);
    //ellipse(x, y, 5,5);
    fill(200);
    //ellipse(x+(arcRadius*cos(arcAngle)), y, 20, 20);
    pushMatrix();
    translate(x+(arcRadius*cos(arcAngle)), y);
    rotate(map(cos(arcAngle), -1, 1, 0.5, -0.5));
    image(img, 0,0);
    popMatrix();
  }
  
  float getY(){
    return y;
  }
}

