int numDots = 8;
float angleIncrement = PI / numDots;
float time = 0;

void setup(){
  size(500,500);
  noStroke();
  frameRate(24);
  background(151,126,119);
}

void draw(){
  fill(151,126,119);
  noStroke();
  rect(0,0,width,height);
  stroke(#DBDA97);
  
  time = map(frameCount, 0, 48, 0, PI);
  float angle = 0;
  for(int i = 0; i < numDots; i++){
    //int invert = (i % 2 == 0 || i == 0) ? 1 : -1;
    int invert = 1;
    float x = width/2 + (200 * sin(time+angle*invert))*cos(angle);
    float y = height/2 + (200 * sin(time+angle*invert))*sin(angle);
    //ellipse(x,y,15,15);
    line(width/2,height/2,x,y);
    
    if(i == 3){
      angle += angleIncrement;
      stroke(#EFAE54);
    }else{
      angle += angleIncrement;
    }
  }
  if(frameCount >= 48 && frameCount < 48*2)
    //saveFrame("frame-###.png");
  if(frameCount == 48*2){
    //exit();
  }
}
