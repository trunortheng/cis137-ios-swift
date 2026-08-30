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
var ageMessage: String

for (name, age) in namesDict {
    let randomInt = Int.random(in: 0...4)
    
    switch age {
    case 0...17:
        ageMessage = "You are a child"
    case 18...25:
        ageMessage = "You are a young adult"
    case 26...65:
        ageMessage = "You are an adult"
    case 66...:
        ageMessage = "You are a senior"
    default:
        ageMessage = "Your age is unknown"
    }
    
    print("\(greetings[randomInt]), \(name)! Happy \(age)th birthday!")
    print(ageMessage)
}
