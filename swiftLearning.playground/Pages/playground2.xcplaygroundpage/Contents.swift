//: [Previous](@previous)

import Foundation
import Combine

var greeting = "Hello, playground"

let oneMillion = 1_000_000

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8,1]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

//print(oddDigits.intersection(evenDigits).sorted())

let minuteIntervals = 5
let minutes = 60

for tickMark in stride(from: 0, to: minutes, by: minuteIntervals) {
    // print(tickMark)
}
for ticks in stride(from: 0, through: minutes, by: minuteIntervals) {
    //print("\(ticks) times")
}
//var times = 0
//repeat{
//    times += 5
//    print(times)
//} while times != 60

let isActive = false
let isNotU = false
enum MyError : Error {
    case NotSure(String)
    
}
func getTitle3() throws -> String {
    if isActive {
        return "Succeed"
    }else if isNotU{
        throw URLError(URLError.badURL)
    } else {
        throw MyError.NotSure("Are you mad or something")
    }
}
/*
 //do {
 //    let manager = try getTitle3()
 //    print(manager)
 //}catch  {
 //
 //}
 
 //switch manager {
 //case .success(let title):
 //    print("\(title)")
 //case .failure(let error):
 //    print(error.localizedDescription)
 //}
 */
func handleResponse(data:Data?, response:URLResponse?) -> Data? {
    guard
        let data = data,
        let response = response as? HTTPURLResponse,
        response.statusCode >= 200 && response.statusCode < 300 else {
        return nil
    }
    return data
}
let url = URL(string: "https://picsum.photos/200")

//escaping
func downloadWithEscaping(completionHandler: @escaping(_ data: Data?, _ error: Error?) -> Void){
    URLSession.shared.dataTask(with: url!) { data, response, error in
        let data = handleResponse(data: data, response: response)
        completionHandler(data, error)
    }
    .resume()
}
//combine
var cancellables = Set<AnyCancellable>()
func downloadWithCombine() -> AnyPublisher<Data?, Error>{
    URLSession.shared.dataTaskPublisher(for: url!)
        .map(handleResponse)
        .mapError({$0})
        .eraseToAnyPublisher()
}
//async
func downloadWithAsync() async throws -> Data? {
    do {
        let (data, response) = try await URLSession.shared.data(from: url!)
        return handleResponse(data: data, response: response)
    } catch {
        throw error
    }
    
}

downloadWithEscaping { data, error in
    guard let data else {
        return
    }
    //print("from escaping: \(data)")
}
downloadWithCombine()
    .sink { _ in
        
    } receiveValue: { data in
        if let data = data {
            // print("from combine: \(data)")
        }
    }
    .store(in: &cancellables)

Task {
    let result = try await downloadWithAsync()
    if let result = result {
        
    }
}
//vardial
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set total steps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
struct TimesTable {
    let multiplier:Int
    subscript(index: Int)-> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
//print(threeTimesTable[2])


func makeIncrement(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let inc = makeIncrement(forIncrement: 13)

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping ()-> Void) {
    completionHandlers.append(completionHandler)
}
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}
class SomeClass: SomeProtocol {
    var mustBeSettable: Int = 8
    
    let doesNotNeedToBeSettable: Int = 9
}

struct Question: Decodable {
    let category: String
    let id: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    let question: String
    
    var options: [String] {
        var answers = [String]()
        answers.append(contentsOf: incorrectAnswers)
        answers.append(correctAnswer)
        answers.shuffle()
        return answers
    }
}
enum ChildCategories: String {
    case artLiterature = "arts_and_literature"
    case filmTv = "film_and_tv"
    case foodDrink = "food_and_drink"
    case gK = "general_knowledge"
    case geography
    case history
    case music
    case science
    case societyCulture = "society_and_culture"
    case sportLeisure = "sport_and_leisure"
}

enum Categories: String, CaseIterable {
    case artLiterature = "Arts & Literature"
    case filmTV = "Film & TV"
    case foodDrink = "Food & Drink"
    case GK = "General Knowledge"
    case geography
    case history
    case music
    case science
    case societyCulture
    case sportLeisure = "sport_and_leisure"
}

protocol QuestionAPI {
    func fetchQuestion(category: String) async throws -> [Question]
}



enum ApiError: Error {
    case invalidURL
    case invalidResponseType
    case httpStatusCodeFailed(statusCode: Int, error: Error?)
}
struct QuestionAPiImpl: QuestionAPI {
    private let session = URLSession.shared
    private let baseURL = URL(string: "https://the-trivia-api.com/api/")
    private let jsonDecoder = JSONDecoder()
    
    
//    func fetchCategories() async throws -> Categories {
//        guard let url = URL(string: "categories", relativeTo: baseURL) else { throw ApiError.invalidURL}
//        let (response, statusCode): (Categories, Int) = try await fetch(url: url)
//        print(statusCode)
//        return response
//    }
    
    func fetchQuestion(category: String) async throws -> [Question] {
        guard let url = URL(string: "questions?limit=10&categories=\(category)", relativeTo: baseURL) else { throw ApiError.invalidURL }
        let(data, _): ([Question], Int) = try await fetch(url: url)
         return data
    }
    
    
    private func fetch<D: Decodable>(url: URL) async throws -> (D, Int) {
        let (data, response) = try await session.data(from: url)
        let statusCode = try validateHTTPResponse(response: response)
        return (try jsonDecoder.decode(D.self, from: data), statusCode)
    }
    
    
    private func validateHTTPResponse(response: URLResponse) throws -> Int {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.invalidResponseType
        }
        guard 200...299 ~= httpResponse.statusCode ||
                400...499 ~= httpResponse.statusCode else {
            throw ApiError.httpStatusCodeFailed(statusCode: httpResponse.statusCode, error: nil)
        }
        return httpResponse.statusCode
    }
}
let questionAPI = QuestionAPiImpl()

Task {
//    let fetchedCat = try await quotesAPI.fetchCategories()
//    print(fetchedCat)
    let questions = try await questionAPI.fetchQuestion(category: ChildCategories.music.rawValue)
    print(questions[0].options)
}

