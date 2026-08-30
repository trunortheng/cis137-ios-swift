//: # Swift Basics Lesson
//: ## Variables and Constants
//: - `var` declares a variable (mutable).
//: - `let` declares a constant (immutable).
var name = "Alice"
let pi = 3.14159
print(pi)
//: ## Data Types
//: - Common types: Int, Double, String, Bool
let age: Int = 25
let height: Double = 5.7
let isStudent: Bool = true

//: ## Operators
// Arithmetic operators: +, -, *, /
let sum = 10 + 5
let difference = 10 - 5
let product = 10 * 5
let quotient = 10 / 3.0
let remainder = 10 % 3
print(quotient, remainder)

// String interpolation
print("Hello, my name is \(name) and I am \(age) years old.")

// Relational operators: ==, !=, >, <, >=, <=
let isEqual = (10 == 5)
let isGreater = (10 > 5)


// Logical operators: &&, ||, !
let bothTrue = true && true // T && F == F, F && T == F, F && F == F
let eitherTrue = true || false // F || T == T, F || F == F
let notTrue = !true

//: ## Collection Types
//: ## Arrays
//: - Ordered collections of values.
// Arrays store ordered collections.
var shoppingList = ["oranges", "eggs", "milk"]
shoppingList.remove(at: 1)
print(shoppingList)

if shoppingList.isEmpty {
    print("array is empty")
}
else {
    print("My shopping list has \(shoppingList.count) items")
}
shoppingList.append("bread")
shoppingList.insert("rice", at: 0)
print(shoppingList)

let shuffledItems = shoppingList.shuffled()
print(shuffledItems)

let randomItem = shoppingList.randomElement()
print("Random element: \(randomItem)")

shoppingList.remove(at: 2)
shoppingList.removeLast()
print(shoppingList)

//: ## Dictionaries
//: - Key-value pairs.
var capitals = ["France": "Paris", "Japan": "Tokyo"]
capitals["Italy"] = "Rome"
print(capitals)

// Sets store unique, unordered values.

let numbers = [1, 2, 3, 1, 2]
let uniqueNumbers: Set<Int> = Set(numbers)
print(uniqueNumbers)
//: ## Optional Type
// An optional can hold a value or `nil`.

/*: ## Tuples
- Tuples offer a simple way to group values of different types together:
 */
let myTuple = (10, 432.433, "This is a String")
let myString = myTuple.2
let person = (name: "Anna", age: 35)
print(person.age)

// Safe unwrapping using if let:
var optionalString: String? = "Hello" // could be nil (null)

if let unwrappedString = optionalString {
    print("The string is: \(unwrappedString)") // Prints "The string is: Hello"
} else {
    print("The optional is nil.")
}

var optionalName: String? = "Bob"
print(optionalName ?? "No name") // Nil-coalescing operator


//: ## Control Flow
// if-else statement
let score = 85
if score >= 90 {
    print("Grade: A")
} else if score >= 80 {
    print("Grade: B")
} else if score >= 70 {
    print("Grade: C")
} else if score >= 60 {
    print("Grade: D")
} else {
    print("Grade: F")
}

// for-in loop
for item in shoppingList {
    print(item)
}

// while loop
var counter = 0
while counter < 3 {
    print("Counter is \(counter)")
    counter += 1
}

// switch statement
let day = "Monday"
switch day {
case "Monday":
    print("Start of the week")
case "Friday":
    print("End of the week")
default:
    print("Midweek")
}



