//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//: 不同的编码会导致多语言的支持变得困难， 所以后来国际上产生了unicode编码来表述几乎所有的字符统一一套编码
/*:
泊：
+ gbk       - 0xB2B4
+ big5      - 0xAA97
+ GB2312    - 0xB2B03
+ JIS X     - ox4777
*/

//: ###string init
let emptystring = ""
let emptystring1 = String()

var swift = "swift is fun."
var swift2 : String
swift2 = "swift 2.0 is out!"

//NSString or NSMultableString
// string - value type
let swiftcopy = swift
print(swift)

//copy on write

//: character
let charA:Character = "a"
let charB:Character = "B"

for char in swift.characters {
    print(char)
}

let swiftInchar: [Character] = ["c","o", "p", "y"]
let string1 = String(swiftInchar)

let string2 = swift2 + string1

//: string interpolation

// \(expression) using to insert a var to a string
let PI  = 3.1415
let msg = "PI is equals to \(PI * 100)"
// some code is not supported in this expresion, like \ CR LF

//: ### UNICODE
//Unicode scalar

let blingheart = "\u{1f496}"
blingheart.dynamicType

// extended grapheme Clusters
let ewithacute = "\u{e9}"

//e + `

let msglenght = msg.characters.count

let cafe = "caf" + ewithacute
cafe.characters.count



