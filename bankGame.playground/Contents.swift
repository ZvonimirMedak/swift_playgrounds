import UIKit

enum OwnerType{    case privatePerson
    case physicalPerson
}
enum AccountType{
    case giroAccount
    case savingsAccount
    case currentAccount
}

struct Account{
    let accountType: AccountType
    let ownerType : OwnerType
    let accountNumber: String
    init(_ accountType: AccountType, _ ownerType: OwnerType, _ accountNumber: String){
        self.accountType = accountType
        self.ownerType = ownerType
        self.accountNumber = accountNumber
    }
}

func checkFirstTwoNumbers (_ account: String) -> Bool{
    var firstTwo = ""
    for (index,char) in account.enumerated(){
        if(index == 0 || index == 1){
            firstTwo.append(char)
        }
    }
    return firstTwo == "04"
}

func checkForMillionKunas(_ account: Account) -> Bool{
    return account.ownerType == OwnerType.privatePerson && account.accountType == AccountType.giroAccount
}

func checkForMillionEuros(_ account: Account) -> Bool{
    var lastThreeNumbers = ""
    for (index, value) in account.accountNumber.enumerated(){
        if(index >= 7 && index <= 9){
        lastThreeNumbers.append(value)
        }
    }
    return (Int(lastThreeNumbers)! % 3) == 0 && account.ownerType == OwnerType.physicalPerson
}

func bankGame(_ account: Account){
    guard account.accountNumber.count == 10 && checkFirstTwoNumbers(account.accountNumber) else{
        print("Wrong account number")
        return
    }
    guard (Int(account.accountNumber)! % 6) != 0 else {
        print("Account has been suspended")
       return
    }
    if checkForMillionKunas(account){
        print("You have won one million Kunas!")
    }
    else if checkForMillionEuros(account){
        print("You have just received an initiative of 1 million Euros")
    }
    else{
        print("Better luck next time!")
    }
    
}
let kunaWinner = Account(AccountType.giroAccount, OwnerType.privatePerson, "0411111115")
let initiativeWinner = Account(AccountType.giroAccount, OwnerType.physicalPerson, "0411111123")
let loser = Account(AccountType.giroAccount, OwnerType.physicalPerson, "0411111124")
bankGame(kunaWinner)
