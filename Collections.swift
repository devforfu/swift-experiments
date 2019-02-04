enum StackError: String, Error {
    case empty = "Stack is empty"
    case overflow = "Stack overflow!"
}

struct Stack<T> {
    private var capacity: Int
    private var storage: [T] = []
    private var stackPointer: Int = -1

    init(capacity: Int = 10) {
        storage.reserveCapacity(capacity)
        self.capacity = capacity
    }

    var empty: Bool {
        return stackPointer == -1
    }

    mutating func push(_ item: T) throws {
        stackPointer += 1
        guard stackPointer <= capacity - 1 else { throw StackError.overflow }
        if stackPointer >= storage.count {
            storage.append(item)
        } else {
            storage[stackPointer] = item
        }
    }

    mutating func pop() throws -> T {
        stackPointer -= 1
        if empty { throw StackError.empty }
        let item = storage[stackPointer]
        return item
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        let content = storage.map { "\($0)" }.joined(separator: ", ")
        return "Stack<\(T.self)>(\(content))"
    }
}

var stack: Stack<Int> = Stack()
print("Is stack empty? \(stack.empty)")
do {
    for i in 1...11 {
        try stack.push(i)
    }
} catch let error {
    print("Error: \(error)")
}
print("Stack content: \(stack)")
do {
    while !stack.empty {
        let item = try stack.pop()
        print(item)
    }
    _ = try stack.pop()
} catch let error {
    print("Error: \(error)")
}
