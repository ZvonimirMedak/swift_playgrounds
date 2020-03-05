import UIKit

let players = ["player 1", "player 2", "player 3", "player 4", "player 5", "player 6", "player 7", "player 8", "player 9", "player 10" ]
var playerCounter = 0
var gameCounter = 1
var directionReversed = false
func changeDirection(){
    directionReversed = !directionReversed
}
func checkPlayer(){
    if playerCounter == 10{
        playerCounter = 0
    }
    else if playerCounter == -1{
        playerCounter = 9
    }
}
func skipPlayer(){
    if directionReversed{
       playerCounter = playerCounter - 1
        checkPlayer()
    }else{
        playerCounter = playerCounter + 1
        checkPlayer()
    }
    
}

func play(_ number: Int){
    guard number>100 else {
        print("Wrong input! Number: \(number) has to be > 100")
        return
    }
    while (gameCounter < number){
        gameCounter = gameCounter + 1
        if (gameCounter % 7) == 0{
            changeDirection()
        }
        if (gameCounter % 13) == 0 {
            skipPlayer()
        }
        if directionReversed{
            playerCounter = playerCounter - 1
            checkPlayer()
        }
        else{
            playerCounter = playerCounter + 1
            checkPlayer()
        }
    }
    print("index: \(playerCounter)")
    print("Player: \(players[playerCounter]) has won the game")
}
play(100)
play(101)
