int ScreenColor = color(40,40,40);
int ScreenPointColor = color(10,200,10);
int ScreenPenMovementColor =color(10,10,230);

//PIXEL DISTANCE MULTIPLIER
int multiplier = 3; 

ScreenResults S1 = new ScreenResults(2.0*width,0.9*height,ScreenColor);

void ScreenCast(){
  
//S1.createScreen() ALWAYS GOES FIRST

S1.createScreen(); 
fill(255);


for(int cnt = 0; cnt<X.length; cnt++){
  if(Z[cnt] == 1){
S1.createPointDOWN(X[cnt], Y[cnt], ScreenPointColor);
}
else if(Z[cnt] == 0){
S1.createPointUP(X[cnt], Y[cnt], ScreenPenMovementColor);  
}

}


}


class ScreenResults {
  
  //COORDINATES OF BOTTOM LEFT EDGE OF SCREEN
  float x,y;
  int b_color;
  
  
  ScreenResults(float x1, float y1,int colorRGB){
  
  x = x1;
  y = y1;
  b_color = colorRGB;   
  
}

  void createScreen(){
      fill(b_color);
      strokeWeight(1.5);
      stroke(30,30,30);
    rect(x,0,1500-x,800-y);
    
    //NEW ORIGIN RESULTS
    int newOx = int(x)+int(0.3*width);
    int newOy = int(800-y)-int(0.1*height);
    
    stroke(ScreenPointColor);
    
    
    translate(newOx,newOy);
    noFill();
    ellipse(0,0,20,20);
    
  }
  
  void createPointDOWN(int rawX , int rawY , int colorRGB){

    int oX = rawX*multiplier;
    int oY =  -rawY*multiplier;
    noStroke();
    fill(colorRGB);
    ellipse(oX,oY,1,1);
 
  }
   void createPointUP(int rawX , int rawY , int colorRGB){

    int oX = rawX*multiplier;
    int oY = -rawY*multiplier;
    noStroke();
    fill(colorRGB);
    ellipse(oX,oY,1,5);
 
  }
  void ARM(int angle1,int L1, int multiplier,int x,int y){
    
    float armPitchHeight = -L1*sin(radians(angle1));
    float armPitchWidth = L1*cos(radians(angle1));
    
    int drawHeight = int(armPitchHeight);
    int drawWidth = int(armPitchWidth);
    stroke(ScreenPointColor);  
    strokeWeight(1.8);
    line(0,0,drawWidth*multiplier,drawHeight*multiplier);
    line(drawWidth*multiplier,drawHeight*multiplier,x*multiplier,-y*multiplier);
   
    

    stroke(ScreenPointColor);
    strokeWeight(0.8);
    noFill();
    ellipse(drawWidth*multiplier,drawHeight*multiplier,15,15);
    
  }
boolean ScreenBoundries( int mX, int mY ){
  if(mX>=x && mX<=1500 && mY>=y && mY<=800-y){
  return true;
}
else{
  
  return false;
}
}}
