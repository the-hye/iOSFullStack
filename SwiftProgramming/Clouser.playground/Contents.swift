import Foundation

func sayHello(name: String) {
    print("Hello \(name)")
}

func doSomething(name: String, handler: (String) -> ()) {
    handler(name)
}

doSomething(name: "cocoa", handler: sayHello)
doSomething(name: "coffee") { name in
    print("안녕 \(name)")
}

let names: [String] = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(names)
func backword(s1: String, s2: String) -> Bool {
    return s1 > s2
}

let reverseNames = names.sorted(by: backword(s1:s2:))
print(reverseNames)
let reverseNames1 = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
print(reverseNames1)

func printHello(name: String, handler: (String) -> ()) {
    handler(name)
}

printHello(name: "홍길동", handler: { name in
    print("Hello \(name)")
})

printHello(name: "김길동") { name in
    print("안녕 \(name)")
}


let rnames = names.sorted { n1, n2 in
    n1 > n2
}
print(rnames)

func exec(handler: (String) -> ()) {
    handler("안녕 !")
}

exec { name in
    print(name)
}
print("================")
func captureValue() -> (() -> ()) {
    var count = 3
    print(count)
    
    let closure = {
        count += 1
        print(count)
    }
    return closure
}
print("//////////")
let func1 = captureValue()
print("---------")
func1()
