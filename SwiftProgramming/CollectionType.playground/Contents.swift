import Foundation

var bts1 = ["진", "슈가", "제이홉", "RM", "지민", "뷔", "정국"]
var bts2 = ["김석진", "민윤기", "정호석", "김남준", "박지민", "김태형", "전정국"]
var bts3: Array<String> = ["진", "슈가", "제이홉", "RM", "지민", "뷔", "정국"]
var bts4: [String] = ["진", "슈가", "제이홉", "RM", "지민", "뷔", "정국"]
var bts5: Array<String> = Array<String>()
bts5.append("슈가")
bts5.append("선우")
var bts6: [String] = [String]()
var bts7 = [String]()
var bts8: [String] = []

let member = bts1[0]
print("첫번째 멤버는 \(member)입니다.")
bts1[3] = "랩몬"

for name in bts1 {
    print(name)
}

let length = bts1.count
print(length)

for index in 0...length-1 {
    print("\(index+1)번째 멤버는 \(bts1[index])입니다.")
}

var bts: [String] = []

bts.append("정국")
print(bts)
bts.insert("슈가", at: 1)
print(bts)
bts.remove(at: 1)
print(bts)
bts.append(contentsOf: ["뷔", "진"])
print(bts)
bts += ["김태형", "전정국"]
print(bts)

let part = bts[0...2]
print(part)
bts[0...2] = ["김석진", "민윤기"]
print(bts)


var set1: Set<String> = Set<String>()
var set2: Set<String> = []
var set3: Set<String> = ["진", "슈가", "제이홉", "RM", "지민"]

print(set3)
var nums = [1, 2, 3]
print(nums)

for name in set3 {
    print(name)
}

let result = set3.insert("진")
print(result)
let result1 = set3.insert("뷔")
print(result1)
let result2 = set3.remove("진")
print(result2 ?? "")
let result3 = set3.remove("진")
print(result3 ?? "")

let tupleValue = ("a", "b", 1, 2.5, true)
tupleValue.0
tupleValue.1
tupleValue.2
tupleValue.3
tupleValue.4

let (a, b, c, d, e) = tupleValue
print(a)
print(b)
print(c)
print(d)
print(e)

var capital = ["KR": "Seoul", "EN": "London", "FR": "Paris"]
var capital1: Dictionary<String, String>
capital = Dictionary<String, String>()

var capital2: Dictionary<String, String>
capital2 = Dictionary()

var capital3: [String: String]
capital3 = [String: String]()

var capital4: [String: String]
capital4 = [:]

print("=====")
var capital5 = ["KR": "Seoul", "EN": "London", "FR": "Paris"]
print(capital5["KR"] ?? "")
capital5["EN"]
capital5["KR"] = "Sejong"
capital5["JP"] = "Tokyo"
print(capital5)
capital5["JP"] = nil
print(capital5["FR"] ?? "")
print(capital5)


print("=====")
var capitals = ["KR": "Seoul", "EN": "London", "FR": "Paris"]
for (country, capital) in capitals {
    print("\(country)'s capital is \(capital)")
}

print("=====")
// 배열 요소로 튜플 사용
var tArray: Array<(String, Int)> = [("a", 1), ("b", 2)]
print(tArray[1])
let t1 = tArray[0]
t1.0
t1.1


// 튜플 요소로 배열 사용
var tuple: ([String], Int) = (["뷔", "RM"], 3)
tuple.0

// 딕셔너리의 Value로 배열 사용
var dic: [String: [String]] = ["name": ["뷔", "RM"]]
print(dic["name"])

// 배열요소로 딕셔너리 사용
var dArray: [[String: String]] = [["a": "b", "c": "d"], ["c": "d"]]
print(dArray[0])
print(dArray[1]["c"])

