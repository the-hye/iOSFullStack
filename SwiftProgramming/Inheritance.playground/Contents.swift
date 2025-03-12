import Foundation

class Vehicle {
    var speed: Int = 0
    
    func speedUp() { speed += 10 }
    func speedDown() { speed -= 10 }
    
//    init(speed: Int) {
//        self.speed = speed
//    }
}

class Car: Vehicle {
    var wheelCount: Int
    var seatCount: Int
    
    init(wheelCount: Int, seatCount: Int) {
        self.wheelCount = wheelCount
        self.seatCount = seatCount
    }
}

let car = Car(wheelCount: 4, seatCount: 5)
car.seatCount = 7
print(car.wheelCount)
print(car.seatCount)
print(car.speed)
car.speedUp()
print(car.speed)


class Truck: Car {
    var lodage: Int = 0
    
    func load() { print("load") }
    func unload() { print("unload") }
    init(lodage: Int, wheelCount: Int, seatCount: Int) {
        self.lodage = lodage
        super.init(wheelCount: wheelCount, seatCount: seatCount)
    }
    override func speedUp() {
        speed += 5
    }
}

let truck = Truck(lodage: 30, wheelCount: 8, seatCount: 2)
truck.load()
truck.unload()
truck.speedUp()

