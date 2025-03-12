import Foundation

enum Direction {
    case north
    case east
    case south
    case west
}

var directionToHead = Direction.north
print(directionToHead)

directionToHead = .east

var directionToHead1 = Direction.east
var directionToHead2: Direction = .east

switch directionToHead {
case .north: print("북쪽")
case .south: print("남쪽")
case .east: print("동쪽")
case .west: print("서쪽")
}

enum HTTPCode: Int {
    case OK = 200
    case NOT_MODIFY = 304
    case INCORRECT_PAGE = 404
    case SERVER_ERROR = 500
}

print(HTTPCode.OK)
print(HTTPCode.OK.rawValue)

enum Rank: Int {
    case one = 1
    case two, three, four, five
}
print(Rank.four.rawValue)

enum Direction1: Int {
    case north = 1
    case south
    case east
    case west
    var value: String {
        return "방향 코드: \(rawValue)"
    }
    func getDescription() -> String {
        switch self {
        case .north: return "북쪽: \(rawValue)"
        case .south: return "남쪽: \(rawValue)"
        case .east: return "동쪽: \(rawValue)"
        case .west: return "서쪽: \(rawValue)"
        }
    }
}

var direction = Direction1.north
var dir: Direction1 = .south
print(direction.value)
print(direction.getDescription())
