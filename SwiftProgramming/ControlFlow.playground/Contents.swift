import Foundation

let adult = 19
let age = 15

if age >= adult {
    print("성인입니다.")
} else {
    print("미성년자입니다.")
}

let gender = "male"

if age < adult {
    if gender == "male" {
        print("미성년 남성이다.")
    } else {
        print("미성년 여성이다.")
    }
}

let browser = "Safari"
let browserName: String

if browser == "IE" {
    browserName = "인터넷 익스플로러"
} else if browser == "Safari" {
    browserName = "사파리"
} else if browser == "Chrome" {
    browserName = "크롬"
} else {
    browserName = "알려지지 않은 브라우저"
}

print("브라우저 명은 \(browserName)입니다.")

let browser2: String = "Chrome"
let browserName2: String

switch browser2 {
case "IE":
    browserName2 = "인터넷 익스플로러"
case "FF":
    browserName2 = "파이어 폭스"
case "Chrome":
    browserName2 = "크롬"
case "Opera":
    browserName2 = "오페라"
case "Safari":
    browserName2 = "사파리"
default:
    browserName2 = "알려지지 않은 브라우저"
}
print("브라우저 명은 \(browserName2)입니다.")
