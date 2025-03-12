import Foundation

extension Double {
    var km: Double {
        return self * 1000
    }
    var m: Double {
        return self
    }
    var cm: Double {
        return self / 100
    }
    var mm: Double {
        return self / 1000
    }
    var description: String {
        return "\(self)km는 \(self.km)m, \(self)cm는 \(self.cm)m, \(self)mm는 \(self.mm)m 입니다."
    }
}
2.km
5.5.cm
7.0.description
let distance = 42.0.km + 195.m
print("마라톤의 총 거리는 \(distance)m 입니다.")

extension Int {
    mutating func sqare() {
        self *= self
    }
}
var value = 3
value.sqare()
print(value)

class Car {
    var speed: Int = 0
    
    func speedUp() {
        speed += 10
    }
    
    func speedDown() {
        speed -= 10
    }
}

extension Car {
    func openDoor() {
        print("차 뚜껑이 열렸습니다.")
    }
}

let car = Car()
car.speedUp()
car.openDoor()

