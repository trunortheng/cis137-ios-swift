//: # Assignment 4: Property Wrappers
//: ## Author: Erick Ramos
//: ## Date: September 15, 2026

import UIKit

@propertyWrapper
struct NonEmpty {
    private var value: String

    var wrappedValue: String {
        get {
            value
        }
        set {
            if newValue.isEmpty {
                // If the incoming value is empty, the assignment is rejected and the old value is retained.
                print("Warning! Cannot assign an empty name. Retaining existing value: '\(value)'")
            } else {
                value = newValue
            }
        }
    }
    init(wrappedValue: String) {
        // Checks the initial string so an empty string cannot be set during creation.
        if wrappedValue.isEmpty {
            print("Warning! Cannot assign an empty name. Setting to default value: 'Unknown'")
            self.value = "Unknown"
        } else {
            self.value = wrappedValue
        }
    }
}

struct Student {
    @NonEmpty var firstName: String
    @NonEmpty var lastName: String
}

// Test 1: Creating a student with valid names
print("\nTest to create Student 1 with a first and last name:")
var student1 = Student(firstName: "Erick", lastName: "Ramos")
print("Student 1: \(student1.firstName) \(student1.lastName)")

// Test 2: Attempting to assign an empty string to an existing student
print("\nTest to set Student 1's first name to an empty value:")
student1.firstName = ""
print("Student 1 first name remains: \(student1.firstName)")
print("Student 1: \(student1.firstName) \(student1.lastName)")

// Test 3: Attempting to create a new student with an empty string
print("\nTest to create Student 2 with an empty lastName:")
var student2 = Student(firstName: "Sherri", lastName: "")
print("Student 2: \(student2.firstName) \(student2.lastName)")


/*
 Explanation of code logic
 
 The property wrapper prevents empty strings in two ways:
    1. In init(wrappedValue:): If the user initializes a property with "",
         it replaces it with the default string "Unknown".
    2. In `wrappedValue.set`: If the user tries to reassign a property to ""
         after creation, the setter ignores the new value and retains the
         previous value.

 
 Test Results
 
    1. When assigning student1.firstName = "", the set block intercepted the
      call, detected that newValue.isEmpty was true, printed a warning, and
      did not to update value. student1.firstName remained "Erick".
    2. When creating student2 with an empty lastName: "", the init block
      intercepted the input and assigned the default value "Unknown".
 
 
 Sample Output
 
 Test to set Student 1's first name to an empty value:
 Warning! Cannot assign an empty name. Retaining existing value: 'Erick'
 Student 1 first name remains: Erick
 Student 1: Erick Ramos

 Test to create Student 2 with an empty lastName:
 Warning! Cannot assign an empty name. Setting to default value: 'Unknown'
 Student 2: Sherri Unknown
 */
