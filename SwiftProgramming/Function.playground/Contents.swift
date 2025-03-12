import Foundation

func multiple() {
    for i in 2...9 {
        print("<\(i)단>")
        for j in 1...9 {
            print("\(i) x \(j) = \(i * j)")
        }
    }
}

multiple()

func sayHello(name: String) {
    print("Hello, \(name)!")
}
sayHello(name: "지혜")

func multiple1(dan: Int) {
    for i in 1...9 {
        print("\(dan) x \(i) = \(dan * i)")
    }
}

multiple1(dan: 3)

func sayHello2() -> String {
    return "Hello, Swift"
}

var returnValue = sayHello2()
print(returnValue)
print(sayHello2())

func threeTimes(val: Int) -> Int {
    return val * 3
}
var result = threeTimes(val: 5)
print(result)


// exName/exAge : 외부 매개변수 , name/age : 내부 매개변수
func sayHelloWithName(exName name: String, exAge age: Int) -> String {
    return "\(name) is \(age) years old"
}
print(sayHelloWithName(exName: "jeje", exAge: 28))

func sayHi(_ name: String, age: Int) -> String {
    return "\(name) is \(age) years old!!!!"
}
sayHi("짱구", age: 5)

func hello(name: String = "김석진", age: Int, nickName: String = "진") {
    print(name, age, nickName)
}

hello(age: 3)
hello(age: 19, nickName: "똥그라미!")
hello(name: "김석진", age: 19)

func operation(a: Int, b: Int, op: String) -> Int {
    switch op {
    case "+":
        return a + b
    case "-":
        return a - b
    case "*":
        return a * b
    case "/":
        return a / b
    default:
        return 0
    }
}
print(operation(a: 3, b: 5, op: "*"))

// 가변인자
func avg(scores: Int...) -> Double {
    var total = 0
    for score in scores {
        total += score
    }
    return Double(total) / Double(scores.count)
}
print(avg(scores: 10, 20, 30, 40))

// 튜플 반환 함수
func swap(firstNumber n1: Int, secondNumber n2: Int) -> (Int, Int) {
    return (n2, n1)
}

let result1 = swap(firstNumber: 10, secondNumber: 20)
print(result1)

let (first, second) = swap(firstNumber: 3, secondNumber: 60)
print(first)
print(second)

var count = 30

@MainActor func foo() -> Int {
    return count
}
print(foo())

func foo1(count1: Int) -> Int {
    return count1
}
//print(count1)

var count2 = 3
func foo2(count2: Int) -> Int {
    return count2
}

print(foo2(count2: 2))
print(count2)


func calcGrad(score: Int) -> String {
    switch score {
    case 90...100:
        return "A"
    case 80..<90:
        return "B"
    case 70..<80:
        return "C"
    case 60..<70:
        return "D"
    case 50..<60:
        return "E"
    default:
        return "F"
    }
}
print(calcGrad(score: 95))

func divide(dividend: Int, divisor: Int) -> (Int, Int) {
    return (dividend / divisor, dividend % divisor)
}
print(divide(dividend: 15, divisor: 4))

func lotto() -> [Int] {
    var result: Set<Int> = []
    
    while result.count < 6 {
        result.insert(Int(arc4random() % 45 + 1))
    }
    return Array(result).sorted()
}

print(lotto())

func hello1() {
    print("Hello,World!")
}
let func1: () -> () = hello1
func1()

let func11 = hello1
func11()


