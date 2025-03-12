import Foundation

// 상수
let age = 20
let num = 30

// 변수
var age1 = 20
age1 = 19
age1 = 10

var num1 = 0
num1 = 20
num1 = 30

// 데이터형(Type)
var age2: Int = 20
var ratio: Float = 0.123
var ratio1: Double = 0.123
var str: String = "Hello, Swift"
var isOn: Bool = true

// 산술연산자
let a: Int = 5
let b: Int = 3

-a
a + b
a - b
a * b
a / b
a % b

// 비교, 논리연산자
let x: Int = 5
let y: Int = 3
let z: Int = 2

x > y && y > z
x == y && x > y
x == y || x > y

x - y > y - z && y == 0
x + y > z || z > 0

// 대입 연산자
var n: Int = 3
n += 1
n -= 3
n *= 3
n /= 3
n %= 3

var name: String = "석지혜"
print(age)
print("Hello, Swift")
print("나의 나이는 \(age)야")
let str1: String = "나의 이름은 \(name)이고, 나이는 \(age)야"
print(str1)
