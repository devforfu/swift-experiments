import Foundation  /// required for `range(of:)` method

protocol Pattern {
    func match(with string: String) -> Bool
}

struct ExactMatch: Pattern {
    let s: String
    init(_ s: String) { self.s = s }
    func match(with string: String) -> Bool {
        return string.range(of: self.s) != nil
    }
}

func ~=(pattern: Pattern, string: String) -> Bool {
    return pattern.match(with: string)
}

let books = [
    "Advanced Swift",
    "Functional Swift",
    "The Go Programming Language",
    "The Swift Programming Language"]

print("Books on Swift language:")
var counter = 0
for book in books {
    if case ExactMatch("Swift") = book {
        counter += 1
        print("\(counter)) \(book)")
    }
}
