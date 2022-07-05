int startTime;
int completionTime;
int length;
//StringList binaries;
int twoAmount, threeAmount;
int twoScoreAmount, threeScoreAmount;
int removed;
char[] activeArray, removeOne, editArray;
char[] alphabet = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };
String oneRemovedString, active;
char currentLetter, lastFoundTwoLetter;
boolean two, three;

void setup(){
  size(400,400);
  
  Puzzle1();
}

void draw(){
  background(70);
}

void Puzzle1(){
  startTime = millis();

  String[] lines = loadStrings("input.txt");
  length = lines[0].length() - 1;
  
  for(String line : lines){
    GetBoxIDChecksum(line);
  }
  
  /*
  twoAmount = 0;
  threeAmount = 0;
  two = false;
  three = false;
  
  active = lines[0];
  activeArray = lines[0].toCharArray();
  editArray = lines[0].toCharArray();
  
  println(activeArray.length);
  
  for (char letter : activeArray)
  {
    currentLetter = letter;
    
    RemoveLetter();

    if(RemoveLetter()){
      twoAmount++; 
      lastFoundTwoLetter = letter;
    }
    
    if(RemoveLetter()){
      if(lastFoundTwoLetter == letter){
        twoAmount--;
      }
      threeAmount++; 
    }
    
    
    String word = new String(editArray);
    println(word + " finished the letter " + currentLetter);
    
  }*/

  //println(lines[0]);
  println(twoScoreAmount, threeScoreAmount, twoScoreAmount * threeScoreAmount);
  completionTime = millis() - startTime;
  print("completed in " + completionTime + " milliseconds");
}

void GetBoxIDChecksum(String str){
  twoAmount = 0;
  threeAmount = 0;
  two = false;
  three = false;
  
  active = str;
  activeArray = str.toCharArray();
  editArray = activeArray;
  
  lastFoundTwoLetter = '0';
  
  
  for (char letter : activeArray)
  {
    currentLetter = letter;
    
    RemoveLetter();

    if(RemoveLetter()){
      twoAmount++; 
      lastFoundTwoLetter = letter;
    }
    
    if(RemoveLetter()){
      if(lastFoundTwoLetter == letter){
        twoAmount--;
      }
      threeAmount++; 
    }
    
    //String word = new String(editArray);
    //println(word + " finished the letter " + currentLetter);
  }
  
  if(twoAmount > 0){ 
    twoScoreAmount++;
    two = true;
    }
    else { two = false; }
    
    if(threeAmount > 0){
      threeScoreAmount++;
      three = true;
    }
    else { three = false; }
  
  println("current word: " + str);
  println(twoAmount, threeAmount);
  println(twoScoreAmount, threeScoreAmount);
}

boolean RemoveLetter(){
  int index = active.indexOf(str(currentLetter));
  if(index == -1){ return false; }
  removeOne = new char[editArray.length];
  for(int i = 0; i < removeOne.length; i++){
    if(i == index){
      //println(activeArray[i] + " = removed");
      if(i < removeOne.length - 1){
        i++;
        removeOne[i] = editArray[i];
      }
    }
    else
    {
      removeOne[i] = editArray[i];
    }
  }
  editArray = removeOne;
  oneRemovedString = new String(editArray);
  
  active = new String(editArray);
  return true;
}

//binaries = new StringList(length);
  
  /*
  for(char c, i = 0; i != length; ){
    c = lines[0].charAt(i++);
    //binaries.append(bin);
    //println(c, nf(c, 3), bin);
    println(c);
  }*/
