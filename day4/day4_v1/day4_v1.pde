  
int startTime;
int completionTime;
String[] lines, split, split2, split3;
String[] sortedLines;
int year, month, day, hour, minute;
boolean asleep;
int[] guardIDs;
int[] hashes;
int hash;
String wakeUp = "wakes up", fallAsleep = "falls asleep";
int guardCount;
int minutesAsleep, startSleepHash;
int lastGuardID, startSleepMinute;
int[] mostMinute;

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
  
  String[] lines = loadStrings("input.txt");
  hashes = new int[lines.length];
  sortedLines = new String[lines.length];
  guardIDs = new int[5000];
  mostMinute = new int[60];
  
  for(int i = 0; i < lines.length; i++){
    DissectLine(lines[i]);
    hashes[i] = hashDate();
    //println(hashes[i]);
  }
  
  //sort the hashes that represent a date
  hashes = sort(hashes);
  
  //loop through each line
  for(int i = 0; i < lines.length; i++){
    DissectLine(lines[i]);
    //get the hash date for that line
    hash = hashDate();
    
    //compare that hash to the sorted lashes
    for(int h = 0; h < hashes.length; h++){
      if(hashes[h]==hash){
        //add the line to the new array with the sorted index
        sortedLines[h] = lines[i];
      }
    }
  }
  //now we have a sorted array of guard events by date in sortedLines
  
  //now we need to store a guard id when there is one
  //otherwise make the current guard sleep or be awake
  for(int i = 0; i < lines.length; i++){
    DissectLine(sortedLines[i]);
    
    if(wakeUp.equals(split[1]) && lastGuardID == 499){
      //println(hashDate(),"-------awake");
      minutesAsleep += hashDate() - startSleepHash;
      
      for(int m = startSleepMinute; m < minute; m++){
        if(m > 59){
          m -= 59;
        }
        println(m);
        mostMinute[m] += 1;
      }
    }
    else if(fallAsleep.equals(split[1])){
      //println(hashDate(), "///////sleep");
      startSleepHash = hashDate();
      startSleepMinute = minute;
    } else{
      
      split2 = split[1].split(" ");
      lastGuardID = int(split2[1].substring(1));
      guardCount++;
      guardIDs[int(split2[1].substring(1))] += minutesAsleep;
      //println(int(split2[1].substring(1)) + " --- slept: " + minutesAsleep + " minutes");
      minutesAsleep = 0;
    }
  }
  
  println(int(maxMinutes(mostMinute).x), int(maxMinutes(mostMinute).y));
  //println(int(maxMinutes(guardIDs).x), int(maxMinutes(guardIDs).y));
  
  //end timer
  completionTime = millis() - startTime;
  print("completed in " + completionTime + " milliseconds");
}

void DissectLine(String line){
  line = line.substring(1);
  split = line.split("] ");
  
  //split[0]               //year-month-day hour:minute
  //split[1];              //Guard #1151 begins shift

  split2 = split[0].split(" ");
  
  //split2[0]              //year-month-day
  //split2[1]              //hour:minute
  
  split3 = split2[0].split("-");
  
  year = int(split3[0]);
  month = int(split3[1]);
  day = int(split3[2]);
  
  split3 = split2[1].split(":");
  
  hour = int(split3[0]);
  minute = int(split3[1]);
  
  //println(year, month, day, hour, minute);
}

int hashDate(){
  int result;
  if(month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12){
    result = month * 31;
  } else result = month * 30;
  return ((result + day)*24 + hour)*60 + minute;
}

//x is index = guardID, y is max = total minutes asleep
PVector maxMinutes(int[] array){
  int pos=-1;
  int max=0;
  for(int i = 0;i<array.length;i++)
  {
    if(array[i]>max)
    {
      pos=i;
      max=array[i];
    }
  }
  
  return new PVector(pos, max);
}
