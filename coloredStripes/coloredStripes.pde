float[][] rects = new float[10][3];

PGraphics pg;

void setup(){
  size(500,500);
  
  pg = createGraphics(width, height);
  colorMode(HSB);
  noStroke();
  
  drawBG(0, 40, false, pg);
  image(pg,0,0);
  drawBG(0,60, true, pg);
  image(pg,0,0);
  //not sure why this needs to be done twice, the colors render strange otherwise
  
  for(int i = 0; i < rects.length; i++){
    rects[i][0] = (int)random(-width/2, width); //0 is x
    rects[i][1] = (int)random(width/10, width/4); //1 is width
    rects[i][2] = 10; //2 is speed
  }
}

void draw(){
  image(pg,0,0);
  
  drawRects();
  //saveFrame("sequence-####");
}

void drawBG(int start, int increment, boolean rainbow, PGraphics ctx){
  int startY = start;
  int endY = start-200;
  int hue = 0;
  ctx.colorMode(HSB);
  ctx.beginDraw();
  ctx.background(255);
  while(endY < height+20){
    if(rainbow){
      hue = (hue+increment < 255) ? hue + increment : hue + increment - 255;
    }else{
      hue = (int)random(255);
    }
    ctx.strokeWeight(30);
    ctx.stroke(hue, random(150, 160), random(240, 255));
    ctx.line(0, startY, width, endY);
    startY += increment;
    endY += increment;
  }
  ctx.endDraw();
 
}

void drawRects(){
  fill(255);
  for(int i = 0; i < rects.length; i++){
    rect(rects[i][0], 0, rects[i][1], height);
    
    rects[i][0] += rects[i][2];
    if(rects[i][0] > width){
      resetRect(i);
    }
  }
}

void resetRect(int i){
  rects[i][0] = (int)random(-width/2); //0 is x
  rects[i][1] = (int)random(width/10, width/4); //1 is width
  if(rects[i][1] > abs(rects[i][0])) rects[i][0] = -rects[i][1];
  rects[i][2] = 10; //2 is speed
}

void mouseClicked(){
  background(255);
  drawBG(0, 40, false, pg);
  image(pg,0,0);
  drawRects();
  //saveFrame("screen-###.png");
}

void mouseMoved(){
  //thisX = mouseX;
}
