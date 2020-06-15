
import UIKit
import Foundation

/*
Reverse words in an Array 
*/

var message = [ "c", "a", "k", "e", " ","p", "o", "u", "n", "d", " ","s", "t", "e", "a", "l" ]
var reverseWords = { (message : [String]) -> (String) in
	var lastIndex = message.count-1
	var prevIndex = message.count-1
	var wordToBeReturned = String()
	while lastIndex > 0 {
		if message[lastIndex] == " " {
			// extract the word from this index to the previous stored index value
			let word = message[lastIndex...prevIndex]
			wordToBeReturned += word.joined()
			prevIndex = lastIndex
		}
		lastIndex -= 1
	}
	let word = message[lastIndex...prevIndex]
	wordToBeReturned += word.joined()
	return wordToBeReturned
}

print(reverseWords(message))
