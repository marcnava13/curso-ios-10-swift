var shoppingList : [String : String] = ["Potatoes": "I have to buy 1kg of Potatoes", "Eggs": "I need threes eggs"] // ["Eggs": "I need threes eggs to cook", "Potatoes": "I have to buy 1kg of Potatoes"]

shoppingList["Eggs"] // I need threes egss to cook

var luckyNumbers : [ String: Int ] = ["1": 7, "2": 5, "3": 13]

luckyNumbers["1"] // 7

shoppingList.count // 2
luckyNumbers.count // 3

shoppingList["Eggs"] = "I need six eggs more" //  ["Eggs": "I need six eggs more", "Potatoes": "I have to buy 1kg of Potatoes"]

shoppingList["Coffee"] = "I want to take a coffee" //  ["Coffee": "I want to take a coffee", "Eggs": "I need six eggs more", "Potatoes": "I have to buy 1kg of Potatoes"]

var myDict : [Int: Float] = [:] // Declare dictonary empty
// var myDict = [Int: Float]()

let isEmpty = luckyNumbers.isEmpty // false

var myNumber = luckyNumbers["3"] // myNumber = 13

// OPTIONAL BINDING
if let oldLuckyNumbers = luckyNumbers.updateValue(3, forKey: "3") {
    // Update numbers 13 by 3
}

if let oldLuckyNumbers = luckyNumbers.removeValue(forKey: "3") {
    // Remove numbers 13
}



