var shoppingList = ["Potatoes", "Eggs", "Onions", "Peppers"]
// var shoppingList : [String] = ["Potatoes", "Eggs", "Onions", "Peppers"]

let luckyNumbers : [Int] = [7, 5, 13]
//var luckyNumbers = [7, 5, 13]

var weights = [77.9, 50.5, 80.0] // Array of Double by default
//var weights : [Float] = [77.9, 50.5, 80.0]

var activeItems = [true, false, false, true, true]
//var activeItems : [Bool] = [true, false, false, true, true]

var arrayEmpty : [String] = []
// var arrayEmpty : [String]

shoppingList.count // 4

shoppingList.append("Apple") // ["Potatoes", "Eggs", "Onions", "Peppers", "Apple"]

shoppingList.count // 5

// shoppingList.append(5) Error
shoppingList.append("5 bottles of beers") // ["Potatoes", "Eggs", "Onions", "Peppers", "Apple", "5 bottles of beers"]

// luckyNumbers.append(3) Error luckyNumbers is declared like const

shoppingList.first // "Potatoes"
shoppingList.last // "5 bottle of beers"

shoppingList[0] // Is equal shopping.first -> output: "Potatoes"
shoppingList[shoppingList.count - 1] // Is equal last -> output: "5 bottles of beers"

shoppingList[5] = "2 bottles of beers" // ["Potatoes", "Eggs", "Onions", "Peppers", "Apple", "2 bottles of beers"]

//shoppingList[32] Error: Index out of range

shoppingList.insert("Coffee", at: 2) // ["Potatoes", "Eggs", "Coffee", "Onions", "Peppers", "Apple", "2 bottles of beers"]

shoppingList.remove(at: 2) // Remove element index 2 -> Coffee - output ["Potatoes", "Eggs", "Coffee", "Onions", "Peppers", "Apple", "2 bottles of beers"]

//shoppingList.remove(at: 100) Error: Index out of range

shoppingList.contains("Coffee") // False

shoppingList.contains("Eggs") // True

shoppingList.index(of: "Eggs") // 1

//shoppingList.append("Salmon")
//shoppingList.append("Coke")
shoppingList += ["Salmon", "Coke"] // Is similar ["Potatoes", "Eggs", "Onions", "Peppers", "Apple", "2 bottles of beers", "Salmon", "Coke"]

//shoppingList[2]
//shoppingList[3]
//shoppingList[4]
shoppingList[2...4] // ["Onions", "Peppers", "Apple"]
