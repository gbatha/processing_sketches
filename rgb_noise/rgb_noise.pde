PImage img;

void setup(){
  img = loadImage("city.jpg");
  size(img.width, img.height);
  
  img.loadPixels();
  for(int i = 0; i < img.pixels.length; i++){
    int rand = int(random(3));
    switch(rand){
      case 0:
        img.pixels[i] = color(red(img.pixels[i]),0,0);
        break;
      case 1:
        img.pixels[i] = color(0, green(img.pixels[i]),0);
        break;
      case 2:
        img.pixels[i] = color(0, 0, blue(img.pixels[i]));
        break;
    }
  }
  img.updatePixels();
  image(img,0,0);
}

