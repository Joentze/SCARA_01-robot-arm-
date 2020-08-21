//MENU STUFF
int portX = 20;
int portY = 180;
menus PortMenu = new menus(portX+10,portY+10,"PORTS",portList);
boolean MenuOpenClosed = false;

class menus{
  
 int x , y ;
 String menuName;
 String[] itemList;
 
 int widthTable = 120;
 int heightTable = 20;

 menus(int pX, int pY , String labelName,String[] List){
   
  x = pX;
  y = pY;
  menuName = labelName;
  itemList = List;
   
 }
 
 void table(int pX, int pY ,int b_color){
   
   strokeWeight(0.8);
   stroke(40,40,40);
   fill(b_color);
   rect(pX,pY,widthTable,heightTable,5);
   fill(40,40,40);
   textSize(15);
   text(menuName,pX+5,pY+15);
 
}

boolean tableBoundries( int mX, int mY ){
  if(mX>=x && mX<=x+100 && mY>=y && mY<=y+20){

  return true;
}
else{
  
  return false;
}
}


}

void portsMenuFunc(int x , int y){


  int c = 0;
  int currentW = 140;
  int currentH = 40;
  
 PortMenu.table(x+10,y+10,color(160,160,160));
 if(MenuOpenClosed == true){
   
 for( c = 0; c<portList.length; c++){
portButton[c] = new ButtonClasses(x+10,(y+30)+30*(c),120,30,0,220,portList[c]);
portButton[c].ButtonList(9); 
 }
currentW = 140;
currentH = c*40;
 }
 else{
     currentW = 140;
     currentH = 40;
 }
    noFill();
  stroke(0.8);
  rect(x,y,currentW,currentH); 
translate(x,y+currentH);
}
