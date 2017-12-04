void pattern1(){
  for (int i = 0; i < 12; i++) {
      for (int j = 0; j < 20; j++) {
        if (i % 2 == 0 && j % 2 == 0) {
          programArray[i][j] = 1;
        }
        else if (i % 2 == 0 && j % 2 == 1){
          programArray[i][j] = 0;          //White
        }
        else if (i % 2 == 1 && j % 2 == 1) {
          programArray[i][j] = 1; //Orange
        }
        else if (i % 2 == 1 && j % 2 == 0) {
          programArray[i][j] = 0;
        } 
      }
  }
}

void pattern2(){
  for (int i = 0; i < 12; i++) {
    for (int j = 0; j < 20; j++) {
      if ((j/5)%2 == 0 && i % 2 == 0) {
        programArray[i][j] = 1; //Orange
      }
      else if ((j/5)%2 == 0 && i % 2 == 1) {
        programArray[i][j] = 0; 
      }
      else if ((j/5)%2 == 1 && i % 2 == 0) {
        programArray[i][j] = 0; 
      }
      else if ((j/5)%2 == 1 && i % 2 == 1) {
        programArray[i][j] = 1; //Orange
      }
    }
  }
}

void pattern3(){
  int count = 1;
  for (int i = 0; i < 12; i++) {
    int rcount = count;
    for (int j = 0; j < 20; j++) {
      if (rcount > 0) {
        programArray[i][j] = 1; //Orange 
      }
      else {
         programArray[i][j] = 0;
      }
      
      rcount--;  
    }
    count++;
  }       
}

void pattern4(){
  for (int i = 0; i < 12; i++) {
    for (int j = 0; j < 20; j++) {
      if (i < 3) {
        programArray[i][j] = 1; //Orange   
      }
      
      else {
        if (j < 3 || (j >= 8 && j <= 10) || (j >= 17 && j <= 19)) {
          programArray[i][j] = 1; //Orange    
        }
        else programArray[i][j] = 0;
      }
    }
  }
}


void pattern5() {
  for (int j = 0; j < 20; j++) {
    for (int i = 0; i < 12; i++) {
      if (j == 5) {
        if (i == 2 || i == 3 || i == 8 || i == 9) programArray[i][j] = 1;
        else programArray[i][j] = 0;
      }
      
      else if (j == 6) {
        if (i == 1 || i == 2 || i == 3 || i == 4 || i == 7 || i == 8 || i == 9 || i == 10)
          programArray[i][j] = 1;
        else 
          programArray[i][j] = 0;
      }
      
      else if (j >= 7 && j <= 10) {
        programArray[i][j] = 1;
      }
      
      else if (j == 11) {
        if (i == 0 || i == 11) programArray[i][j] = 0;
        else programArray[i][j] = 1;
      }
      
      else if (j == 12) {
        if (i == 0 || i == 1 || i == 10 || i == 11)
          programArray[i][j] = 0;
        else 
          programArray[i][j] = 1;
      }
      
      else if (j == 13) {
        if (i==3 || i==4 || i==5 || i==6 || i==7 || i==8)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;
      }
      
      else if (j == 14) {
        if (i==4 || i==5 || i==6 || i==7) 
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;
      }
      
      else if (j == 15) {
        if (i==5 || i==6)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;
      }
      
      else {
        programArray[i][j] = 0;
      }
    }
  }
}


void pattern6() {
  for (int j = 0; j < 20; j++) {
    for(int i = 0; i < 12; i++) {
      if (j == 4 || j == 15) {
        if (i == 0 || i == 11) 
          programArray[i][j] = 0;
        else
          programArray[i][j] = 1;
      }
      
      else if (j == 5 || j == 8 || j == 9 || j == 10 || j == 14) {
        if (i == 0 || i == 11)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;  
      }
      
      else if (j == 6) {
        if (i == 0 || i == 11 || i == 3 || i == 8) 
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;  
      }
      
      else if (j == 7) {
        if (i==0 || i==11 || i==2 || i==3 || i==8 || i==9)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;   
      }
      
      else if (j == 11) {
        if (i==0 || i==11 || i==2 || i==9) 
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;    
      }
      
      else if (j == 12) {
        if (i==0 || i==11 || i==3 || i==8) 
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;  
      }
      
      else if (j == 13) {
        if (i==1 || i==2 || i==3 || i==8 || i==9 || i==10)  
          programArray[i][j] = 0;
        else
          programArray[i][j] = 1;
      }
      
      else
        programArray[i][j] = 0;
    }    
  }
}


