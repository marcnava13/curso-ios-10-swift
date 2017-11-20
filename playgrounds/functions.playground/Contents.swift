import Foundation

func sayGreeting(time: Int, to: String) {
    let date = Date()
    print("\(time): Hi \(to), \(date)")
}

sayGreeting(time: 1, to: "Marcos") // 1: Hi Marcos, 2017-11-20 19:06:10 +0000
sayGreeting(time: 1, to: "Pepe") // 1: Hi Pepe, 2017-11-20 19:06:20 +0000
// ...

func concat(str1: String, str2: String) -> String? {
    return str1 + str2
}

concat(str1: "Hi ", str2: "user") // Hi user

let company = ("AAPL", "Apple Inc", 95.89)
company.0 // AAPL
company.1 // Apple Inc
company.2 // 95.89
let (stockCode, companyName, stockPrice) = ("AAPL", "Apple Inc", 95.89)
stockCode // APPL
companyName // Apple Inc
stockPrice // 95.89

func getProduct(idProduct: Int) -> (id: String, name: String, price: Double) {
    var id = "IPH0", name = "iPhone 5", price = 599.99
    switch idProduct {
    case 1:
        id = "IPH6"
        name = "iPhone 6"
        price = 699.99
    case 2:
        id = "IPDA"
        name = "iPad Air"
        price = 499.90
    case 3:
        id = "IMC2"
        name = "iMac 2017"
        price = 1399
    default:
        break
    }
    
    return (id, name, price)
}

let product = getProduct(idProduct: 2) // (id "IPDA", name "iPad Air", price 499.9)