import UIKit

var cards = [1,2,3,4,5,6,7,8,9,11,10,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32, 1, 1, 1, 1, 2,
3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,32,31,30,29,28,27,26,25,24,23, 22]


func deckMaker( _ cards: inout [Int]) -> Int{
    var deckCounter = 0
    var deck = [Int]()
    var indexesToRemove = [Int]()
    while(!cards.isEmpty){
        for (index,card) in cards.enumerated(){
            if !deck.contains(card){
                indexesToRemove.append(index)
                deck.append(card)
                if deck.count == 32{
                    deck.removeAll()
                    deckCounter = deckCounter + 1
                }
            }
        }
        if indexesToRemove.isEmpty{
            cards.removeAll()
        }else{
            for index in indexesToRemove.reversed(){
                cards.remove(at: index)
            }
            indexesToRemove.removeAll()
        }
    }
    return deckCounter
}

print("Number of decks: \(deckMaker(&cards)) ")
