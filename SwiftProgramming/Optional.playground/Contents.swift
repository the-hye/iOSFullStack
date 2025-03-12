import Foundation

var index: Int
index = 3
print(index)

var index1: Int = Int() // 리터럴
print(index1)

var index2 = Int(3)
print(index2)

//var index4: Int = nil
var index5 = Int("3")
print(index5)
var index6 = Int("swift")
print(index6)


// 강제 언래핑
var aptStr1: String? = "swift"
print(aptStr1)
print(aptStr1!)

var capital5 = ["KR": "Seoul", "EN": "London", "FR": "Paris"]
print(capital5["KR"])
print(capital5["kr"])

var krCapital = capital5["KR"]!
//var krCapital1: String = capital5["kr"]!

print("====================")
var temp2 : Int? = 123

if temp2 != nil {
    print("반환된 값은 \(temp2!)입니다.")
} else {
    print("반환에 실패하였습니다.")
}

if let value = temp2 {
    print("변환된 값은 \(value)입니다.")
}

var idol: String? = "BTS"
if let val = idol {
    print("반환된 값은 \(val) 입니다.")
}

func optTest(idol: String?) {
    guard let val = idol else {
        print("idol은 없습니다.")
        return
    }
    print(val)
}
