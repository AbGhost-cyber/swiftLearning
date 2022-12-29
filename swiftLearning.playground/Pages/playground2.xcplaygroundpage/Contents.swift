//: [Previous](@previous)

import Foundation

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
var times = 0
repeat{
    times += 5
    print(times)
} while times != 60
