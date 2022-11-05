//: Playground - noun: a place where people can play

import UIKit
//无参数 有返回值 
func sayHelloWorld() -> String {
    return "hello, world"
}
//有参数 无返回值
func sayGoodbye(personName: String) {
    print("Goodbye, \(personName)!")
}
sayGoodbye(personName: "Dave")

//单参数  有返回值 函数
func sayHello(personName: String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}
sayHello(personName: "shaozj")

// 多参数 有返回值 函数
func halfOpenRangeLength(start: Int, end: Int) -> Int {
    return end - start
}
print(halfOpenRangeLength(start: 4, end: 2))

//可变参数（传多参数）有返回值
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print(arithmeticMean(numbers: 12,12,43,56))

//多返回值函数
func count(string1: String) -> (vowels: Int, consonants: Int, others: Int) {
    var vowels = 0, consonants = 0, others = 0
    for character in string1.characters {
        //String(character) 强制转化为String
        switch String(character).lowercased() {
        case "a", "e", "i", "o", "u":
            vowels += 1
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            consonants += 1
        default:
            others += 1
        }
    }
    return (vowels, consonants, others)
}
print(count(string1: "shjaklbelbjdalbe"))



//参数的标注
 func containsCharacter(string: String, characterToFind: Character) -> Bool {
    for character in string.characters {
        if character == characterToFind { return true }
    }
    return false
}



//定义一个基本函数
func add(a :Int,b: Int)-> Int{
    return a + b
}
func sub (m : Int, n : Int) -> Int{
    return abs(m - n)
}

//定义一个函数类型的变量
var calFunction:(Int,Int) -> Int = add
print(calFunction(2, 2))

//函数作为 函数的参数
func calFunctionNew(a : Int,b : Int,op: (Int,Int)-> Int) -> Int{
    return op(a ,b)
}
print(calFunctionNew(a: 3, b: 4, op: sub))



//函数作为函数的返回值
func maxfunction(x: Int,y: Int) -> Int{
    return x > y ? x : y
}
func minfunction(j: Int,k :Int) -> Int{
    return j < k ? j : k
}

func chooseFunction(getMax:Bool) -> (Int,Int)-> Int{
    return getMax ? maxfunction : minfunction
}
let myFunction :(Int,Int) -> Int = chooseFunction(getMax: true)

print(myFunction (43, 23))







