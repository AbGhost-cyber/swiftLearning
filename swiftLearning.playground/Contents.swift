import UIKit

var greeting = "Hello, playground"
 let quote = "He tapped \"Believe\" and walked"

let movies = """
A day in
the life of an
Apple engineer
"""
//print(movies.hasPrefix("A"))

let score = 10
let number = 120
//print(score.isMultiple(of: 10))

let id = Int.random(in: 1...100)
//print(id)
 
let myScore = 3.0
var goodDogs = true
goodDogs.toggle()

let name = "Taylor"
let age = 23
let message = "I am \(name) and I'm \(age) years old"

var colors = ["Red", "Blue", "Orange"]
let numbers = [1,2,3,4,5,6]
colors.append("Black")

let employee = [
    "name": "Taylor",
    "job":"Singer"
]
var numbersSet = Set([1,2,3,4,5])
//print(numbersSet)
var nn:Set = [1,2,3,4,4,1,1]
nn.insert(10)

//enums
enum Weekday{
    case Monday, Tuesday
}
//print(Weekday.Monday)

var isEnabled:Bool = true
var albums:[String] = ["Red", "Blue"]
var user:[String:String] = ["id":"@twostraws"]

var teams:[String] = [String]()
var clues = [String]()

enum UIStyle{
    case light, dark, system
}
var userStyle:UIStyle = .dark
//print(userStyle)

//switch userStyle{
////case.light:
////    //print("eww my eyes")
////case .dark:
////    //print("awesome stuff ")
////default:
////    //print("system stuff")
////}

let mAge = 22
if(mAge < 12 ){
    //print("you can't vote")
}else if(mAge < 18){
    //print("you can vote soon")
}else{
    //print("you can vote now")
}

let newAge = 18
let canVote = newAge >= 18 ? "Yes" : "No"
//print(canVote)

var platforms = ["iOS", "macOsssssssss", "tvOs", "ws"]
//for os in platforms{
//   // print("Swift works on \(os)")
//}
//for number in 1..<10{
//    print("--------")
//    for i in 1...12{
//        print("\(number) x \(i) = \(number * i)")
//    }
//}

//let files = ["me.jpg", "work.xls", "soccer.jpg", "holiday pics.jpg"]
//var jpgFiles:[String] = [String]()
//for file in files{
//    if(!file.hasSuffix(".jpg")){
//        continue
//    }
//    jpgFiles.append(file)
//}
//print(jpgFiles)

func printTimesTable(number:Int){
    for i in 1...12{
        print("\(number) x \(i) is \(number * i)")
    }
}

func rollDice()->Int{
    Int.random(in: 1...10)
}

func getUser()->(firstName:String, lastName:String){
    return (firstName:"Taylor", lastName:"Swift")
}
//distructuring
let (firstName, _) = getUser()

enum PasswordError:Error{
    case short, obvious
}
func checkPassword(password:String) throws ->String{
    if(password.count < 5){
        throw PasswordError.short
    }
    if(password == "12345"){
        throw PasswordError.obvious
    }
    return password.count < 10 ? "Ok" : "Good"
}

//do{
//    let result = try checkPassword(password: "12345")
//    print("Rating: \(result)")
//}catch PasswordError.obvious{
//    print("too common password")
//}catch PasswordError.short{
//    print("password is too short")
//}

let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]
let onlyT = team.filter{name in
    name.hasPrefix("T")
}
let transformed = team.map{ name in
    return name.count * 2
}

struct Album{
    let title:String
    let artist:String
    var isReleased = true
    
    func printSummary(){
        print("\(title) by \(artist)")
    }
}
struct Employee{
    let name:String
    var vacationAllowed = 14
    var vacationTaken = 0
    var vacationRemaining:Int{
        get{
            vacationAllowed - vacationTaken
        }
        set{
            vacationAllowed = vacationTaken + newValue
        }
    }
}

var mEmployee = Employee(name: "Dremo", vacationAllowed: 12, vacationTaken: 2)

struct Game{
    var score = 0{
        didSet{
            print("Score is now \(score)")
        }
    }
}
var game = Game()
//game.score = 10
//game.score -= 3

struct Player{
    let name:String
    let number:Int
    
    //
    init(name:String){
        self.name = name
        number = Int.random(in: 1...99)
    }
}
let player = Player(name: "Chelsea")
//print(player)

protocol BankProtocol{
    func deposit(amount:Double)
    func withdraw(amount:Double)->Bool
}

class BankAccount : BankProtocol{
    private (set) var funds:Double = 0
    static let version = "1.3 beta 2"
    
    init(funds:Double){
        self.funds = funds
    }
     func deposit(amount:Double){
        funds += amount
    }
    func withdraw(amount:Double)->Bool{
        let canWithdraw = funds > amount
        if(canWithdraw){
            funds -= amount
        }
        return canWithdraw
    }
}
let bank = BankAccount(funds: 200.53)
bank.withdraw(amount: 120)

extension BankAccount{
    func send(to:String,amount:Double){
        print("Sending to \(to)...")
        let didSend = self.withdraw(amount: amount)
        if(didSend){
            print("successfully sent \(amount) to \(to)")
        }else{
            print("insufficient funds")
        }
    }
}
var maBank = BankAccount(funds: 120)
//maBank.send(to: "Abundance", amount: 20)

let opposites = [
    "Mario":"Wario",
    "Luigi":"Waluigi"
]
// if unwrap
if let mmm = opposites["Peach"]{
    print("Mario's opposite is \(mmm)")
}
//use guard unwrap
func printSquare(of number:Int?){
    guard let number = number else {
        print("Missing input")
        return
    }
    print("\(number) x \(number) is \(number * number)")
}
let arrayes = [1,2,3,4,5,6]
let fav = arrayes.randomElement() ?? 0
let input = "555"
//if let tr = Int(input){
//    print(tr)
//}

struct MPlayer{
    var name:String
    var highScore:Int = 0
    var history:[Int] = []
    
    init(_ name:String){
        self.name = name
    }
}
extension MPlayer :Codable, Equatable{
    mutating func updateScore(_ newScore:Int){
        history.append(newScore)
        if(self.highScore < newScore){
            self.highScore = newScore
            print("\(newScore)! A new high score for \(self.name) 🥳")
        }
    }
}

var mPlayer = MPlayer("Chelsea")
mPlayer.updateScore(30)
let mPlayer1 = MPlayer("Man Utd")
let mPlayer2 = MPlayer("Man City")
let players:[MPlayer] = [mPlayer1,mPlayer2,mPlayer]


let ranked = players.sorted{player1, player2 in
    player1.highScore > player2.highScore
}

extension Collection where Element == MPlayer {
    // Returns the highest score of all the players,
    // or `nil` if the collection is empty.
    func highestScoringPlayer() -> MPlayer? {
        return self.max(by: { $0.highScore < $1.highScore })
    }
}
var recordHolder = ""
if let bestPlayer = players.highestScoringPlayer() {
    recordHolder = """
        The record holder is \(bestPlayer.name),\
        with a high score of \(bestPlayer.highScore)!
        """
} else {
    recordHolder = "No games have been played yet."
}
print(recordHolder)

let highestScore = players.highestScoringPlayer()?.highScore ?? 0
print(highestScore)
