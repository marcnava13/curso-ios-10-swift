import UIKit

// Increment and Decrement
var age = 28

age += 2

// Loop

for _ in 0..<9 {
    print("Hola")
}

for i in 0..<9 {
    print("\(i): Hola")
}

// Arguments
func addTwoNumbers(x: Int, y: Int) -> Int {
    return x+y;
}

addTwoNumbers(x: 3, y: 2)

// Enums

enum Direction {
    case north
    case south
    case east
    case west
}

Direction.west

// Shorten names

var food = ["Pizza", "Spaguetti", "Salad"]

food.insert("Cheese", at: 1)
food.append("Coffee")

//let red = UIColor.red()

let newColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1) // Color -- literal

// NS : Next Step
import Foundation

let date : Date = Date()

let dateFormatter : DateFormatter

let timer : Timer

let url : NSURL

let string : NSString

// Core Graphics

let point = CGPoint(x: 5, y: 8)

let rect = CGRect(x: 20, y: 20, width: 100, height: 50)

let vector = CGVector(dx: 100.0, dy: 0.0)

let origin = CGPoint.zero

let trans = CGAffineTransform.init(translationX: 20.0, y: 10.0)
let rot = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi))
let scale = CGAffineTransform.init(scaleX: 3.0, y: 0.5)

trans.concatenating(rot).concatenating(scale)

// Strings

let hello = "Hello"
if (hello.contains("ell")) {
    print("Hello")
}

var gretting = "Hello, my name is Mark."
for word in gretting.components(separatedBy: " ") {
    print(word)
}

//"Hello world".substring(from: 5)

gretting.appending(" Hello world")







