//: Playground - noun: a place where people can play

import UIKit

func reverseWordInPlace(_ str : inout String) -> Array<Character> {
    var characters = Array(str)
    var start = 0
    var ending = characters.count - 1
    while start < ending {
        let char = characters[start]
        characters[start] = characters[ending]
        characters[ending] = char
        start  += 1
        ending -= 1
    }
    return characters
}
var word = "cake pound steal"
//print(reverseWordInPlace(&word))

func reverseWords(_ str : inout String) {
    var reversedString = reverseWordInPlace(&str)
    var fullWord = ""
    var fullSentence = ""
    for str in reversedString {
        if(str != " ") {
            fullWord = fullWord + String(str)
        }
        else {
            if(fullSentence.count > 0) {
                fullSentence = fullSentence + " " + reverseWordInPlace(&fullWord)
            }
            else {
                fullSentence = String(reverseWordInPlace(&fullWord))
            }
            fullWord = ""
        }
    }
    fullSentence = fullSentence + " " + reverseWordInPlace(&fullWord)
    print(fullSentence)
}

var message = "cake pound steal"
reverseWords(&message)
print(message)
