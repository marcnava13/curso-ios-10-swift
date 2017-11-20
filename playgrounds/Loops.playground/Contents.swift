print("======= FOR LOOP ========")

for var i in 0...10 { // 0 - 10
    print("value: \(i*i)")
}

for var i in 0..<10 { // 0 - 9
    print("value: \(i*i)")
    if i == 4 {
        break
    }
}

for var i in (0..<10).reversed() { // 9 - 0
    print("value: \(i*i)")
}

print("======= WHILE LOOP ========")

var i = 0
while i<10 {
    print("value \(i)")
    i+=1
}

i = 0
var found = false
while !found {
    i+=1
    if i == 5 {
        found = true
        print("The number was found")
    }
}

var names = ["Iroman", "Superman", "Batman", "Thor"]
for i in 0..<names.count {
    print(names[i])
}

for value in names {
    print(value)
}

for (index, value) in names.enumerated() {
    print("Position \(index) -> \(value)")
}

print ("==========================")

var ingredients = [
    "Sausage": 0.25,
    "Onions": 0.10,
    "Tuna": 0.35,
    "Cheese": 0.60,
]

for (key, value) in ingredients {
    print("Ingredient: \(key) - Price \(value) €")
}

for key in ingredients.keys {
    print("Ingredient: \(key) - Price \(ingredients[key]!) €")
}

for value in ingredients.values {
    print("Ingredient: \(value) €")
}





