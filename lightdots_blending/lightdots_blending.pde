void setup(){
  size(500,300, OPENGL);
  background(0);
  noStroke();
  smooth();
  blendMode(ADD);
  
  //stroke(226,224,37,200);
  //strokeWeight(2);
  doTheThing();
}

void draw(){}

void doTheThing(){
  background(0);
  for(int i = 0; i < width; i+= 10){
    int size = (int)random(20,40);
        
    fill(random(150,250),random(50,250),random(50,250),150);
    rect(i, pow(random(1),2)*(height/2), size, size);
  }
}

void mouseClicked(){
  doTheThing();
}
