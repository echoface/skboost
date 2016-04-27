//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
//: swift中在基础运算符上基本一致，
//: Swift 也提供恒等 === 和不恒等 !== 这两个比较符来判断两个对象是否引用同一个对象实例


//: 在swift中同样提供了 空合运算符(Nil Coalescing Operator) a ?? b
//: a ?? b 对可选类型a进行空判断。 如果 包含一个值就进行解封,否则就返回一个默认值

//: a ?? b  <===>  a != nil ? a! : b


let defaultColorName = "red"
var userDefinedColorName: String? //默认值为 nil
var colorNameToUse = userDefinedColorName ?? defaultColorName

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName



//: 区间运算符
//:闭区间运算符( a...b ) include a and b
//:半开区间运算符 ( a..<b ) include a but b

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第 \(i + 1) 个人叫 \(names[i])")
}



//: Swift 逻辑操作符 && 和 || 是左结合的,这意味着拥有多元逻辑操作符的复合表达式优先计算最左边的 子表达式。 也就是说 像 a && b || c || d 表达式是从左到右判断的 等价于 （a && b) || c || d


//: string 在swift中是值变量， 什么叫值变量， 就是把他当做一个值， 在赋值操作的时候会对它进行拷贝， 那大字符串岂不是很低效？ swift 中说了； 有个写时复制的东东， 保证其高效， 你尽管用就ok了....

let name: String = "gonghuan"
/* this will give a string, because string does not conform to protocol sequencetype
for ch in name {
    print("\(ch)")
}*/

for ch in name.characters {
    print(ch)
    print("\(ch)")
}
 name.characters.count

for ch in name.utf8 {
    print(ch, terminator: " ")
}
print("\n")
for ch in name.utf16 {
    print(ch, terminator: " ")
}

class Holder  {
    var x = 0
}

var n = 1
var n2 = n++
n
//: 下面的代码要小心， 如果h 为 nil的话，不仅x 不会被赋值， n也不会有++ 的操作
var h: Holder? = nil
h?.x = n++
n

enum Grain {
    case Wheat, Corn
}

struct CornmealPizza {
    func setCrustGrain(inout grain: Grain)  {
        grain = .Corn
    }
}
var shoppingList = ["Eggs", "Milk", "bug", "cup", "drink", "code"]
shoppingList[2...4] = ["apple", "orange"]
shoppingList
shoppingList.insert("bug", atIndex: 0)
shoppingList.removeAtIndex(0)
for it in shoppingList {
    print(it, terminator: " ")
}


//: set 中存放的数据是互斥的， 一个数据只有一个。集合中存放的东西必须是可哈希的数据， 也就是说里面存放的东西必须有个方法来计算它的hash值， 从这个很好判断， set内部的实现， 是通过hash表来维护数据的
//: swift 中基本类型都是可hash化的
//: 声明 
var container:Set<Int> = [0, 2, 4]
var container2 = Set<Int>()
container2 = container
var container3 = container2
container.insert(2)
container.hashValue
container.count
//: clear 清空
container2
container2 = []
container2
// 如果可以从初始化的数据中推断出set得数据类型， 声明的时候set后可以不指定， 反正在swift中， 凡是可以推断出来没有歧义的地方， 类型都可以不指定
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
var myfavoriteGenres: Set = ["Rock", "Classical", "pure music"]
//： 集合类型提供了数学上得集合运算， 交集（intersect）； 并集（union）； 并集出去交集（exclusiveOr） ； 集合去掉交集（subtract）
favoriteGenres.intersect(myfavoriteGenres)  //: a 集合中选出b集合中也有的元素
favoriteGenres.union(myfavoriteGenres)      //: a 集合与b集合 的汇总
favoriteGenres.subtract(myfavoriteGenres) //: a 集合中去掉 b 集合的元素
favoriteGenres.exclusiveOr(myfavoriteGenres) //: a 集合中去掉b集合有的元素之后加上b集合剩下的元素， 就是ab集合合起来的集合中去掉a b集合中都有的元素



let houseAnimals: Set = ["?", "！"]
let farmAnimals: Set = ["?", "！", "#", "￥", "%"]
let cityAnimals: Set = ["?", "！"]
houseAnimals == cityAnimals    //: True

houseAnimals.isSubsetOf(farmAnimals) // true

houseAnimals.isSupersetOf(farmAnimals) // false

farmAnimals.isSupersetOf(houseAnimals) // true

farmAnimals.isDisjointWith(cityAnimals) // false a b集合中有相同值

cityAnimals.isStrictSupersetOf(houseAnimals) // 因为他们相等，不是严格的父子关系
cityAnimals.isStrictSubsetOf(houseAnimals)

cityAnimals.isStrictSubsetOf(farmAnimals) //true




//: 字典， dictionary 
//: 声明 Dictionary<Key type: Value Type> 简写 [Key type: Value Type]
var namesOfIntegers = [Int: String]() //空字典
var dic1 :Dictionary<Int, String> = [:]
dic1[1] = "one"
dic1 = [2:"two"]
dic1

dic1[1] = "one"
//dic1 += [2:"two"] //: error dictionary not override the +=
dic1

var dic2:Dictionary<Int, String> = [1: "one"]

var dic3 = [1: "one"]

var dic4  = [Int: String]()

dic4[0] = "zero"
dic4[1] = "one"
dic4[2] = "two"
dic4[3] = "three"
dic4[4] = "four"
dic4[5] = "five"
dic4[6] = "six"
dic4[7] = "seven"
dic4[8] = "eight"
dic4[9] = "nine"

for (key, value) in dic4 {
    print("the \(key) match to \(value)", terminator: "\n")
}

























