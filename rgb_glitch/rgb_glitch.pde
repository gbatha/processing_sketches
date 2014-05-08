// rgb_glitch by Greg Batha
// http://gregbatha.com
// http://bitbitbattle.tumblr.com/

PImage img;
int shiftIntensity;
int maxBarHeight;

void setup(){
  img = loadImage("digimon1.png");
  size(img.width, img.height);
  shiftIntensity = int(img.width*0.1);
  maxBarHeight = 200;
  frameRate(8); 
}

void draw(){
  background(0);
  
  blendMode(ADD);
  int yAxis = 0;
  while(yAxis < img.height){
    int h = (int)random(maxBarHeight);
    PImage getRect = img.get(0, yAxis, img.width, h);
    PImage rectRed = createImage(getRect.width, getRect.height, RGB);
    PImage rectGreen = createImage(getRect.width, getRect.height, RGB);
    PImage rectBlue = createImage(getRect.width, getRect.height, RGB);
    for(int x = 0; x < getRect.width; x++){
      for(int y = 0; y < getRect.height; y++){
        rectRed.set(x,y, color( red(getRect.get(x,y)), 0, 0));
        rectGreen.set(x,y, color( 0, green(getRect.get(x,y)), 0));
        rectBlue.set(x,y, color( 0, 0, blue(getRect.get(x,y))));
      }
    }
    image(rectRed,(int)random(shiftIntensity*(-1),shiftIntensity),yAxis);
    image(rectGreen, (int)random(shiftIntensity*(-1),shiftIntensity),yAxis);
    image(rectBlue, (int)random(shiftIntensity*(-1),shiftIntensity),yAxis);
    
    yAxis += h;
  }
  saveFrame("frame-###.jpg");
  if(frameCount > 8){ noLoop(); }
}
