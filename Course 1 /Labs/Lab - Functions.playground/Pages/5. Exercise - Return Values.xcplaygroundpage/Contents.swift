/*:
## Exercise - Return Values

 Write a function called `greeting` that takes a `String` argument called name, and returns a `String` that greets the name that was passed into the function. I.e. if you pass in "Sophie" the return value might be "Hi, Sophie! How are you?" Use the function and print the result.
 */
//func greeting (name : String) -> String {
//    var x = "Hi \(name)! How are you?"
//    print(x)
//    return x
//}
//greeting(name: "Daniel")
func greeting (name : String) -> String {
    return "Hi \(name)! How are you?"
}
let sayHello = greeting(name: "Daniel")
print(sayHello)
//:  Write a function that takes two `Int` arguments, and returns an `Int`. The function should multiply the two arguments, add 2, then return the result. Use the function and print the result.
func multiplyNumbers(number1 : Int, number2 : Int) -> Int {
    return number1 * number2
}
let result = multiplyNumbers(number1: 2, number2: 3)
print(result)
/*:
[Previous](@previous)  |  page 5 of 6  |  [Next: App Exercise - Separating Functions](@next)
 */
