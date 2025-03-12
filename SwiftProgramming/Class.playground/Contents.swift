import Foundation

class Person {
    let name = "손흥민"
    var age = 31
}

let person = Person()
person.name
person.age

let age = person.age
person.age = 20

print(person.name)
person

class Vehicle {
    var speed: Int = 0
    
    var mile: Double {
        get { return Double(speed) * 0.6213}
        set(newSpeed) { speed = Int(newSpeed * 1.6)}
    }
    func speedUp() {
        speed += 10
    }
    
    func speedDown() {
        speed -= 10
    }
    
    func speed2Mile() -> Double {
        return Double(speed) * 0.6213
    }
}

var someVehicle: Vehicle = Vehicle()
someVehicle.speedUp()
someVehicle.speedUp()
someVehicle.speedUp()
someVehicle.speedDown()
var mile = someVehicle.speed2Mile()
someVehicle.mile

class Vehicle2 {
    var speed = 0.0
    
    var mile: Double {
        get { return speed * 0.6213 }
        set { speed = newValue * 1.6 }
    }
    func speedUp() { speed += 10 }
    func speedDown() { speed -= 10}
    func speed2Mile() -> Double {
        return speed * 0.62
    }
}

class Vehicle3 {
    var speed = 0.0 {
        willSet(newSpeed) {
            print("현재속도 = \(speed), 새로운속도 = \(newSpeed)")
        }
        didSet(oldSpeed) {
            print("현재속도 = \(speed), 새로운속도 = \(oldSpeed)")
        }
    }
    func speedUp() { speed += 10 }
    func speedDown() { speed -= 10}
    func speed2Mile() -> Double {
        return speed * 0.62
    }
}
var vehicle  = Vehicle3()
vehicle.speed = 100
vehicle.speed = 50

class Square {
    var width: Double = 0.0
    var height: Double = 0.0
    
    var area: Double {
        get { width * height }
        set(newValue) {
            width = sqrt(newValue)
            height = width
        }
    }
    func double() -> (Double, Double) {
        width *= 2
        height *= 2
        return (width, height)
    }
}
var square = Square()
square.height = 10
square.width = 10
print("넓이: \(square.area)")
print(square.double())

class Square1 {
    var width: Double
    var height: Double
    
    init(w: Double, h: Double) {
        width = w
        height = h
    }
    init() {
        width = 10
        height = 10
    }
    var area: Double {
        get { width * height }
        set {
            width = sqrt(newValue)
            height = width
        }
    }
    func double() -> (Double, Double) {
        width = width * 2
        height = width
        return (width, height)
    }
}

let square1 = Square1(w: 20, h: 20)
print(square1.area)
let square2 = Square1()
