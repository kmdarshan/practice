
```
Given a time (in 24-hour format) with missing digits marked as '?', we want to replace all of the question marks with digits (0-9) in such a way as to obtain a valid time. The earliest possible time is 00:00 and the latest valid time is 23:59.

Write a function:
class Solution { public int solution(String T); }

that, given a string T in the format "HH:MM", returns an integer denoting the number of valid times that can be obtained by replacing the question marks.

Examples:

Given T = "2?:45", the function should return 4. We can obtain four valid times: "20:45", "21:45", "22:45" and "23:45".
Given T = "?9:32", the function should return 2. Valid times are: "09:32" and "19:32".
Given T = "0?:?0", the function should return 60.
Given T = "?4:0?", the function should return 20.
Given T = "29:01", the function should return 0.
Assume that: T consists of exactly five characters; the third one is ':'; the others are digits (0-9) or '?'.

In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.
```


```
for num in [1, 2, 3] {
	print(num) // 1 2 3
}


for num in 1...3 {
	print(num) // 1 2 3
}

for num in 1 {
	print(num)
}

Error “​​For-in loop requires 'Int' to conform to 'Sequence'”

protocol Sequence {
	associatedtype Iterator: IteratorProtocol

	func makeIterator() -> Iterator
}


protocol IteratorProtocol {
	associatedtype Element

	mutating func next() -> Element?
}

var iterator = headNode.makeIterator()
 while let num = iterator.next() {
  print(num)
}



Can you write a linked list type so that it supports for-in loop over its elements?

struct Node<T>: Sequence {
  var value: T
  var next: Node?
  init(_ value: T) {
    self.value = value
    self.next = nil
  }
  var linkedList: LinkedList?
  func makeIterator() -> LinkedList {
    linkedList = LinkedList(self)
    return linkedList
  }
}

class LinkedList<T>: IteratorProtocol {
 
  var currentNode: Node?
  func next() -> T? {
    var tempNode = currentNode
    currentNode = tempNode.next
    return tempNode?.value
  }
}

var node1 = Node<Int>(1)
var node2 = Node<Int>(2)
var node3 = Node<Int>(3)
node1.next = node2
node2.next = node3

for val in node1 {
  print(val)
}

struct Node<T> {
let value: T
let next: Node<T>? // Error: Value type 'Node<T>' cannot have a stored property that recursively contains it
}
```
