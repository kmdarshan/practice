//: Playground - noun: a place where people can play

import UIKit

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
    
    func isBSTValid() -> Bool {
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
//bst.inorderDisplay(node)
if(bst.isBSTValid()) {
    print("Valid BST")
} else {
    print("InValid BST")
}

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
