let strings = ["1", "2", "three"]

let maybeIntegers = strings.map { Int($0) }

print("Not nil items:")
for case let item? in maybeIntegers {
    print(item)
}

print("Nil items:")
for case nil in maybeIntegers {
    print("nil")
}
