//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//: Swift 中enum 同样拥有构造函数， 和函数方法， enum枚举成员有一个rawValue的属性来描述一个枚举成员的原始值， 什么是原始值， 就是c＋＋ ／ C中指定的值
/*
    enum DAY {
        TUR = 0,
        FRI = 1,
        ....
    }
    其中，TUR叫做枚举成员（值）
         0 叫做对应TUR这个枚举成员的原始值
*/

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    } }
let ace = Rank.Ace
let aceRawValue = ace.rawValue

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    func color()->String {
        switch self {
        case .Clubs, .Spades:
            return "black"
        case .Hearts, .Diamonds:
            return "white"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
hearts.color()







//struct 使用struct 来创建一个结构体， 结构体和类很相似
struct Card {
    var rank: Rank
    var suit: Suit
    func desc() -> String {
        return "the \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)



















