int numDots = 8;
float angleIncrement = TWO_PI / numDots * 2;
float time = 0;

void setup(){
  size(500,500);
  noStroke();
  frameRate(24);
  background(151,126,119);
}

void draw(){
  fill(151,126,119);
  rect(0,0,width,height);
  fill(#DBDA97);
  
  time = map(frameCount, 0, 48, 0, PI);
  float angle = 0;
  for(int i = 0; i < numDots; i++){
    float x = width/2 + (200 * cos(time))*cos(angle); //add +time to the last cos to get spinning coin
    float y = height/2 + (200 * sin(time))*sin(angle); //add +time to the last sin to get spinning coin
    ellipse(x,y,15,15);
    
    if(i == 3){
      angle += angleIncrement/2;
      fill(#EFAE54);
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
