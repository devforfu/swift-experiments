struct Stack<T> {
    private var storage: [T] = []
    private var stackPointer: Int = 0

    init(capacity: Int = 10) {
        storage.reserveCapacity(capacity)
    }

    var empty: Bool {
        return stackPointer == 0
    }
}

let stack: Stack<Int> = Stack()
print(stack.empty)
