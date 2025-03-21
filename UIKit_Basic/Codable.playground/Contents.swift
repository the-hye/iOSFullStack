import Foundation

struct Name: Codable {
    let firstName: String
    let lastName: String
}

struct Car: Codable {
    let model: String
    let brand: String
}

struct Person: Codable {
    let name: Name
    let age: Int
    let cars: [Car]
}
let name = Name(firstName: "손", lastName: "흥민")
let cars = [Car(model: "G80", brand: "Genesis"), Car(model: "Y", brand: "Tesla")]
let person = Person(name: name, age: 34, cars: cars)

if let json = try? JSONEncoder().encode(person),
   let jsonStr = String(data: json, encoding: .utf8) {
    print(jsonStr)
}

struct Person1: Decodable {
    let name: String
    let age: Int
}

let data = """
    {
      "age": 34,
      "cars": [
        {
          "model": "G80",
          "brand": "Genesis"
        },
        {
          "brand": "Tesla",
          "model": "Y"
        }
      ],
      "name": {
        "lastName": "흥민",
        "firstName": "손"
      }
    }
""".data(using: .utf8)
if let person1 = try? JSONDecoder().decode(Person1.self, from: data!) {
    print(person1.name, person1.age)
}

if let person2 = try? JSONDecoder().decode(Person.self, from: data!) {
    print(person2.age, person2.cars.first!, person2.name.firstName, person2.name.lastName)
}

struct Meta: Codable {
    let is_end: Bool
}

struct Document: Codable {
    let authors: [String]
    let title: String
    let publisher: String
    let thumbnail: String
    let url: String
    let price: Int
}

struct Book: Codable {
    let meta: Meta
    let documents: [Document]
}
