String[] PullG1X (String[] WholeLst){
  String[] FindX = {};
  for(String Cln : WholeLst ){
  String[] Gret =match(Cln,"G1 ");
if(Gret!=null){
  String[] Xnow = match(Cln,"X(.+) Y");
  if(Xnow!=null){
  //println(Xnow[1]);
  FindX = append(FindX,Xnow[1]);
  }
}}
return FindX;
}

String[] PullG1Y (String[] WholeLst){
  
  String[] FindY = {};
  
  for(String Cln : WholeLst ){
  
    String[] Gret =match(Cln,"G1 ");

if(Gret!=null){
  //look up regex syntax java to clarify symbols because at this point it was just pure luck
  String[] Ynow = match(Cln," Y(.+)");
  if(Ynow!=null){
  //println(Ynow[1]);
  FindY = append(FindY,Ynow[1]);
  }
}}
return FindY;
}

String[] PullG1Z (String[] WholeLst){

String[] FindZ = {};
//  String[] FindH = {};
  for(String Cln : WholeLst ){
  
    String[] Gret =match(Cln,"G1 ");

if(Gret!=null){
  //look up regex syntax java to clarify symbols because at this point it was just pure luck
  String[] Znow = match(Cln,"G1 Z(.+) F");
  
  if(Znow!=null){
  //println(Ynow[1]);
  FindZ = append(FindZ,Znow[1]);
  }

}}

return FindZ;

}

String[] pState(String[] WholeLst){
  String[] FindZ = {};
  int x = 0;
  boolean lastState = false;
  for( String Cln: WholeLst ){
  String[] uret = split(Cln," ");
  String[] Gret = match(Cln, "G1 ");
for(String Cst: uret){
  if(Cst.equals("plunge")){

x = 1;
//lastState = true;
//println("incP");
}
else if(Cst.equals("Retract")){
x = 0;
delay(1500);
//lastState = false;
//println("incR");
}
}
if(Gret!=null){
FindZ = append(FindZ,str(x));
}
}
return FindZ;
}
/*String[] UDstate (String[] WholeLst){
  
}*/
