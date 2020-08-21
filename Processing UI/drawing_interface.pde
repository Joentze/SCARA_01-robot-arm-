//CHECKPOINT ALGORITHM

String ChunkSizeCheckpt( int x1 , int y1 , int x2 , int y2 ){ 
 
  int ABSdiffX = abs(x1 - x2);
  int ABSdiffY = abs(y1 - y2);
  int chunkSize = 0;
  String strIndicatorReturn="-";
  
  if(ABSdiffX == ABSdiffY){
  chunkSize = ABSdiffX;
  strIndicatorReturn = "x"+"_"+"1"+"_"+"y"+"_"+"1";
}
  else if(ABSdiffX>ABSdiffY){
  chunkSize = ABSdiffX;
  strIndicatorReturn = "x"+"_"+str(chunkSize)+"_"+"y"+"_"+str(ABSdiffY);
  }
  else if(ABSdiffX<ABSdiffY){
  chunkSize = ABSdiffY;
  strIndicatorReturn = "x"+"_"+str(ABSdiffX)+"_"+"y"+"_"+str(chunkSize);;
  }
  
  return strIndicatorReturn;
  
}


int[] ChunkOne ( int x1, int x2 ,String chunkSizePT){
 
  String[] listedVal=split(chunkSizePT,'_');
  int xVal = int(listedVal[1]);
  int yVal = int(listedVal[3]);
  float highest = 0;
  float lowest = 0;
  float absDiff = abs(x1 - x2);
  int addSub = 0;
 
  if(xVal == yVal){
  highest = xVal;
  lowest = xVal;
  }
  else if(xVal > yVal){
 highest = xVal;
 lowest = yVal;
  }
  else if(xVal < yVal){
  highest = yVal;
 lowest = xVal;
  };
  
  if(x1>x2){
  addSub = -1;
  }
  else if(x1<x2){
  addSub = 1;  
  };
  //println(absDiff);
  //println(lowest);
   int[] inBtw = new int[int(absDiff)];
   
 int[] returnChunk = {};

 
 //FINDS THE MULTIPLE TO BE DIVIDED BECAUSE FLOAT RETURNS ZERO FOR RATIOS < 1
   if(absDiff!=0){
 //  println(absDiff);
  // println(highest);
  float ratio = highest/absDiff;
//println(ratio);
  for(int cnt = 0; cnt<absDiff ; cnt++){      
    inBtw[cnt] = x1 + addSub*cnt;
}

for(int cnt = 0; cnt<highest ;cnt++){
  
  float current = cnt/ratio;
 
  int track = int(current);

  returnChunk = append(returnChunk,inBtw[track]);

}

 }
else if(absDiff == 0){
  for(int cnt = 0; cnt<highest; cnt++){
 returnChunk = append(returnChunk,x1); }
}

return returnChunk;
}

  
int[] fullListConcatX(int[] XList,int[] YList){
    int[] fullFinalList = {};
  int XL = XList.length;
  int YL = YList.length;
  int LM = 0 ;
  
 // println(XL);
  //println(YL);
  
  if(XL==YL){
  LM=XL;
  }
  else if(XL > YL){
  LM=YL;
  }
  else if(XL < YL){
  LM=XL;
  }

  for(int cnt = 1; cnt<LM; cnt++){
  
  int[] parts = ChunkOne(XList[cnt-1],XList[cnt],ChunkSizeCheckpt(XList[cnt-1],YList[cnt-1],XList[cnt],YList[cnt])); 
  //printArray(parts);
  fullFinalList = concat(fullFinalList,parts);
  
  //println("iterate");}
  
} 
  return fullFinalList;

}
int[] fullListConcatY(int[] XList,int[] YList){
    int[] fullFinalList = {};
  int XL = XList.length;
  int YL = YList.length;
  int LM = 0 ;
  
  //println(XL);
  //println(YL);
  
  if(XL==YL){
  LM=XL;
  }
  else if(XL > YL){
  LM=YL;
  }
  else if(XL < YL){
  LM=XL;
  }

  for(int cnt = 1; cnt<LM; cnt++){
  
  int[] parts = ChunkOne(YList[cnt-1],YList[cnt],ChunkSizeCheckpt(XList[cnt-1],YList[cnt-1],XList[cnt],YList[cnt])); 
  //printArray(parts);
  fullFinalList = concat(fullFinalList,parts);
  
  //println("iterate");}
  
} 
  return fullFinalList;

}
int[] fullListConcatZ(int[] XList,int[] YList,int[] ZList){
    int[] fullFinalList = {};
  int XL = XList.length;
  int YL = YList.length;
  int LM = 0 ;
  
  //println(XL);
  //println(YL);
  
  if(XL==YL){
  LM=XL;
  }
  else if(XL > YL){
  LM=YL;
  }
  else if(XL < YL){
  LM=XL;
  }

  for(int cnt = 1; cnt<LM; cnt++){
  
  int[] parts = ChunkOne(ZList[cnt-1],ZList[cnt],ChunkSizeCheckpt(XList[cnt-1],YList[cnt-1],XList[cnt],YList[cnt])); 
  //printArray(parts);
  fullFinalList = concat(fullFinalList,parts);
  
  //println("iterate");}
  
} 
  return fullFinalList;

}
int timingFunction(int x0 , int x1, int maxDelay){
  float diff = abs(x0 - x1);
  int returnDelay = int(maxDelay*diff);
  return returnDelay;
}
