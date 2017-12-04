import processing.serial.*;
Serial myPort;

// Global variable that determines which mode the app is currently in
int modeFlag = 0;

// Delete: no longer nedded
int mode = 0;

// Global variable that determines whether to color or uncolor
int fill = -1;


int count = 0;

// Global variable that identifies the x_index and y_index of the cell in the two-dimensional array
int loc_x, loc_y;

// Two-dimensional array that stores the color of each cell, sent to the board for display
int [][]programArray = new int[12][20];

// Array that stores the status of all 12 circles in Play Mode
char []playArray = new char[12];

// Array declared for debuggin purposes
int []debugPlayArray = new int[12];

// To-Do:
int playSendInterval = 100, playSendTotal = 5000;

// To-Do:
int timer = 0;


/*
  called once a mouse is clicked
  1. switch between the three modes based on mouse clicks
  2. determines whether to paint or clear in the scratchpad in Program Mode
*/
void mousePressed(){
  //~~~Switch mode if mode button is pressed 
  if (mouseX >= 576 && mouseX <= 726 && mouseY >= 600 && mouseY <= 660) {
      
      // Transition to Program Mode 
      modeFlag = 1 - modeFlag;
      
      //~~~Finish sending something when switch out from play mode to program mode
      if (modeFlag == 1){
       myPort.write('\r');
      }
      
      //~~~Reset program array when switch out from program mode to play mode
      if (modeFlag == 0){
        patternClear();
        playSendTotal = millis(); //Reset playSendTotal time too
      }
  }
  
  //Play Mode
  if (modeFlag == 0) {
    //Check whether "Emjoy Mode" button is pressed
    if (mouseX >= 900 && mouseX <= 1050 && mouseY >= 150 && mouseY <= 660) {
      
      // Transition to Enjoy Mode
      modeFlag = 2;
      
      myPort.write('\r'); //Stop whatever mode 1 is sending
      
      delay(200);
      
      for (int loop = 0; loop < 20; loop++){
        myPort.write('1');
      }
      
      myPort.write('2');
      myPort.write('\r');
      print("Enter Enjoy Mode\n");
    }  
  }
  
  // Enjoy Mode
  else if (modeFlag == 2) {
    //Check whether "Enjoy Mode" button is pressed
    if (mouseX >= 900 && mouseX <= 1100 && mouseY >= 150 && mouseY <= 660) {
      playSendTotal = millis(); //Reset playSendTotal time too
      modeFlag = 0; // Set mode back to Play Mode
      
      print("Back to Play Mode\n");
    }  
  }
  
  //Program Mode
  else if (modeFlag == 1){
    // check whether this cell is filled or not
    // if filled, then enter clear setting: erase color until mouse is released
    // if not filled, start filling in color
    // Used to support the scratchpad implementation in Program Mode
    
    if (programArray[loc_x][loc_y] == 1) {
        fill = 0;
        fill(255);         //White, erase
    }
    else {
        fill = 1;
        fill(255, 125, 0);//Orange, paint around
    }
    
    //Check if pattern box is clicked
    patternCheck();
  }
}

void setup(){
  size(1300, 700);       //Draw the size of app
  
  //~~~Initialize play mode array
  for (int i = 0; i < 12; i++) {
      playArray[i] = '0';
      debugPlayArray[i] = 0;
  }
  
  //~~~Initialize program mode array
  for (int i = 0; i < 12; i++) {
      for (int j = 0; j < 20; j++) {
        programArray[i][j] = 0;
      }
  }
  //~~~Serial communication with bluetooth or TTF connector~~~
  //----Starts serial communication
  myPort = new Serial(this, "COM6", 9600); 
  //----Define read serial port until enter is hit
  myPort.bufferUntil('\n'); 
}

//~~~Checks for available data in the Serial Port
//~~~and store into dataReceive string
String dataReceive;

void serialEvent (Serial myPort){ 
  //---Serial communication with bluetooth
  dataReceive = myPort.readStringUntil('\n'); 
  
  println(dataReceive); //print it out in the console
}

