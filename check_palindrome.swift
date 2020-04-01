func checkPalindrome(_ word: String) -> Bool {
	var unpairedChars : Set<Character> = []
	var secondChar = word[word.index(word.startIndex, offsetBy: 2)]
	var secondLastChar = word[word.index(word.endIndex, offsetBy: -1)]
	//print(secondChar, secondLastChar)
	for i in word.indices {
		var extractThisPosition = word[word.index(i, offsetBy: 0)]
		print(extractThisPosition)
	}
	return true
}

if checkPalindrome("palindrome") {
	print("palindrome")
} else {
	print("not a palindrome")
}
