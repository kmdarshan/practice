//: Playground - noun: a place where people can play

import UIKit

func reverseStringInPlace(str: String) -> String {
    var newArray = Array(str.characters)
    let maxIndex = newArray.count - 1
    for i in 0...maxIndex {
        if i > maxIndex-1 {
            break
        }
        (newArray[i], newArray[maxIndex-i]) = (newArray[maxIndex-i], newArray[i])
    }
    print(String(newArray))
    return ""
}

reverseStringInPlace(str: "darshan")
/*
func reverseString(str: String) -> String {
    if(str.count > 1)
    {
        var characterArray = [Character]()
        for char in str.characters {
            characterArray.insert(char, at: 0)
        }
        let reversedString = String(characterArray)
        print(reversedString)
        return reversedString
    }
    else
    {
        return str
    }
}

reverseString(str: "darshan")

// Dispatch queues
func printZZ() {
    print("ZZ")
}
func printXX() {
    print("XX")
}

//let dispatchQueue = DispatchQueue(label: "SerialQ")
let dispatchQueue = DispatchQueue(label: "SerialQ", qos: .default, attributes: .concurrent)
dispatchQueue.async {
    for _ in 1...5 {
        //printXX()
    }
}

dispatchQueue.async {
    for _ in 1...5 {
        //printZZ()
    }
}

public struct Vertex <T>{
    var index : Int
    var data : T
}

public struct Edge <T> {
    var from: Vertex <T>
    var to: Vertex <T>
    var weight : Int
}

// this will contain the list of the vertexes
public class AdjacencyList <T> {
    var list : [Edge<T>] = []
    var vertex : Vertex<T>
    init(vertex: Vertex<T>) {
        self.vertex = vertex
    }
    func addEdge(edge: Edge<T>) {
        self.list.append(edge)
    }
    func getCount() -> Int {
        return self.list.count
    }
    func getVertex() -> Vertex<T> {
        return self.vertex
    }
}

class AdjacencyGraph <T> {
    var list : [AdjacencyList<T>] = []
    func addToList(adjacencyList : AdjacencyList<T>) {
        self.list.append(adjacencyList)
    }
    // https://www.geeksforgeeks.org/graph-coloring-set-2-greedy-algorithm/
    func graphColoringProblem() {
        var result = Array(repeating: -1, count: list.count)
        result[0] = 0
        var available = Array(repeating: true, count: list.count)
        for i in 1...list.count-1 {
            var vertexes = self.list[i]
            var totalCount = vertexes.getCount()
            if(vertexes.getCount() > 0) {
                for v in 0...vertexes.getCount()-1 {
                    var adjList = vertexes.getVertex()
                    //print("from: ",i," list ",adjList.index)
                    if(result[i] != -1) {
                        available[result[i]] = false
                    }
                }
            } else {
                if(result[i] != -1) {
                    available[result[i]] = false
                }
            }
            var colorAssignment = 0
            for color in 0...list.count-1 {
                if(available[color]) {
                    colorAssignment = color
                    break;
                }
            }
            //print(colorAssignment)
            result[i] = colorAssignment
            available = Array(repeating: true, count: list.count)
        }
    }
}

//    A ----> B ----> C
//     \            /
//      \       /
//       \  /
//        D
//         |
//         |
//         E

let a = Vertex(index: 1, data: 1)
let b = Vertex(index: 2, data: 22)
let c = Vertex(index: 3, data: 333)
let d = Vertex(index: 4, data: 4444)
let e = Vertex(index: 5, data: 55555)

let a2b = Edge(from: a, to: b, weight: 0)
let a2d = Edge(from: a, to: d, weight: 0)
let b2c = Edge(from: b, to: c, weight: 0)
let d2c = Edge(from: d, to: c, weight: 0)
let d2e = Edge(from: d, to: e, weight: 0)

var adjacencyListA = AdjacencyList(vertex: a)
adjacencyListA.addEdge(edge: a2b)
adjacencyListA.addEdge(edge: a2d)

var adjacencyListB = AdjacencyList(vertex: b)
adjacencyListB.addEdge(edge: b2c)

var adjacencyListC = AdjacencyList(vertex: c)

var adjacencyListD = AdjacencyList(vertex: d)
adjacencyListD.addEdge(edge: d2c)
adjacencyListD.addEdge(edge: d2e)

var adjacencyListE = AdjacencyList(vertex: e)

var adjGraph = AdjacencyGraph<Int> ()
adjGraph.addToList(adjacencyList: adjacencyListA)
adjGraph.addToList(adjacencyList: adjacencyListB)
adjGraph.addToList(adjacencyList: adjacencyListC)
adjGraph.addToList(adjacencyList: adjacencyListD)
adjGraph.addToList(adjacencyList: adjacencyListE)

adjGraph.graphColoringProblem()

protocol FileImport : AnyObject {
    func helloFile();
}

class testFileImport {
    weak var testDelegate : FileImport?
    init() {
        print("testFileimport")
    }
    func callDelegate() {
        self.testDelegate?.helloFile()
    }
}

class testFileImport2 : FileImport {
    init() {
        print("testFileimport2")
    }
    func helloFile() {
        print("testFileImport2 delegate hit")
    }
}

//var test = testFileImport()
//var test2 = testFileImport2()
//test.callDelegate()
//test.testDelegate = test2

protocol BarkType {
    func bark()
}

extension BarkType {
    func bark() {
        print("sniff")
    }
}
class GermanSheperd : BarkType{
    func bark() {
        //print("german bark")
    }
}

class DobberMan : BarkType {
    func bark() {
        print("dobber bark")
    }
}

let obj = GermanSheperd()
obj.bark()

class GetMaximumYearPeopleLiving {
    var array : [Int] = []
    var maxyear = 2018
    func addToArray(birthYear: Int, deathYear: Int) -> Void {
        for year in birthYear...deathYear-1 {
            array[year] = array[year] + 1
        }
    }
    func printMaxYear() -> Int {
        var maxYear : Int = 0
        var maxSum : Int = 0
        for sum in 0...array.count-1 {
            if(array[sum] > maxSum) {
                maxSum = array[sum]
                maxYear = sum
            }
        }
        return maxYear
    }
    init(maxyear: Int) {
        self.maxyear = maxyear
        self.array = Array(repeating: 0, count: self.maxyear)
    }
}

var maxyear = GetMaximumYearPeopleLiving(maxyear: 2011)
maxyear.addToArray(birthYear: 2000, deathYear: 2010)
maxyear.addToArray(birthYear: 1975, deathYear: 2005)
maxyear.addToArray(birthYear: 1975, deathYear: 2003)
maxyear.addToArray(birthYear: 1803, deathYear: 1809)
maxyear.addToArray(birthYear: 1750, deathYear: 1869)
maxyear.addToArray(birthYear: 1840, deathYear: 1935)
maxyear.addToArray(birthYear: 1803, deathYear: 1921)
maxyear.addToArray(birthYear: 1894, deathYear: 1921)
print(maxyear.printMaxYear())

class RotationPoint {
    var words = [
        "engender",
        "karpatka",
        "othellolagkage",
        "ptolemaic",
        "retrograde",
        "supplant",
        "undulate",
        "xenoepist",
        "asymptote",  // <-- rotates here!
        "babka",
        "banoffee",
        ]
    
    func findRotationPointON() {
        var prevChar : Character
        var nextChar : Character
        var rotationIndex : Int = 0
        if(words.count > 0) {
            prevChar = words[0].first!
            for i in 1...words.count-1 {
                nextChar = words[i].first!
                if(prevChar < nextChar) {
                    rotationIndex = i
                }
            }
        }
        //print("Rotation Index ", rotationIndex+1, words[rotationIndex+1])
    }
    
    func findRotationPointLgN() {
        var first = 0
        var last = words.count-1
        while ((last - first) > 1) {
            if (words[first].first! > words[last].first!) {
                var mid = (first + last) / 2
                if(words[mid] > words[last]) {
                    first = mid
                } else {
                    last = mid
                }
            } else {
                print(first)
            }
        }
        var index = -1
        if(words[first].first! <= words[last].first!) {
            index = first
        } else {
            index = last
        }
        //print("final index ", index, words[index])
    }
}

var rotate = RotationPoint()
rotate.findRotationPointON()
rotate.findRotationPointLgN()

struct MakeIterator:IteratorProtocol {
    private var start : Int
    private var end : Int
    private var currentElement : Int
    private let increment : Int = 1

    init(start: Int, end: Int) {
        self.start = start
        self.end = end
        self.currentElement = start - increment
    }
    
    mutating func next() -> Int? {
        if currentElement < self.end {
            currentElement = currentElement + increment
            return currentElement
        }
        return nil
    }
}

struct MakeSequence: Sequence {
    func makeIterator() -> MakeIterator {
        return MakeIterator(start: 0, end: 5)
    }
}

let sequence = MakeSequence()
for number in sequence {
    //print(number)
}

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
    
    func dequeue() -> Character {
        return inputStack.removeLast() as Character
    }
    
    func addElementToQueue(_ newElement : Character) {
        enqueue(character: newElement)
    }
    
    func displayAllElementsInQueue() {
        while !inputStack.isEmpty {
            print(dequeue() as Character)
        }
    }
}

var q = QueueUsingStacks()
q.addElementToQueue("4")
q.addElementToQueue("3")
q.addElementToQueue("2")
q.addElementToQueue("1")
//q.displayAllElementsInQueue()

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

// Singleton
final class TestSingleton {
    static let Shared = TestSingleton()
    private init() {
        
    }
    func testprint() {
        print("testprint")
    }
}

var testSingleton = TestSingleton.Shared
testSingleton.testprint()


func partition( arr : inout [Int], low: Int, high: Int) -> Int {
    var i = low
    var j = high
    var key = arr[i]
    var temp = 0
    while true {
        
        while i < high && key >= arr[i] {
            i = i+1
        }
        while key < arr[j] {
            j=j-1
        }
        if(i<j) {
            temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp
        }
        else
        {
            temp = arr[j]
            arr[j] = arr[low]
            arr[low] = temp
            return j
        }
    }
}

func quicksort(arr : inout [Int], low: Int, high: Int) {
    if(low < high) {
        let pivot = partition(arr: &arr, low: low, high: high)
        quicksort(arr: &arr, low: low, high: pivot-1)
        quicksort(arr: &arr, low: pivot+1, high: high)
    }
}
var randomNumbers1 = [42, 12, 88, 62, 63, 56, 1, 77, 97]
var randomNumbers2 = [97, 12, 20, 45, 91, 62, 2, 15, 31]
quicksort(arr: &randomNumbers1, low: 0, high: randomNumbers1.count-1)
quicksort(arr: &randomNumbers2, low: 0, high: randomNumbers2.count-1)
print(randomNumbers1)
print(randomNumbers2)

func printCommonNumbersIn(arr1: [Int], arr2: [Int]) {
    var i = 0
    var j = 0
    
    while i < arr1.count && j < arr2.count {
        if (arr1[i] < arr2[j]) {
            i = i+1;
        }
        else if (arr2[j] < arr1[i]) {
            j = j+1;
        }
        else /* if arr1[i] == arr2[j] */
        {
            print(arr2[j])
            i = i+1;
            j = j+1;
        }
    }
}
printCommonNumbersIn(arr1: randomNumbers1, arr2: randomNumbers2)

