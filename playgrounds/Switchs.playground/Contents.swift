let mark : String = "A"

/*
    if mark == "A" {
        print("You mark is A")
    } else if mark == "B" {
        print("You mark is B")
    } else if mark == "C" {
        print("You mark is C")
    } else if mark == "D" {
        print("You mark is D")
    } else if mark == "D" {
        print("You mark is D")
    } else {
        print("No valid")
    }
*/

switch mark {
    case "A":
        print("You mark is A")
    case"B":
        print("You mark is B")
    case "C":
        print("You mark is C")
    case"D":
        print("You mark is D")
    case "F":
        print("You mark is F")
    default:
        print("No valid")
}

let character : String = "a"

switch character {
    case "a", "e", "i", "o", "u":
        print("It's vocal")
    default:
        print("It's consonant")
}

let speed : Int = 90

switch speed {
    case 0...60:
        print("You go very slowly")
    case 61...100:
        print("You go at a cruising speed")
    case 101...120:
        print("Significant speed, be alert")
    case 121...220:
        print("You will be fined")
    default:
        print("Speed not valid")
}
