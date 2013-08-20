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
