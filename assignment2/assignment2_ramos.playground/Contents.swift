//: # Assignment 2
//: ## Erick Ramos
//: ## August 31, 2026


//: ## The For-In Loop

var names = [
    "Erick",
    "Hellen",
    "Sherri",
    "Vaishali",
    "Spicy",
    "Sinforiana"
]

//print(names)

var greetings = [
    "Oh, hey there!",
    "What's up?",
    "How's it going?",
    "What's good?",
    "How are you doing?",
]

if names.isEmpty {
    print("Names array is empty")
}
else {
    print("The names list has \(names.count) names\n")
}

for name in names {
    let randomInt = Int.random(in: 0...4)
    print("\(greetings[randomInt]), \(name)!")
}

//: ## The Dictionary

var namesDict = [
    "Erick": 34,
    "Hellen": 25,
    "Sherri": 45,
    "Spicy": 15,
    "Sinforiana": 101,
    "Dylan": 4
]

//print(namesDict)

for (name, age) in namesDict {
    let randomInt = Int.random(in: 0...4)
    print("\(greetings[randomInt]), \(name)! Happy \(age)th birthday!")
}


//: ## Interval Binding

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

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// Prints "There are dozens of moons orbiting Saturn."
