//LIBRARIES
import processing.serial.*;

// LENGTH OF ARM ONE AND ARM TWO IN MILLIMETERS
int L1 = 77;
int L2 = 92;

//COORDINATES LIST
int[] X = {};
int[] Y = {};
int[] Z = {};
int clr1 = 30;
int clr2 = 30;


//FONTS
PFont ArameFont;

//PORTS LIST 
Serial TxPort;
String[] portList = cleanedPortList(TxPort.list());;
ButtonClasses[] portButton = new ButtonClasses[portList.length];
String currentPortSelected="";


public void settings(){
  size(1000,800);   
}

void setup(){

  surface.setTitle("SCARA CONTROLLER");
  //surface.setResizable(true); 
  String WholeLst[] = loadStrings("hwinvert.txt");
  ArameFont = createFont("Arame",32);
  
  
    
    noLoop();
     
X = fullListConcatX(int(StringConv(PullG1X(WholeLst))),int(StringConv(PullG1Y(WholeLst))));
Y = fullListConcatY(int(StringConv(PullG1X(WholeLst))),int(StringConv(PullG1Y(WholeLst))));
Z = fullListConcatZ(int(StringConv(PullG1X(WholeLst))),int(StringConv(PullG1Y(WholeLst))),int(StringConv(pState(WholeLst))));


}

String[] cleanedPortList(String[] portList){
 String[] returnList = {};
  for(String currentln:portList){
 String[] splitPort =split(currentln,'.');
if(splitPort != null){
 returnList = append(returnList,splitPort[1]);
 }}
 return returnList;
}

int angle1 ( float x , float y){
  float invTan =0;
  if(x!=0){
    println(y/x);
    invTan = atan(y/x);
  }
 
  float shortestL = sqrt(sq(x)+sq(y));
  float theta3 = acos((-sq(shortestL) - sq(L1) +sq(L2))/(-2*L1*shortestL));
  //println(invTan);
  float sumA = theta3 + invTan ;
  int returnA =int(degrees(sumA));
  
  return returnA;
  
}

int angle2 ( int x, int y ){
  
 float shortestL = sqrt(sq(x)+sq(y));
 float sumOfLs = sq(L1)+sq(L2);
 float theta2 = acos((sq(shortestL)-sumOfLs)/(-2*L1*L2));
 int returnA = int(degrees(theta2));
 
 return returnA;
  
}

float[] StringConv( String[] stock ){
 //CONVERTS STRING VALUES TO INTEGER VALUES 
float[] returnInt ={};
  
  for(String currentNum:stock){
    
   float fltConv =  float(currentNum);
   
   if(!Float.isNaN(fltConv)){
   
     float intConv = abs(fltConv);
     returnInt = append(returnInt,intConv);
   
   }
  
}
  return returnInt;
  }
  
int[] angle1List (int[] x, int[] y){
 
 int[] listRet = {};
 int Sx1 = x.length;
 int Sx2 = y.length;
 int limit=0;
 
  //COMPARING THE SIZE OF EACH ARRAY AND ASSIGNS THE LIMIT TO BE THE SMALLEST SIZED ARRAY
 if(Sx1 == Sx2){
limit = Sx1;
 }
 else if(Sx1 < Sx2){
limit = Sx1;   
 }
 else if(Sx1 > Sx2){
limit = Sx2;
 }

for(int cnt = 0; cnt<limit; cnt++){

 int currentAngle = angle1(x[cnt],y[cnt]);
 listRet = append(listRet,currentAngle);

}

return listRet;

}
  
int[] angle2List (int[] x, int[] y){
 
 int[] listRet = {};
 int Sx1 = x.length;
 int Sx2 = y.length;
 int limit=0;
 
 //COMPARING THE SIZE OF EACH ARRAY AND ASSIGNS THE LIMIT TO BE THE SMALLEST SIZED ARRAY
 if(Sx1 == Sx2){
limit = Sx1;
 }
 else if(Sx1 < Sx2){
limit = Sx1;   
 }
 else if(Sx1 > Sx2){
limit = Sx2;
 }

for(int cnt = 0; cnt<limit; cnt++){

 int currentAngle = angle2(x[cnt],y[cnt]);
 listRet = append(listRet,currentAngle);

}

return listRet;

}
  
    
  
