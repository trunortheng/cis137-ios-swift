//: # Assignment 3: Closures and Higher-Order Functions
//: ## Author: Erick Ramos
//: ## Date: September 7, 2026

//: ## Closures

/*
 c2f explanation:
 - let c2f: Stores the closure reference.
 - : (Int) -> Double: This is the type annotation. Takes an Int argument and returns a Double.
 - = { (c: Int) -> Double in: The closure expression body.
     - (c: Int): The parameter list before ->.
     - -> Double: The explicit return type after ->.
     - in: This keyword indicates that the definition of the closure’s parameters and return type has finished, and the body of the closure is about to begin.
 - Double(c) * 9.0 / 5.0 + 32.0: The actual calculation. c must be explicitly cast to Double.
*/

let c2f: (Int) -> Double = { (celsius: Int) -> Double in
    Double(celsius) * 9.0 / 5.0 + 32.0
}



/*
 f2c explanation:
 - Left of =: Variable name f2c typed as (Int) -> Double.
 - Before ->: Parameter declaration (f: Int).
 - After ->: Expected return type Double.
 - Body: Converts f to Double, subtracts 32.0, multiplies by 5.0 / 9.0.
*/

let f2c: (Int) -> Double = { (farenheit: Int) -> Double in
    (Double(farenheit) - 32.0) * 5.0 / 9.0
}



/*
Code to test the closures c2f and f2c.
*/

let fahrenheit = c2f(25)
print("25°C is \(fahrenheit)°F")

let celsius = f2c(77)
print("77°F is \(celsius)°C")



//: ## Higher Order Functions

/*
 convertTemperature explanation:
 - func convertTemperature: Declares a named function.
 - _ value: Int: First parameter. _ suppresses the external argument label.
 - using conversion: (Int) -> Double: Second parameter.
     - using: External argument label for readability.
     - conversion: Internal parameter name used inside the function body.
     - (Int) -> Double: Closure type signature requirement.
 - -> Double: Returns the calculated Double.
*/

func convertTemperature(_ value: Int, using conversion: (Int) -> Double) -> Double {
    conversion(value)
}



/*
Code to test the function convertTemperature.
*/

let tempInF = convertTemperature(25, using: c2f)  // 25°C to °F
print("25°C = \(tempInF)°F")

let tempInC = convertTemperature(77, using: f2c)  // 77°F to °C
print("77°F = \(tempInC)°C")



//: ## Additional Unit

/*
 Celsius to Kelvin:
 - Formula: K = °C + 273.15
 - Takes (c: Int) before ->
 - Returns Double after ->.
*/

let c2k: (Int) -> Double = { (c: Int) -> Double in
    Double(c) + 273.15
}



/*
 Kelvin to Celsius:
 - Formula: °C = K - 273.15
 - Takes (k: Int) before ->
 - Returns Double after ->.
*/

let k2c: (Int) -> Double = { (k: Int) -> Double in
    (Double(k) - 273.15).rounded() + 0.0
}



/*
 Fahrenheit to Kelvin:
 - Formula: K = (°F - 32) * 5 / 9 + 273.15
 - Reuses f2c directly inside the closure body.
*/

let f2k: (Int) -> Double = { (f: Int) -> Double in
    f2c(f) + 273.15
}



/*
 Kelvin to Fahrenheit:
 - Formula: °F = (K - 273.15) * 9 / 5 + 32
 - Takes (k: Int) before ->
 - Returns Double after ->.
*/

let k2f: (Int) -> Double = { (k: Int) -> Double in
    (Double(k) - 273.15) * 9.0 / 5.0 + 32.0
}



/*
Code to test the function kelvin conversion closures.
*/

let zeroCToK = convertTemperature(0, using: c2k)
print("0°C = \(zeroCToK) K")

let kelvinToC = convertTemperature(273, using: k2c)
print("273 K = \(kelvinToC) °C")

let fToK = convertTemperature(32, using: f2k)
print("32°F = \(fToK) K")

let kelvinToF = convertTemperature(300, using: k2f)
print("300 K = \(kelvinToF) °F")
