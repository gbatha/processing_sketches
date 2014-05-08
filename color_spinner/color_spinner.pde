
float angle = 0;

void setup(){
  colorMode(RGB, 255);
  size(350,350);
  background(230);
  frameRate(24);
  ellipseMode(CENTER);
}

void draw(){
  fill(230, 50);
  noStroke();
  rect(0,0, width, height);
  //ellipse(width/2, height/2, 3,3);
  strokeWeight(2);
  angle += PI/48;
  
  for(int i = 0; i < 10; i++){
    float rot = PI/10*2 * i;
    float x = width/2 + (cos(rot+sin(angle)) * (50*sin(angle)+100));
    float y = height/2 + (sin(rot+sin(angle)) * (50*sin(angle)+100));
    fill(255, cos(angle)*255, sin(angle)*255);
    stroke(sin(angle)*255, cos(angle)*255, 255);
    ellipse(x,y, cos(angle)*50,cos(angle)*50);
    //line(width/2,height/2,x,y);
  }
  for(int i = 0; i < 10; i++){
    float rot = PI/10*2 * i +angle;
    float x = width/2 + (cos(rot+sin(angle)) * (50*sin(angle)+80));
    float y = height/2 + (sin(rot+sin(angle)) * (50*sin(angle)+80));
    ellipse(x,y, cos(angle)*50,cos(angle)*50);
    //line(width/2,height/2,x,y);
  }
//  if(frameCount >= 48 && frameCount < 48*3)
//    saveFrame("frame-###.png");
//  if(frameCount == 48*3)
//    exit();
}
