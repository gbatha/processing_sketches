PImage[] frames; 

void setup(){
  frames = new PImage[5];
  for(int i = 0; i < frames.length; i ++){
    frames[i] = loadImage("nasa"+i+".png");
  }
  
  size(frames[0].width, frames[0].height);
  frameRate(12);
  image(frames[0], 0, 0);
  
  
}

void draw(){
  //noLoop();
  rectMosh();
  //saveFrame("nasaRectMosh##.png");
  //if(frameCount > 12){ exit(); }
}

void rectMosh(){
  for(int y = 0; y < height; y++){
    int index = (int)random(frames.length);
    int x = (int)random(-width/2, width);
    PImage getRect = frames[index].get(x, y, (int)random(width), (int)random(height));
    image(getRect, x, y);
    
  }
}

void scanLine(){
  for(int y = 0; y < height; y++){
    int index = (int)random(frames.length);
    for(int x = 0; x < width; x++){
      set(x, y, frames[index].get(x,y));
    }
  }
}

void scanLineVert(){
  for(int x = 0; x < width; x++){
    int index = (int)random(frames.length);
    for(int y = 0; y < height; y++){
      set(x, y, frames[index].get(x,y));
    }
  }
}

void noiseMosh(){
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      set(x, y, frames[(int)random(frames.length)].get(x,y));
    }
  }
}
