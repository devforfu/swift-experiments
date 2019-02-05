// Lisp-like list from Advanced Swift chapter 3
enum List<T> {
    case end
    indirect case node(T, next: List<T>)
}

extension List {
    func cons(_ item: T) -> List {
        return .node(item, next: self)
    }
    mutating func push(_ item: T) {
        self = .node(item, next: self)
    }
    mutating func pop() -> T? {
        switch self {
        case .end:
            return nil
        case let .node(x, next):
            self = next
            return x
        }
    }
}

extension List: CustomStringConvertible {
    var description: String {
        func unwrap(_ l: List) -> [T] {
            switch l {
                case .end: return []
                case let .node(x, next): return [x] + unwrap(next)
            }
        }
        let items = unwrap(self).map{ "\($0)" }.joined(separator: ", ")
        return "List<\(T.self)>(\(items))"
    }
}

var list: List<Int> = .end
for i in 1...5 {
    list.push(i)
}
print(list)
let item: Int?
repeat {
    item = list.pop()
    print("Pop: \(item)")
} while item != nil
