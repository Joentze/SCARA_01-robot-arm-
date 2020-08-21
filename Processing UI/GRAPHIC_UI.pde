
int cnt = 1;

void draw(){

 
background(200);
backgroundText();

push();
portsMenuFunc(20,180);
pop();

B1Start.ButtonList(15);
B2Stop.ButtonList(15);
B3Reset.ButtonList(15);

ScreenCast();

   if(cnt<Y.length){
  
  String SendX = str(angle1(X[cnt]+clr1,Y[cnt]+clr2));
  String SendY= str(angle2(X[cnt]+clr1,Y[cnt]+clr2));
  String SendZ = str(Z[cnt]);

  S1.ARM(angle1(X[cnt],Y[cnt]),L1,3,X[cnt],Y[cnt]);  
  delay(timingFunction(Z[cnt-1],Z[cnt],1000));
delay(50);
  if(TxPort!=null){
  
  TxPort.write("A"+str(X.length)+"/"+"X"+SendX+"/"+"Y"+SendY+"/"+"Z"+SendZ+"/");
  println("no:"+cnt+"/"+"A1:"+SendX+"/"+"A2:"+SendY+"/"+"Z:"+SendZ+"/");
//print(angle1(X[cnt],Y[cnt]));
//println("_"+angle2(X[cnt],Y[cnt]));
 }}
cnt++;

}




void backgroundText(){
 textFont(ArameFont);
textSize(30);
fill(20,20,20);
text("SCARA",21,51);
fill(40,40,40);
text("SCARA",20,50); 
stroke(20);
strokeWeight(0.5);

}
