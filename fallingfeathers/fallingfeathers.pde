ArrayList<Feather> feathers;
PImage img;

void setup(){
  //create an empty array list. this will serve as our particle system array
  feathers = new ArrayList<Feather>();
  
  size(500,500);
  imageMode(CENTER);
  background(0);
  noStroke();
  
  img = loadImage("feather.png");
}

void draw(){
  //clear drawing area
  background(0);
  //loop through our feathers and animate them
  for(int i = feathers.size()-1; i >=0; i--){
    Feather feather = feathers.get(i);
    feather.update();
    feather.render();
    //if below renderable area
    if(feather.getY() > height+50)feathers.remove(i);
  }
}

void mouseClicked(){
  //create a new feather at mouseX,mouseY, with a speed of 3
  feathers.add(new Feather(mouseX, mouseY, 2));
}
