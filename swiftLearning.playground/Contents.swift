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
game.score = 10
game.score -= 3

struct Player{
    let name:String
    let number:Int
    
    init(name:String){
        self.name = name
        number = Int.random(in: 1...99)
    }
}
let player = Player(name: "Chelsea")
print(player)
