  
int startTime;
int completionTime;
String[] lines, split, split2;
int id;
int fromLeft, fromTop;
int widthRec, heightRec;
int totalWidth = 1000;
int[] squares;
int duplicates;

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
  squares = new int[1000*1000];
  
  String[] lines = loadStrings("input.txt");
  for(String line : lines){
    DissectClaim(line);
  FillSquares();
  }
  
  //end timer
  completionTime = millis() - startTime;
  print("completed in " + completionTime + " milliseconds");
}

void DissectClaim(String line){
  String[] split = line.split(" @ ");
  //int id = int(split[0].substring(1));

  //println(line);
  
  String[] split2 = split[1].split(": ");
  
  split = split2[0].split(",");
  fromLeft = int(split[0]);
  fromTop = int(split[1]);
  
  split = split2[1].split("x");
  widthRec = int(split[0]);
  heightRec = int(split[1]);
  
  //println(id, fromLeft, fromTop, widthRec, heightRec);
}

void FillSquares(){
  //int count = 0;
  
  for(int x = 0; x < totalWidth; x++){
    for(int y = 0; y < totalWidth; y++){
      if(x >= fromLeft && x < fromLeft+widthRec && y >= fromTop && y < fromTop + heightRec){
        //count++;
        //println("array id = "+ x + (y*totalWidth) + ", x = " + x + ", y = " + y);
        if(squares[x + (y*totalWidth)] == 1){
          duplicates++;
        }
        squares[x + (y*totalWidth)]++;
      }
    }
  }
  
  //println("neededcount = " + widthRec * heightRec, "counted = " + count);
  println("duplicates = "+duplicates);

}
