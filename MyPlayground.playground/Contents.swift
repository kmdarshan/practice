//: Playground - noun: a place where people can play

import UIKit

class QueueUsingStacks {
    
    var inputStack:[Character] = []
    var outputStack:[Character] = []

    func enqueue(character: Character) -> Void {
        while !inputStack.isEmpty {
            let c = inputStack.removeLast()
            outputStack.append(c)
        }
        inputStack.append(character)
        while !outputStack.isEmpty {
            let c = outputStack.removeLast()
            inputStack.append(c)
        }
    }
    
    func dequeue() -> Character? {
        return inputStack.removeLast()
    }
    
    func addElementToQueue(_ newElement : Character) {
        enqueue(character: newElement)
    }
    
    func displayAllElementsInQueue() {
        while !inputStack.isEmpty {
            print(dequeue() as! Character)
        }
    }
}

var q = QueueUsingStacks()
q.addElementToQueue("4")
q.addElementToQueue("3")
q.addElementToQueue("2")
q.addElementToQueue("1")
q.displayAllElementsInQueue()

class BracketValidator {
    init() {
        
    }
    static func validateUsingStack() -> Bool {
        let input = "darshan"
        let openersToClosers: [Character: Character] = ["(": ")","[": "]","{": "}"]
        let closers = openersToClosers.values
        let openers = openersToClosers.keys

        var openersStack : [Character] = []
        for character in input {
            if openers.contains(character) {
                openersStack.append(character)
            } else if closers.contains(character) {
                if openersStack.isEmpty {
                    return false
                } else {
                    let lastUnclosedOpener = openersStack.removeLast()
                    if openersToClosers[lastUnclosedOpener] != character {
                        return false
                    }
                }
            }
        }
        return openersStack.isEmpty
    }
    
    static func validate(input : String) -> Bool {
        var store = [String : Int]()
        let characters = Array(input)
        for c in characters {
            if let val = store[String(c)] {
                store[String(c)] = val - 1
            } else {
                store[String(c)] = 1
            }
        }
        var result = true
        for (_,v) in store {
            if(v != 0) {
                result = false
            }
            //print(v)
        }
        return result
    }
}

// address validation error is happening here
//if(BracketValidator.validateUsingStack()) {
//    print("true")
//} else {
//    print("false")
//}

public indirect enum BinaryTree<T> {
    case node(BinaryTree<T>, T, BinaryTree<T>)
    case empty
}

let root = BinaryTree.node(.empty, 10, .empty)

class Node {
    var value : Int
    var lnode : Node? = nil
    var rnode : Node? = nil
    
    init(_ value: Int) {
        self.value = value
    }
    
}

class BST {
    func insert(_ node : Node?, value: Int) -> Node? {
        if node == nil {
            return Node(value)
        }
        if(value < node!.value) {
            node?.lnode = insert(node?.lnode, value: value)
        } else if(value > node!.value) {
            node?.rnode = insert(node?.rnode, value: value)
        }
        return node
    }
    
    func inorderDisplay(_ node : Node?) {
        if node != nil {
            inorderDisplay(node?.lnode)
            //print(node!.value)
            inorderDisplay(node?.rnode)
        }
    }
    
    static var elements: [Int] = []
    
    func isTreeValid(_ node : Node?, values : [Int]) {
        if node != nil {
            isTreeValid(node?.lnode, values: BST.elements)
            BST.elements.append(node!.value)
            print(node!.value)
            isTreeValid(node?.rnode, values: BST.elements)
        }
    }
    
    func isBSTValid(node : Node) -> Bool {
        bst.isTreeValid(node, values: BST.elements)
        for i in BST.elements {
            if(i+1 < BST.elements.count) {
                if BST.elements[i] > BST.elements[i+1] {
                    return false
                }
            }
        }
        return true
    }
}

var bst = BST()
var node = bst.insert( nil, value: 50)
node = bst.insert( node, value: 30)
node = bst.insert( node, value: 20)
node = bst.insert( node, value: 40)
node = bst.insert( node, value: 70)
node = bst.insert( node, value: 60)
node = bst.insert( node, value: 80)
bst.inorderDisplay(node)
//if(bst.isBSTValid(node: node!)) {
//    print("Valid BST")
//} else {
//    print("InValid BST")
//}

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
    let reversedString = reverseWordInPlace(&str)
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
    //print(fullSentence)
}

var message = "cake pound steal"
//reverseWords(&message)
//print(message)
