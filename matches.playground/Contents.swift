import UIKit

var number = 11

func checkHowManyMatches(_ number: Int,_ counter: inout Int){
    switch number {
    case 0: counter = counter + 6
    case 1: counter = counter + 2
    case 2: counter = counter + 5
    case 3: counter = counter + 6
    case 4: counter = counter + 4
    case 5: counter = counter + 5
    case 6: counter = counter + 6
    case 7: counter = counter + 3
    case 8: counter = counter + 7
    default:
        counter = counter + 6
    }
}

func countNumbers(_ number: Int, _ matchCounter: inout Int){
    var userNumber = number
    while(userNumber != -1){
        let lastPart = userNumber % 10
        checkHowManyMatches(lastPart, &matchCounter)
        if userNumber >= 10{
        userNumber = userNumber/10
        }
        else{
            userNumber = -1
        }
    }
}

func matchCount(matches number: Int) -> Int{
    var matchCounter = 0
    let userNumber = number
    guard userNumber >= 0 else {
        print("The number you want to show has to  be > 0")
        return 0
    }
    for number in 0 ... userNumber {
        countNumbers(number,&matchCounter)
    }
    return matchCounter
}
print("You need matches \(matchCount(matches: number)) to make it to: \(number)")
