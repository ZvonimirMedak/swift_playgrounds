import UIKit

let smallBreakDuration = 10
let bigBreakDuration = 15
let afterWhichBigBreak = 5
let hours = 10
let minutes = 0
var breakStartTime = [(Int, Int)]()

func insertBreakTime(_ hour: Int, _ minute: Int){
       if minute >= 60{
               if hour < 15{
               breakStartTime.append((hour + 1, minute % 60))
               }
           }
           else{
               breakStartTime.append((hour, minute))
           }
}

func getClassStartTime(_ smallBreak: Int, _ bigBreak: Int, _ afterWhichBigBreak: Int) -> [(Int, Int)]{
    var classStartTime = [(8,0)]
    var hour = 8
    var minutes = 0
    var classCounter = 1
    while(hour < 16){
        if afterWhichBigBreak == classCounter{
            insertBreakTime(hour, minutes + 45)
            minutes = minutes + 45 + bigBreakDuration
        }
        else{
            insertBreakTime(hour, minutes + 45)
            minutes = minutes + 45 + smallBreak
        }
        classCounter = classCounter + 1
        if minutes >= 120{
            guard hour < 14 else{
                return classStartTime
            }
            hour = hour + 2
            minutes = minutes % 60
        }
        if minutes >= 60{
            guard hour < 15 else{
                return classStartTime
            }
            hour = hour + 1
                    minutes = minutes % 60
    }
      classStartTime.append((hour, minutes))
                
    }
return classStartTime
}

func getWhatTheyHave(_ classStartTime: [(Int, Int)], _ time: (Int, Int)){
    guard time.0 < 16 else{
     print("They are not in school")
     return
    }
    guard time.0 >= 8 else{
        print("It is too early")
        return
    }
    for (index, value) in classStartTime.enumerated(){
        if time.0 == value.0{
            if value.1 <= time.1 && time.1 <= value.1 + 45{
                print("Class: \(index + 1) is in session")
            }
        }
        else if time.0 - 1 == value.0{
        if value.1 + 45 >= 60{
                if value.1 >= time.1 && time.1 <= ((value.1 + 45) % 60){
                    print("Class: \(index + 1) is in session")
                }
            }
        }
    }
    for (index, value) in breakStartTime.enumerated(){
        if time.0 == value.0{
            if afterWhichBigBreak == index + 1{
                if value.1 < time.1 && time.1 < value.1 + bigBreakDuration{
                    print("The big break is in session")
                }
            }
            else if value.1 < time.1 && time.1 < value.1 + smallBreakDuration{
                print("Small break: \(index + 1) is in session")
            }
            
        }
        else if value.0 == (time.0 - 1){
            if value.1 + smallBreakDuration >= 60{
                if value.1 > time.1 && time.1 < ((value.1 + smallBreakDuration) % 60){
                    print("Small break: \(index + 1) is in session")
                }
            }
        if afterWhichBigBreak == index + 1{
            if value.1 > time.1 && time.1 < ((value.1 + bigBreakDuration) % 60){
                print("Big break is in session")
    }
            }
            }
    }
    
    
}

func checkClassOrBreak(_ smallBreakDuration: Int, _ bigBreakDuration: Int, _ afterWhichBigBreak: Int,
    _ hours: Int, _ minutes: Int){
        let time = (hours, minutes)
        let classStartTime = getClassStartTime(smallBreakDuration, bigBreakDuration, afterWhichBigBreak)
        print("Class start time: \(classStartTime)")
        print("Break start time: \(breakStartTime)")
        getWhatTheyHave(classStartTime, time)
    }


checkClassOrBreak(smallBreakDuration, bigBreakDuration, afterWhichBigBreak, hours,minutes)