void draw(){
  background(237, 240, 241);  //Set Background Color to greyish
  
  //~~~Draw Mode Rectangular Box
  //----Set color to orange to draw box
  fill(255, 125, 0);         
  rect(576, 600, 150, 60);
  
  
  //----Set color to black to write text
  fill(0);
  textSize(16);
  
  // Change the text on the button based on the current mode
  String display = "";
  
  if (modeFlag == 0 || modeFlag == 2) {
    display = "Play Mode";
    text(display, 614, 640);
  }
  else {
    display = "Program Mode";
    text(display, 597, 640);
  }
  
  fill(255, 125, 0);         //Orange Color
  stroke(#B85900);           //Set color of edge to draker orange
  strokeWeight(3);
  //Thanks to amazing color website http://colllor.com/ff7b00
  
  //~~~Play Mode + Enjoy Mode Code~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  if (modeFlag == 0 || modeFlag == 2) {
    mode = 0; //Set mode back to custom mode
    
    //Display the Enjoy Mode button
    fill(255);
    rect(900, 600, 150, 60);
    fill(255, 125, 0);
    
    // Display different texts on the button based on which mode is currently in
    if (modeFlag == 0) {
      fill(255, 125, 0);
      rect(900, 600, 150, 60);
      fill(0);
      textSize(16);
      text("Enjoy Mode", 930, 635);
    }
      
    else if (modeFlag == 2){
      fill(255, 125, 0);
      rect(900, 600, 200, 60);
      fill(0);
      textSize(16);
      text("Back to Play Mode", 930, 635);
    }
    
    fill(255, 125, 0);
    
    //~~~Draw 12 valves control circles
    int init = 160;
    for (int i = 0; i < 12; i++) {
      ellipse(init, 200, 70, 70);
      init += 90;
    }
    
    // Update the status of circles if they are pressed by the mouse
    int j = 12;
    if (mousePressed){
      for (j = 0; j < 12; j++){
        if (mouseX >= (125+j*90) && mouseX <= (195+j*90) && mouseY >= 135 && mouseY <= 235) {
          //playArray[j] = '1';
          playArray[j] = '0'; //Reverse it
          debugPlayArray[j] = 1;
          //print(j);
          break;
        }
      }
    }
  
    //If a circle is pressed, draw something for debug purpose
    if (j != 12){
      fill(#E06C00);
      ellipse(90*j+160, 200, 70, 70);
    }
    
    // Send playArray via the serial port
    if (modeFlag == 0){
      //~~~Update current time, send out info in send interval 
      timer = millis();
      if (timer > playSendTotal){
        playSendTotal += playSendInterval;
        for (j = 0; j < 12; j++) {
          myPort.write(playArray[j]);
          //print(debugPlayArray[j]);
          //playArray[j] = '0'; //Reset array
          playArray[j] = '1'; //Reverse it
          debugPlayArray[j] = 0;
        }
        //print('\n');
        myPort.write('2'); //incicate stop condition
        myPort.write('\r');
        //myPort.write(13); //Finish sending by sending enter or new line
      }
    }
    //print(timer);
    //print('\n');
  }
  
  //~~~Program Mode Code~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  else {
    
    // position of the cell in the top-left corner
    int x_init = 500; //15*25 = 
    int y_init = 30;
    
    // Draw the buttons in this interface
    fill(255, 125, 0);         //Orange Color
    stroke(#B85900);           //Set color of edge to draker orange
    rect(100, 50, 150, 100);   //Pattern 1 button
    rect(100, 200, 150, 100);  //Pattern 2 button
    rect(100, 350, 150, 100);  //Pattern 3 button
    rect(100, 500, 150, 100);  //Pattern 4 button
    rect(290, 125, 150, 100);  //Pattern 5 button
    rect(290, 275, 150, 100);  //Pattern 6 button
    rect(290, 425, 150, 100);  //Pattern 7 button
    rect(1000, 400, 150, 100); //Send button
    rect(1000, 200, 150, 100); //Clear button
    textSize(20);
    fill(0);
    text("Pattern 1", 130, 110);
    text("Pattern 2", 130, 260);
    text("Pattern 3", 130, 410);
    text("Pattern 4", 130, 560);
    text("Pattern 5", 320, 185);
    text("Pattern 6", 320, 335);
    text("Pattern 7", 320, 485);
    text("Send", 1050, 460);
    text("Clear", 1050, 260);
    
    // Display the matrix
    for (int i = 0; i < 12; i++) {
      for (int j = 0; j < 20; j++) {
        if (programArray[i][j] == 1) {
          fill(255, 133, 16); //Orange
        }
        else {
          fill(255);          //White
        }
        rect(x_init, y_init, 25, 25);  
        y_init += 25;
      }
      x_init += 25;
      y_init = 30;
    }   
    
    //~~~Drag mouse to change color of sqaure
    if (mouseX >= 480 && mouseX <= 795 && mouseY >= 25 && mouseY <= 525) {
      int x = mouseX - 500;
      int y = mouseY - 30;
      loc_x = x/25;
      loc_y = y/25;
      
      // Update the color of the cell if a mouse click takes place
      if (mousePressed) {
        if (fill == 1) {
          fill(204, 102, 0);
          programArray[loc_x][loc_y] = 1;
        }
        else if (fill == 0) {
          fill(255);
          programArray[loc_x][loc_y] = 0;
        }
      }
    }       
  }
  
  
  fill(33);
  textSize(16);
  text("ECE 4760 Final Project\n     Xitang and Henry", 560, 560);
}