PVector[][] points;
float spacing;
boolean drawDots = true;
int numConnections = 1;

void setup(){
  size(500,500);
  spacing = width/10;
  background(240);
  
  points = new PVector[(int)floor(height/spacing)-1][(int)floor(width/spacing)-1];
  
  ellipseMode(CENTER);
  noStroke();
  for(int i = 0; i < points.length; i++){
    float spacingOffset = (i % 2 == 1) ? spacing / 2 : 0;
    for(int j = 0; j < points[i].length; j++){
      points[i][j] = new PVector((i+1)*spacing, (j+1)*spacing+spacingOffset-spacing/4, 0);
      fill(200);
      ellipse(points[i][j].x, points[i][j].y, 10, 10);
    }
  }
}

void draw(){}

void connectAll(int maxDist){  
  
  strokeWeight(1);
  stroke(50,50,50,150);
  for(int i = 0; i < points.length; i++){
    float spacingOffset = (i % 2 == 1) ? spacing / 2 : 0;
    for(int j = 0; j < points[i].length; j++){
      int destinationX = (int)random(points[i].length);
      int destinationY = (int)random(points.length);
      
      if(maxDist != 0){
        int minX = (i - maxDist <= 0) ? 0 : i - maxDist;
        int maxX = (i + maxDist < points.length) ? i + maxDist : points.length-1;
        destinationX = (int)random(minX, maxX);
        
        int minY = (j - maxDist <= 0) ? 0 : j - maxDist;
        int maxY = (j + maxDist < points[i].length) ? j + maxDist : points[i].length-1;
        destinationY = (int)random(minY, maxY);
      }
      
      line(points[i][j].x, points[i][j].y, points[destinationX][destinationY].x, points[destinationX][destinationY].y);
    }
  }
}

void mouseClicked(){
  background(240);
  if(drawDots){
    drawGrid();
  }
  connectAll(numConnections);
}

void keyPressed(){
  if(key == 'd'){
    drawDots = !drawDots;
  }else if(key == 's'){
    saveFrame("screenshot###.png");
  }else if(key == CODED){
    if(keyCode == UP){
      numConnections++;
    }else if(keyCode == DOWN && numConnections > 0){
      numConnections --;
    }
  }
  println(numConnections);
}

void drawGrid(){
  for(int i = 0; i < points.length; i++){
    float spacingOffset = (i % 2 == 1) ? spacing / 2 : 0;
    for(int j = 0; j < points[i].length; j++){
      fill(200);
      noStroke();
      ellipse(points[i][j].x, points[i][j].y, 10, 10);
    }
  }
}
