#include <Servo.h>


Servo Jt1;
Servo Jt2;
Servo H1;

int StateComm = 1;

void setup() {
  // put your setup code here, to run once:
Jt1.attach(6);
Jt2.attach(3);
H1.attach(5);

//return to origin
H1.write(0);
delay(300);
Jt1.write(80);
delay(300);
Jt1.write(170);
Jt2.write(0);

//Serial Communication
Serial.begin(9600);
  
  //PRINTS OUT SYNTAX AND DATA
  Serial.println("Monitor Toggle Mode Engaged");
  delay(1000);
  Serial.println("Syntax: MVM:XXX/YYY/Z ");
  delay(300);
  Serial.println("Key in A1/A2/H1 coordinates");

}


int commInt(char coordNt, char endSign){
int jta;
if(Serial.find(coordNt)){
String Ang=Serial.readStringUntil(endSign);
    jta = Ang.toInt(); 
}
if(isDigit(jta)){
return jta;}
}

void loop() {
  // put your main code here, to run repeatedly:
if(StateComm == 0){

  //PARSES THROUGH INCOMING TEXT
  if(Serial.available()>0){
    
    
    if(Serial.find("MVM:")){

    //ITERATES THROUGH STRING TO FIND THE XYZ COORDINATES
    String Xread = Serial.readStringUntil('/'); 
    String Yread = Serial.readStringUntil('/'); 
    String Zread = Serial.readStringUntil('/'); 
    
    //CONVERTING STRING VALUES TO INTEGER VALUES
    int X = Xread.toInt();
    int Y = Yread.toInt();
    int Z = Zread.toInt();

    //ECHOS BACK TO THE SERIAL MONITOR
    Serial.print("Writing ANGLES at:");
    Serial.print(" A1-");
    Serial.print(X);
    Serial.print(" A2-");
    Serial.print(Y);
    Serial.print(" H1-");
    Serial.print(Z);

    delay(1000);
    Serial.print("angle one: ");
    Serial.println(X);
    Serial.print("angle two:");
    Serial.println(Y);

    Jt1.write(X);
    Jt2.write(Y);
    delay(300);
    H1.write(UpDown(Z));  
  }
  
  }
  
  }
else if(StateComm == 1){
  if(Serial.available()>0){

  
  iA1(Jt1.read(),round(commInt('X','/')));
  
  iA2(Jt2.read(),round(commInt('Y','/')));

  
  
  Serial.write(1001);
  }
  };

}

int UpDown(int bin){

    int returnNum;
    
    if(bin == 1){
      
    returnNum = 100;
  
    }
    else if(bin == 0){

    returnNum = 0;
  
    }

    return returnNum;
  
}







  



  
