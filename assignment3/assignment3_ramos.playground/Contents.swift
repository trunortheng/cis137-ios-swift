//: # Assignment 3: Closures and Higher-Order Functions
//: ## Author: Erick Ramos
//: ## Date: September 7, 2026

//: ## Closures

let c2f: (Int) -> Double = { (c: Int) -> Double in
    Double(c) * 9.0 / 5.0 + 32.0
}

let f2c: (Int) -> Double = { (f: Int) -> Double in
    (Double(f) - 32.0) * 5.0 / 9.0
}

let fahrenheit = c2f(25)
print("25°C is \(fahrenheit)°F")

let celsius = f2c(77)
print("77°F is \(celsius)°C")

//: ## Higher Order Functions

func convertTemperature(_ value: Int, using conversion: (Int) -> Double) -> Double {
    conversion(value)
}

let tempInF = convertTemperature(25, using: c2f)  // 25°C to °F
print("25°C = \(tempInF)°F")

let tempInC = convertTemperature(77, using: f2c)  // 77°F to °C
print("77°F = \(tempInC)°C")

//: ## Additional Unit

/*
 Celsius to Kelvin:
 - Formula: K = °C + 273.15
 - Takes `(c: Int)` before `->`, returns `Double` after `->`.
*/
let c2k: (Int) -> Double = { (c: Int) -> Double in
    Double(c) + 273.15
}

/*
 Kelvin to Celsius:
 - Formula: °C = K - 273.15
 - Takes `(k: Int)` before `->`, returns `Double` after `->`.
*/
let k2c: (Int) -> Double = { (k: Int) -> Double in
    Double(k) - 273.15
}

/*
 Fahrenheit to Kelvin:
 - Formula: K = (°F - 32) * 5 / 9 + 273.15
 - Reuses `f2c` directly inside the closure body.
*/
let f2k: (Int) -> Double = { (f: Int) -> Double in
    f2c(f) + 273.15
}

/*
 Kelvin to Fahrenheit:
 - Formula: °F = (K - 273.15) * 9 / 5 + 32
 - Takes `(k: Int)` before `->`, returns `Double` after `->`.
*/
let k2f: (Int) -> Double = { (k: Int) -> Double in
    (Double(k) - 273.15) * 9.0 / 5.0 + 32.0
}

let zeroCToK = convertTemperature(0, using: c2k)
print("0°C = \(zeroCToK) K")

let kelvinToC = convertTemperature(273, using: k2c)
print("273 K = \(kelvinToC) °C")

let fToK = convertTemperature(32, using: f2k)
print("32°F = \(fToK) K")

let kelvinToF = convertTemperature(300, using: k2f)
print("300 K = \(kelvinToF) °F")
