let age : Int = 27

let name : String = "Marcos Navarro"

var isSunny : Bool = true
isSunny = false

// ----

var isPayDay : Bool = true
var wallet = 20

if isPayDay {
    wallet += 300
}

print(wallet) // 320

isPayDay = false

if isPayDay {
    wallet += 300
}

print(wallet) // 320

let x : Int = 4
let y : Int = 8

x < y // true

if x == y {
    print("x and y are equal")
} else if x < y {
    print("x is less than y")
} else {
    print("x is more big than y")
}

var height : Float = 1.85
var canRide : Bool = false
var isAutorithation : Bool = true

if age >= 18 && height > 1.5 || isAutorithation {
    canRide = true
}

print(canRide)