// https://www.geeksforgeeks.org/median-of-two-sorted-arrays/
var a1 = [1, 12, 15, 26, 38]
var a2 = [2, 13, 17, 30, 45]

// combine two sorted arrays
func combineSortedArrays(a: [Int], b: [Int]) {
    var c = Array(repeating: 0, count: a.count + b.count)
    var i = 0
    var cIndex = 0
    let mid = a1.count
    let high = a2.count
    var j = 0
    while i < mid && j < high {
        if(a[i] < b[j]) {
            c[cIndex] = a[i]
            cIndex = cIndex + 1
            i = i + 1
        } else {
            c[cIndex] = b[j]
            cIndex = cIndex + 1
            j = j + 1
        }
    }
    while i<mid {
        c[cIndex] = a[i]
        cIndex = cIndex+1
        i = i+1
    }
    while j<high {
        c[cIndex] = b[j]
        cIndex = cIndex+1
        j = j+1
    }
    print(c)
}

combineSortedArrays(a: a1, b: a2)

// linked list
class LLNode {
    var value = 0
    var next: LLNode?
    init(value: Int) {
        self.value = value
    }
}

func appendNode(headerNode: inout LLNode, value: Int) -> LLNode {
    let tempNode = LLNode(value: value)
    tempNode.next = headerNode
    return tempNode
}

func displayLL(headerNode: LLNode?) {
    var tempnode : LLNode? = headerNode
    while tempnode != nil {
        print(tempnode!.value)
        tempnode = tempnode!.next
    }
}

var headernode = LLNode(value: 100)
headernode = appendNode(headerNode: &headernode, value: 99)
headernode = appendNode(headerNode: &headernode, value: 299)
headernode = appendNode(headerNode: &headernode, value: 199)
var displayNode : LLNode = headernode
displayLL(headerNode: displayNode)


*/
