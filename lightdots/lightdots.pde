void setup(){
  size(500,500);
  background(0);
  
  fill(198,196,51,150);
  stroke(226,224,37,200);
  strokeWeight(2);
  for(int i = 0; i < width; i+= 10){
    int size = (int)random(20,40);
    ellipse(i, pow(random(1),2)*(height/4), size, size);
  }
}
