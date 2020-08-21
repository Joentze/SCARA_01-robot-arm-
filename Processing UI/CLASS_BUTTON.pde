int StartButtonColor = color(120,120,120);
ButtonClasses B1Start = new ButtonClasses(870,720,120,20,5,StartButtonColor,"     START");
ButtonClasses B2Stop = new ButtonClasses(870,745,120,20,5,StartButtonColor,"      STOP");
ButtonClasses B3Reset = new ButtonClasses(870,770,120,20,5,StartButtonColor,"     RESET");

void mousePressed(){

  for(int c = 0; c<portList.length; c++){
    try{
  if(portButton[c].ButtonBoundries(mouseX,mouseY)){
    String[] FullList = TxPort.list();  
    currentPortSelected = FullList[c];
        TxPort = new Serial(this,currentPortSelected, 9600); 
  println(currentPortSelected);
  ;}
}
  catch(NullPointerException e){
 noLoop();
}
}
  
  if(B1Start.ButtonBoundries(mouseX,mouseY)){
loop();

}

else if(B2Stop.ButtonBoundries(mouseX,mouseY)){
noLoop();
redraw();
};

if(B3Reset.ButtonBoundries(mouseX,mouseY)){
  noLoop();
cnt = 1;
redraw();
}

if(PortMenu.tableBoundries(mouseX,mouseY)&& MenuOpenClosed == false){
MenuOpenClosed = true;
redraw();
}
else if(PortMenu.tableBoundries(mouseX,mouseY)&& MenuOpenClosed == true){
  redraw();
MenuOpenClosed = false;
}

}
 class ButtonClasses{

  int x,y,w,h;
  int button_color;
  String Label;
  int radius;
  
  ButtonClasses(int pX, int pY,int widthB,int heightB,int r, int b_color, String text){
  
  x = pX;
  y = pY;
  w = widthB;
  h = heightB;
  button_color = b_color;
  Label = text;
  radius = r;
  }
  
  void ButtonList(int txtSize){
  
    stroke(70,70,70);
    strokeWeight(1.2);
  fill(button_color);
  rect(x,y,w,h,radius);
  
  fill(30,30,30);
  textFont(ArameFont,txtSize);
  text(Label,x+5,y+15);
    
  }
boolean ButtonBoundries( int mX, int mY ){
  if(mX>=x && mX<=x+100 && mY>=y && mY<=y+30){

  return true;
}
else{
  
  return false;
}
}
}
