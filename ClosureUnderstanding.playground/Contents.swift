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
}


let objClosureType = ClosureType()
objClosureType.noParameterNoReturnTypeClosure()


