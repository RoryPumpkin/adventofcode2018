  
int startTime;
int completionTime;
String input;
int removed;

void setup(){
  size(400,400);
  
  Puzzle1();
}

void draw(){
  background(70);
}

void Puzzle1(){
  //start timer
  startTime = millis();
  
  //do stuff
  
  input = loadStrings("input.txt")[0];
  input.trim();
  
  for(int i = 0; i < input.length()-1;){
    if(isOpposite(input.substring(i, i+1), input.substring(i+1, i+2))){
      removed+=2;
      //println(input.substring(i,i+1) +" reacted with: " + input.substring(i+1,i+2));
      input = input.substring(0, i) + input.substring(i+2, input.length());
      
      if(i > 0){
        i--;
      }
    } else {
      i++;
    }
  }
  
  input.trim();
  println(input);
  println(input.length());
  
  //end timer
  completionTime = millis() - startTime;
  print("completed in " + completionTime + " milliseconds");
}

boolean isOpposite(String c, String c2){
  if(c.toUpperCase().equals(c2)  || c.toLowerCase().equals(c2)){
    return true;
  } else return false;
  
}
