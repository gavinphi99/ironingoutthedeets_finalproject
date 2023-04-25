class Button{
  
  float x;
  float y;
  float w = 20;
  float h = 10;
  
  String content = "Button";
  
  // Basic styling
  color offColor = color(200);
  color hoverColor = #AACB9C;
  color buttonColor = offColor;
  
  float hoverWeight = 3;
  float offWeight = 1;
  float weight = offWeight;
  
  color hoverDetail = #276F09;
  color offDetail = color(0);
  color strokeColor = offDetail;
  color textColor = offDetail;
  
  //PFont offFont;
  //PFont hoverFont;
  //PFont font = offFont;
  
  // take in PFont eventually
  Button(float x, float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    //offFont = regular;
    //hoverFont = regular;
  }
  
  void style(color off, color offDetail){
    offColor = off;
    this.offDetail = offDetail;
  }
  
  void hoverStyle(color hover, color hoverDetail){
    hoverColor = hover;
    this.hoverDetail = hoverDetail;
  }
  
  //void fontStyle(PFont offFont, PFont hoverFont){
  //  this.offFont = offFont;
  //  this.hoverFont = hoverFont;
  //}
  
  boolean intersect(int newX, int newY){
    if ((newX >= x) && (newX <= x + w) && (newY >= y) && (newY <= y + h)){
      return true;
    } else {
      return false;
    }
  }
  
  void hover(int newX, int newY){
    if (intersect(newX, newY)){
      buttonColor = hoverColor;
      weight = hoverWeight;
      strokeColor = hoverDetail;
      textColor = hoverDetail;
      //font = hoverFont;
    } else {
      buttonColor = offColor;
      weight = offWeight;
      strokeColor = offDetail;
      textColor = offDetail;
    }
  }
  
  void display(){
    float textw = textWidth(content);
    float textsize = 18;
    
    if (w < textw){
      w = textw*2;
    }
    if (h < textsize){
      h = textsize*2;
    }
    
    pushMatrix();
    translate(x, y);
    fill(buttonColor);
    strokeWeight(weight);
    stroke(strokeColor);
    rect(0, 0, w, h, 10);
    fill(textColor);
    //textFont(font, textsize);
    textSize(textsize);
    text(content, (w/2) - (textw/2), (h/2) - (textsize/2) - (textsize/8), w, h);
    popMatrix();
  }
}

class Field{
  
  float x;
  float y;
  float w;
  float h;
  
    // Basic styling
  color offColor = color(200);
  color hoverColor = #AACB9C;
  color buttonColor = offColor;
  
  float hoverWeight = 10;
  float offWeight = 1;
  float weight = offWeight;
  
  color hoverDetail = #276F09;
  color offDetail = color(0);
  color strokeColor = offDetail;
  color textColor = offDetail;
  
  Field(float x, float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;  
  }
  
  void style(color off, color offDetail){
    offColor = off;
    this.offDetail = offDetail;
  }
  
  void hoverStyle(color hover, color hoverDetail){
    hoverColor = hover;
    this.hoverDetail = hoverDetail;
  }
  
  boolean intersect(int newX, int newY){
    if ((newX >= x) && (newX <= x + w) && (newY >= y) && (newY <= y + h)){
      return true;
    } else {
      return false;
    }
  }
  
  void drop(int newX, int newY){
    if (intersect(newX, newY)){
      buttonColor = hoverColor;
      weight = hoverWeight;
      strokeColor = hoverDetail;
      textColor = hoverDetail;
      //font = hoverFont;
    } else {
      buttonColor = offColor;
      weight = offWeight;
      strokeColor = offDetail;
      textColor = offDetail;
    }
  }
  
  void display(){
    pushMatrix();
    translate(x, y);
    fill(buttonColor);
    strokeWeight(weight);
    stroke(strokeColor);
    rect(0, 0, w, h, 20);
    popMatrix();
  }
}

class FileDrop extends Field{
  
  FileDrop(float x, float y, float w, float h){
    super(x, y, w, h);
  }
}

class Workspace{
  
  int start = 1;
  int work = 0;
  Button upload;
  Button bfs;
  Button dfs;
  FileDrop fileDrop;
  Field viz;
  
  Workspace(){
      upload = new Button(50, height/2 - 70, 50, 50);
      upload.content = "Upload Adjacency Matrix";
      upload.style(darks[0], lights[1]);
      upload.hoverStyle(accents[0], darks[1]);
      
      bfs = new Button(width/5, 50, 50, 50);
      bfs.content = "Run BFS";
      bfs.style(darks[0], lights[1]);
      bfs.hoverStyle(accents[0], darks[1]);
      
      dfs = new Button(width/5, 110, 50, 50);
      dfs.content = "Run DFS";
      dfs.style(darks[0], lights[1]);
      dfs.hoverStyle(accents[0], darks[1]);
      
      fileDrop = new FileDrop(50, height/2, width - 100, height/2);
      fileDrop.style(darks[0], lights[1]);
      fileDrop.hoverStyle(accents[1], accents[0]);
      
      viz = new Field(width/3, 50, width - width/3 - 50, height - 100);
      viz.style(darks[0], lights[1]);
      viz.hoverStyle(accents[1], accents[0]);
  }
  
  void startScreen(){
    if (start == 1){
      fill(darks[1]);
      rect(0, 0, width, height);
      fileDrop.drop(mouseX, mouseY);
      fileDrop.display();
      //rect(50, height/2, width - 100, height/2, 20);
      upload.hover(mouseX, mouseY);
      upload.display();
    }
  }
  
  void startWork(){
    start = 0;
    work = 1;
  }
  
  void work(){
    if (work == 1 && upload()){
      fill(darks[1]);
      noStroke();
      rect(0, 0, width, height);
      viz.drop(mouseX, mouseY);
      viz.display();
      bfs.hover(mouseX, mouseY);
      dfs.hover(mouseX, mouseY);
      bfs.display();
      dfs.display();
    }
  }
 
  
  Boolean upload(){
    // will be used to verify file upload
    int dummy = 1;
    if (dummy == 1){
      return true;
    } else {
      return false;
    }
    
  }
  
}
