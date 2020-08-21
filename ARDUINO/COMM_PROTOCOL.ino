
int cA1 = 0;
int cA2 = 0;
int cH1 = 0;

//DELAY TIMING IN MILLISECONDS 
int D1 = 10;
int D2 = 10;
int D3;

 void iA1 (int cura , int toa){

  if(cura >= toa){
    
  
 for(int x = 0 ; cura != toa ; x++){ 

  Jt1.write(cura + x);
  delay(D1);
    Serial.write(1002);
 }
 
 }else if(cura <= toa){

  
     for(int x = 0 ; cura != toa ; x ++){ 

  Jt1.write(cura + x);
  delay(D1);
    Serial.write(1002);
  }
    
    }

  }

  void iA2 (int cura , int toa){

  if(cura >= toa){
    
  
 for(int x = 0 ; cura != toa ; x++){ 

  Jt2.write(cura + x);
  delay(D2);
  Serial.write(1002);
 }
 
 }else if(cura <= toa){

  
     for(int x = 0 ; cura != toa ; x ++){ 

  Jt2.write(cura + x);
  delay(D2);
  Serial.write(1002);
  }
    
    }

  }
