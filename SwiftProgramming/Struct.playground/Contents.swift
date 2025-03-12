import Foundation

struct Person {
    var name: String
    var age: Int
    var gender: String
    var height: Double
}

var person = Person(name: "지혜", age: 28, gender: "여", height: 158)

print(person)
print(person.name)
print(person.age)
print(person.gender)
print(person.height)

struct Person1 {
    var name: String
    var age: Int
    var gender: String
    var height: Double
    
    func info() {
        print("이름: \(name), 나이: \(age), 성별: \(gender), 키: \(height)")
    }
}

let person1 = Person1(name: "지혜", age: 28, gender: "여", height: 158)
person1.info()

var person2 = person1
person2.name = "동그라미"
person1.info()
person2.info()

struct Point {
    var x = 0.0
    var y = 0.0
    var z = 0.0
    
    mutating func moveBy(x deltaX: Double, y deltaY: Double, z deltaZ: Double) {
        x += deltaX
        y += deltaY
        z += deltaZ
    }
    
    mutating func moveTo(toX: Double, toY: Double, toZ: Double) {
        x = toX
        y = toY
        z = toZ
    }
    
    func info() {
        print("The point is now at (\(x), \(y), \(z))")
    }
}

var somePoint = Point(x: 1.0, y: 1.0, z: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0, z: -2.5)
somePoint.moveTo(toX: 1, toY: 2, toZ: 3)
somePoint.info()

struct Student {
    var grade: Int
    var number: Int
    var name: String
    
    mutating func promotion() {
        grade += 1
    }
    
    func info() {
        print("\(grade), \(number), \(name)")
    }
}

var student1 = Student(grade: 1, number: 3, name: "일학년")
var student2 = Student(grade: 2, number: 5, name: "이학년")
student1.promotion()
student1.info()
student2.promotion()
student2.info()
