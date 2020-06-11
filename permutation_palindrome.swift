var str = "livci"
var palindromeDictionary : [Character:Int] = [:]
var set : Set<Character> = []
for char in str {
	if set.contains(char) {
		set.remove(char)
	} else {
		set.insert(char)
	}
}
if set.count > 1 {
	print("print not a palindrome")
} else {
	print("palindrome")
}
