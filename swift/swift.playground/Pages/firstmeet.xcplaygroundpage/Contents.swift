//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
// int variable
var value = 1

// double var
var dvalue = 22.22

// array set dictionary  --late

// string
var myname = "gonghuan"

// bool
var isfocused = false

// tuple
var me = ("mars", 11, "gonghuan.dev@gmail.com")
me.0
me.1
me.2

var hours = 12


// constant var
let minites = 60
let fireishot = true

//type define
var x:Int32
x = 12
var name:String
name = "xiaoxiaofeng"
print(name)

Int.min
Int.max

Int64.min
Int64.max

UInt.max
UInt.min

let fiftenIndecimal = 12;
let fiftenInHex = 0xc
let fiftenInOctal = 0o17
let fiftenInBinary = 0b1100

//: define a var special the type
var onethirdInFloat: Float = 1/3
var onethirdInDouble: Double = 1/3

print(onethirdInFloat)
print(onethirdInDouble)


var three = 3;
three.dynamicType

var zeroPointForteen = 0.14
zeroPointForteen.dynamicType

var PI = 3.1415
PI = 314e-2
PI.dynamicType
// error here cause swift has a strict type check
/* PI = three + zeroPointForteen */

// here Double(three) just construct a
// temperary Double type variable
PI = Double(three) + zeroPointForteen