void pattern7() {
  for (int j = 0; j < 20; j++) {
    for (int i = 0; i < 12; i++) {
      if (j == 0) {
        if (i == 0 || i == 1 || i == 8 || i == 10)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;  
      }
      
      else if (j == 1) {
        if (i==0 || i==2 || i==8 || i==10)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;    
      }
      
      else if (j == 2) {
        if (i==0 || i==2 || i==8 || i==9 || i==10)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;  
      }
      
      else if (j == 3) {
        if (i==0 || i==1 || i==4 || i==5 || i==6 || i==10)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;
      }
      
      else if (j == 4) {
        if (i==0 || i==2 || i==4 || i==6 || i==10)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;    
      }
      
      else if (j == 5) {
        if (i==0 || i==2 || i==4 || i== 5 || i==6)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;  
      }
      
      else if (j == 6) {
        if (i==0 || i==1 || i==4 || i== 5 || i==8 || i==9 || i==10)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;    
      }
      
      else if (j == 7) {
        if (i==4 || i== 6 || i==10)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;    
      }
      
      else if (j == 8) {
        if (i==0 || i==2 || i==4 || i== 6 || i==9)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;    
      }
      
      else if (j == 9) {
        if (i==0 || i==2 || i==9)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;    
      }
      
      else if (j == 10) {
        if (i==0 || i==2)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;    
      }
      
      else if (j == 11) {
        if (i==0 || i==2 || i==5 || i==6 || i==8 || i==9 || i==10)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;    
      }
      
      else if (j == 12) {
        if (i==1 || i==4 || i==8)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;    
      }
      
      else if (j == 13) {
        if (i==4 || i==8 || i==9 || i==10)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;    
      }
      
      else if (j == 14) {
        if (i==0 || i==1 || i==2 || i==4 || i==8 || i==10)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;    
      }
      
      else if (j == 15) {
        if (i==0 || i==4 || i==8 || i==9 || i==10)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;    
      }
      
      else if (j == 16) {
        if (i==0 || i==1 || i==2 || i==5 || i==6)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;    
      }
      
      else if (j == 17) {
        if (i==0 || i==8 || i==9 || i==10)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;    
      }
      
      else if (j == 18) {
        if (i==0 || i==1 || i==2 || i==8 || i==10)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;    
      }
      
      
      else if (j == 19) {
        if (i==9 || i==8 || i==10)
          programArray[i][j] = 1;
        else
          programArray[i][j] = 0;    
      }
    }
  }
  
}

void patternClear() {
  for (int i = 0; i < 12; i++) {
    for (int j = 0; j < 20; j++) {
      programArray[i][j] = 0;
    }
  }
}

void patternSend() {
  for (int j = 0; j < 20; j++) {
    for (int i = 0; i < 12; i++) {
      if (programArray[i][j] == 1)
        myPort.write('0');
      else
        myPort.write('1');
    }
  }
  myPort.write('2'); //incicate stop condition
  myPort.write('\r');
}

void patternCheck(){
    if (mouseX >= 100 && mouseX <= 250 && mouseY >= 50 && mouseY <= 150) { 
      pattern1();
      print("Display Pattern 1\n");
    }
      
    else if (mouseX >= 100 && mouseX <= 250 && mouseY >= 200 && mouseY <= 300) {
      pattern2();
      print("Display Pattern 2\n"); 
    }
      
    else if (mouseX >= 100 && mouseX <= 250 && mouseY >= 350 && mouseY <= 450) {
      pattern3();
      print("Display Pattern 3\n"); 
    }
    
    else if (mouseX >= 100 && mouseX <= 250 && mouseY >= 500 && mouseY <= 600) {
      pattern4();
      print("Display Pattern 4\n"); 
    }
    
    else if (mouseX >= 290 && mouseX <= 440 && mouseY >= 125 && mouseY <= 225) {
      pattern5();
      print("Display Pattern 5\n");
    }
    
    else if (mouseX >= 290 && mouseX <= 440 && mouseY >= 275 && mouseY <= 375) {
      pattern6();
      print("Display Pattern 6\n");
    }
    
    else if (mouseX >= 290 && mouseX <= 440 && mouseY >= 425 && mouseY <= 525) {
      pattern7();
      print("Display Pattern 7\n");
    }
    
    else if (mouseX >= 1000 && mouseX <= 1150 && mouseY >= 400 && mouseY <= 500) {
      patternSend();
      print("Display Send\n"); 
    }
    else if (mouseX >= 1000 && mouseX <= 1150 && mouseY >= 200 && mouseY <= 300) {
      patternClear();
      print("Display Clear\n");
    }
}