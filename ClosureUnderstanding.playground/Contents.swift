//  Created by krishnendra on 24/04/17.

//: Playground - noun: a place where people can play

// Closure Under in playground
/*

 **************************** Closures  ****************************
 Closures are self-contained blocks of functionality that can be passed around and used in your code.
 Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages
 */


/*
 Closure Expression Syntax
 
 { (parameters) -> return type in
 // Code Statements
 }
 
 */

import UIKit

class ClosureType{
    
    var noParameterNoReturnTypeClosure: () -> () = {
        print("noParameterNoReturnTypeClosure")
    }
    
    var oneParameterAndReturnTypeClosure: (String) -> (String) = { name -> String in
        return ("oneParameterAndReturnTypeClosure \(name)")
    }
    
    // Tuples can also be used as parameter types . In below e.g. (String,String,String) is refer as Tuples --> compound type
    var multiParameterAndReturnTypeClosure: (String,String) -> String = {
        (first,second) -> String in
        return (first + second)
    }
    
    //Tuples can also be used return types.In below e.g. ([Int],[Int]) is refer as Tuples --> compound type
    var oneParameterMultiReturnTypeClosure: ([Int]) -> (even:[Int],odd:[Int]) = {
        numbers -> ([Int],[Int]) in
        
        var evenArr = [Int]()
        var oddArr = [Int]()
        
        for number in numbers{
            number % 2 == 0 ? evenArr.append(number) : oddArr.append(number)
        }
        return (evenArr , oddArr)
    }
    
    
/*
     ***************** Inferring Type *****************
     Swift can infer the types of its parameters and the type of the value it returns.
     Do not need to declare the type of each parameter and it's return type So it can be infer.
*/
    
    // I'm elaborating here using same example as above, using suffix Infer as I
    // As you can see exmples below, is eaisler way to write and understand closure Infer type
    
    var noParameterNoReturnTypeClosure_I = {
        print("noParameterNoReturnTypeClosure Infer type")
    }
    
    var multiParameterAndReturnTypeClosure_I = {
        (first,second) -> String in
        return (first + second)
    }
    
    
    var oneParameterMultiReturnTypeClosure_I = { (numbers:[Int]) -> (even:[Int],odd:[Int]) in
        
        var evenArr = [Int]()
        var oddArr = [Int]()
        
        for number in numbers{
            number % 2 == 0 ? evenArr.append(number) : oddArr.append(number)
        }
        return (evenArr , oddArr)
    }
 
}


let objClosureType = ClosureType()
objClosureType.noParameterNoReturnTypeClosure()

Swift.print(objClosureType.oneParameterAndReturnTypeClosure("return by Closure"))
Swift.print(objClosureType.multiParameterAndReturnTypeClosure("Ramanujan\n","Albert"))

let arrayNumbers = [2,3,4,5,6,7,8,9]
Swift.print(objClosureType.oneParameterMultiReturnTypeClosure(arrayNumbers).even)
Swift.print(objClosureType.oneParameterMultiReturnTypeClosure(arrayNumbers).odd)
Swift.print(objClosureType.oneParameterMultiReturnTypeClosure(arrayNumbers))

objClosureType.noParameterNoReturnTypeClosure_I()
objClosureType.multiParameterAndReturnTypeClosure_I("CV","Raman")
objClosureType.oneParameterMultiReturnTypeClosure_I(arrayNumbers)


/*
 ***************** Shorthand Parameters Names *****************
*/

var meterReading = [90,27,47,48,37,23,87,68]
var shorthandParameter = meterReading.sorted()
var shorthandParameter_ = meterReading.sorted { (i, j) -> Bool in
    return i > j
}

/*
 ***************** Shorthand Argument Names *****************
 $0 refer as first argument , 
 $1 refer as second argument , 
 $2 refer as third argument ... etc
 Also refer as inline closures,
 Swift automatically provides shorthand argument names to inline closures, which can be used to refer to the values of the closure’s arguments by the names $0, $1, $2, and so on.
*/

var shorthandArgument = meterReading.sorted { $0 > $1 }
//The in keyword can also be omitted, because the closure expression is made up entirely of its body
shorthandArgument


/*
 ***************** Capturing Values *****************
*/


func incrementerType(increase value: Int) -> () -> Int // Return type seems to closure 
{
    var amount = 0
    func incrementer() -> Int {
        amount += value
        return amount
    }
    return incrementer
}

/** Analysis of Capturing Values incrementer above .
 incrementer is Nested within incrementerType function.
 
 : The return type of incrementer is () -> Int. i.e. It returns a function
 : Return function type has two things As ---
 1: It takes void / no parameter
 2: It returns INTEGER type
 
*/

let incrementByTen = incrementerType(increase: 10)

incrementByTen()
// returns a value of 10
incrementByTen()
// returns a value of 20
incrementByTen()
// returns a value of 30


// If you create a second incrementerType, it will have its own STORED REFRENCE to a new, separate runningTotal variable:

let incrementBySeven = incrementerType(increase: 7)
incrementBySeven()
// returns a value of 7

// Calling the original incrementerType (incrementByTen) again continues to increment its own runningTotal variable and does not affect the variable captured by incrementBySeven

incrementByTen()
// returns a value of 40

