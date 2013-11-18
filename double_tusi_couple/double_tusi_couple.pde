int numDots = 13;
float angleIncrement = PI / numDots;
float time = 0;
PVector[][] arr;



void setup(){
  size(500,500);
  noFill();
  frameRate(24);
  background(38,35,26);
  strokeWeight(2);
  arr = new PVector[2][round(numDots*0.5)];
}

void draw(){
  noStroke();
  fill(0,0,0);
  rect(0,0,width,height);
  
  
  time = map(frameCount, 0, 48, 0, TWO_PI);
  float angle = 0;
  //beginShape();
  for(int i = 0; i < numDots; i++){
    
    int invert = (i % 2 == 0 || i == 0) ? 1 : -1;
    //int invert = 1;
    float x = width/2 + (200 * sin(time+angle*invert))*cos(angle);
    float y = height/2 + (200 * sin(time+angle*invert))*sin(angle);
    //ellipse(x,y,15,15);
    //line(width/2,height/2,x,y);
    //vertex(x,y);
    
    if(i == 0){
      stroke(255,0,0);
      arr[0][0] = new PVector(x,y,0);
      arr[1][0] = new PVector(x,y,0);
    }else if(i % 2 == 0){
      stroke(195,204,13);
      arr[0][round(i*0.5)] = new PVector(x,y,0);
    }else{
      stroke(252,156,18);
      arr[1][round(i*0.5)] = new PVector(x,y,0);
    }
    
    
    
    
    angle += angleIncrement;
  }
  
  for(int k = 0; k < arr.length; k++){
    beginShape();
    for(int j = 0; j < arr[k].length; j++){
      vertex(arr[k][j].x, arr[k][j].y);
    }
    noFill();
    if(k == 0){
      stroke(245,200,45);
    }else{
      stroke(250,236,173);
    }
    endShape(CLOSE);
  }
  
  //noFill();
  //endShape(CLOSE);
  if(frameCount >= 48 && frameCount < 48*2)
    //saveFrame("frame-###.png");
  if(frameCount == 48*2){
    //exit();
  }
  //noLoop();
}
