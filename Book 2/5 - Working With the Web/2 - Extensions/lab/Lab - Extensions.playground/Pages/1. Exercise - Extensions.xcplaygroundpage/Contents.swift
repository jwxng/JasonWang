/*:
 ## Exercise - Extensions
 
 Define an extension to `Character` that includes a function `isVowel()`. The function returns `true` if the character is a vowel (a,e,i,o,u), and `false` otherwise. Be sure to properly handle uppercase and lowercase characters.
 */
extension Character {
    func isVowel() -> Bool {
        if self == "a" || self == "e" || self == "i" || self == "o" || self == "u" {
            return true
        } else {
            return false
        }
    }
}
/*:
 Create two `Character` constants, `myVowel` and `myConsonant`, and set them to a vowel and a consonant, respectively. Use the `isVowel()` methods on each constant to determine whether or not it's a vowel.
 */
let myVowel: Character = "e"
let myConsonant: Character = "y"
print(myVowel.isVowel())
print(myConsonant.isVowel())
/*:
 Create a `Rectangle` struct with two variable properties, `length` and `width`, both of type `Double`. Below the definition, write an extension to `Rectangle` that includes a function, `half()`. This function returns a new `Rectangle` instance with half the length and half the width of the original rectangle.
 */
struct Rectangle {
    var length: Double
    var width: Double
}

extension Rectangle {
    func half(rectangle: Rectangle) -> Rectangle {
        var length = rectangle.length / 2
        var width = rectangle.width / 2
        return Rectangle(length: length, width: width)
    }
    
    mutating func halved() -> Rectangle {
        return self.half(rectangle: self)
    }
}
/*:
 Within the existing `Rectangle` extensions, add a new mutating function, `halved()`, which updates the original rectangle to have half the length and half the width. Use the `half()` function as part of the implementation for `halved()`.
 */

/*:
 Create a variable `Rectangle` called `myRectangle`, and set its length to 10 and its width to 5. Create a second instance, `mySmallerRectangle`, that's the result of calling `half()` on `myRectangle`. Then update the values of `myRectangle` by calling `halved()` on itself. Print each of the instances.
 */
var myRectangle = Rectangle(length: 10, width: 5)
var mySmallerRectangle = myRectangle.half(rectangle: myRectangle)
myRectangle = myRectangle.halved()
print(myRectangle)
print(mySmallerRectangle)
//: page 1 of 2  |  [Next: App Exercise - Workout Extensions](@next)
