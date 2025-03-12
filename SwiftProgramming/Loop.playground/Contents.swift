import Foundation

//for row in 1...5 {
//    print("2 x \(row) = \(row * 2)")
//}

for i in 2...9 {
    print("<\(i)단>")
    for j in 1...9 {
        print("\(i) x \(j) = \(i * j)")
    }
    print("==========")
}

let bts = ["진", "뷔", "슈가", "제이홉", "RM", "지민", "정국"]
for name in bts {
    print("안녕, \(name)")
}

for name in bts[2...5] {
    print("봉쥬르, \(name)")
}

var age = 0

while age < 5 {
    print("\(age)세입니다.")
    age += 1
}

print("=================")
var n = 0

repeat {
    n += 1
    print("\(n)")
}

while n < 10


print("==========")
for row in 0...5 {
    if row == 2 {
        break
    }
    print("\(row) was executed!")
}

for row in 0...5 {
    if row == 2 {
        continue
    }
    print("\(row) was executed!")
}

for num in 0...10 {
    if num % 2 == 0 {
        continue
    }
    print("\(num)")
}

