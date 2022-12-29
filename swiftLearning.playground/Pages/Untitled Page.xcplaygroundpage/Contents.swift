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
//mPlayer.updateScore(30)
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
//print(recordHolder)

let highestScore = players.highestScoringPlayer()?.highScore ?? 0
//print(highestScore)

func existHigher( for numbers:[Int], compare:Int)->Bool{
    if let max = numbers.max(){
        return max >= compare
    }
    return false
}
//print(existHigher(for: [1,2,3,4,5], compare: 8))

func dividable(for numbers:[Int], divisor:Int)->[Int]{
    let results = numbers.map{ number in
        number % divisor
    }
    return results
}
//print(dividable(for: [17, 11, 99, 55, 23, 1], divisor: 5))

func carsNeeded(for n:Int)->Int{
    let maxNumberPerCar = 5
    var noOfCarPerMax = 0
    
    let hasPassengersLeft = n % maxNumberPerCar > 0
    noOfCarPerMax = n / maxNumberPerCar
    if(hasPassengersLeft){
        noOfCarPerMax += 1
    }
    return noOfCarPerMax
}
//print(carsNeeded(for: 5))
struct Person{
    let name:String
    let age:Int
    init(_ name:String, _ age:Int){
        self.name = name
        self.age = age
    }
    func compareAge(_ person:Person){
        if self.age > person.age{
            print("\(person.name) is younger than me")
        }else if self.age < person.age{
            print("\(person.name) is older than me")
        }else{
            print("\(person.name) is the same age as me")
        }
    }
}
var p1 = Person("Samuel", 24)
var p2 = Person("Joel", 36)
var p3 = Person("Lily", 24)


func sumDigits(of x:Int, and y:Int)->Int{
    if( x > y) {return 0}
    var betweenDigits:[Int] = []
    var sum = 0
    for i in x...y{
        let digitStr = String(i)
        if(digitStr.count > 1){
            digitStr.map{char in
                if let number = Int(String(char)){
                    betweenDigits.append(number)
                }
            }
        }else{
            betweenDigits.append(i)
        }
        
    }
    
    betweenDigits.forEach{ digit in
        sum += digit
    }
    return sum
}

//print(sumDigits(of: 100, and: 200))
enum Result<Sucess,Failure>{
    case success(Sucess)
    case failure(Failure)
}
func doSomething(completion:(Result<MPlayer,Error>)->Void){
    completion(.success(MPlayer("Abundance")))
    
}

func letterCounter(_ letterArray:[Array<String>], _ searchLetter:String)->String{
    
    func transformToText(_ i:Int, isRow:Bool = false)->String{
        switch(i){
        case 1: return isRow ? "first":"once"
        case 2: return isRow ? "second":"twice"
        case 3: return isRow ? "third":"thrice"
        case 4: return isRow ? "fourth":"4"
        default: return isRow ? "fifth":"5"
        }
    }
    var result = ""
    var secondResult = ""
    var showedUpCount = 0
    for i in letterArray.indices{
        let childArray = letterArray[i]
       let count = childArray.filter{letter in
            letter == searchLetter
        }.count
        if(count > 0){
            showedUpCount += count
            let extraText = """
\(transformToText(count)) in the \(transformToText(i+1,isRow: true)) row
"""
            if(secondResult.isEmpty){
                secondResult = extraText
            }else{
                secondResult += ", \(extraText)"
            }
        }
    }
    result = "\(searchLetter) showed up \(showedUpCount) times: \(secondResult)"
    return result
}

//print(letterCounter([
//    ["D", "E", "Y", "H", "A", "D"],
//    ["C", "B", "Z", "Y", "J", "K"],
//    ["D", "B", "C", "A", "M", "N"],
//    ["F", "G", "G", "R", "S", "R"],
//    ["V", "X", "H", "A", "S", "S"]
//], "X"))

enum NetworkError: Error {
    case badurl
    case invalidResponse
    case decodingError
}

struct Product: Codable {
    let id: Int?
    let title:String
    let price: Double
    let description: String
    let image: String
    let category: String
}

extension URL {
    static func forProductId(_ id:Int) -> URL? {
       var components = URLComponents()
        components.scheme = "https"
        components.host = "fakestoreapi.com"
        components.path = "/productsss/\(id)"
        
        return components.url
    }
    static var forAllProducts: URL {
        URL(string: "https://fakestoreapi.com/products")!
    }
}

extension Product {
    
    static func byId(_ id:Int) -> Resource<Product> {
        guard let url = URL.forProductId(id) else {
            fatalError("id = \(id) was not found.")
        }
        return Resource(url: url)
    }
    static var all: Resource<[Product]> {
        return Resource(url: URL.forAllProducts)
    }
}

enum HttpMethod {
    case get([URLQueryItem])
    case post(Data?)
    
    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
}

struct Resource<T: Codable> {
    let url: URL
    var method: HttpMethod = .get([])
}
enum ResourceState<Sucess: Codable, Failure:StringProtocol> {
    case failed(Failure)
    case sucess(Sucess)
}

class WebService {
     
    func load<T: Codable>(_ resource: Resource<T>) async throws -> ResourceState<T,String> {
        //load request
        var request = URLRequest(url: resource.url)
        
        print("loading...")
        
        switch resource.method {
        case .post(let data):
            request.httpMethod = resource.method.name
            request.httpBody = data
        case .get(let queryItems):
            var components = URLComponents(url: resource.url, resolvingAgainstBaseURL: false)
            components?.queryItems = queryItems
            guard let url = components?.url else {
                //throw NetworkError.badurl
                return ResourceState.failed("url appears to be broken")
            }
            request = URLRequest(url: url)
        }
        
        //create the URLSession config
        let configuration = URLSessionConfiguration.default
        //add default headers
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        let session = URLSession(configuration: configuration)
        
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200
        else {
           // throw NetworkError.invalidResponse
            var code = response as? HTTPURLResponse
            return ResourceState.failed("you have no internet connection \(code?.statusCode ?? 0)")
        }

        
        guard let result = try? JSONDecoder().decode(T.self, from: data) else {
           // throw NetworkError.decodingError
            return ResourceState.failed("an error occurred while decoding")
        }
        
        return ResourceState.sucess(result)
    }
}
struct Transaction: Codable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
}
enum TransactionType : String {
    case debit = "debit"
    case credit = "credit"
}

extension Transaction {
    static var all: Resource<[Transaction]> {
        return Resource(url: URL(string: "https://designcode.io/data/transactions.json")!)
    }
}

Task {
    let result = try await WebService().load(Product.byId(2))
   // let transactions = try await WebService().load(Transaction.all)
   // print(transactions)
    switch result {
    case ResourceState.sucess(let product):
        print(product)
    case ResourceState.failed(let error):
        print(error)
    }
}

