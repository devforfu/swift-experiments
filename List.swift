// Lisp-like list from Advanced Swift chapter 3
enum List<T> {
    case end
    indirect case node(T, next: List<T>)
}

extension List {
    func cons(_ item: T) -> List {
        return .node(item, next: self)
    }
}

extension List: CustomStringConvertible {
    var description: String {
        
    }
}
