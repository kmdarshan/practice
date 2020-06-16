import UIKit

class BinaryTreeNode {

    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?

    init(_ value: Int) {
        self.value = value
    }

    @discardableResult
    func insert(leftValue: Int) -> BinaryTreeNode {
        left = BinaryTreeNode(leftValue)
        return left!
    }

    @discardableResult
    func insert(rightValue: Int) -> BinaryTreeNode {
        right = BinaryTreeNode(rightValue)
        return right!
    }
}

enum BinaryTreeSearchError: Error, CustomStringConvertible {
    case lessThanTwoNodes

    var description: String {
        return "Tree must have at least 2 nodes"
    }
}

func findLargestInTree(startingFrom node:BinaryTreeNode) -> Int {
	if node.right != nil {
		return findLargestInTree(startingFrom: node.right!)
	}
	return node.value
}

func findSecondLargestValue(startingFrom node:BinaryTreeNode) throws -> Int {
	if node.left == nil && node.right == nil {
		throw BinaryTreeSearchError.lessThanTwoNodes
	}
	var current = node
	while true {
		
		// case: current is largest and has a left subtree
        // 2nd largest is the largest in that subtree
        if let left = current.left {
            if current.right == nil {
                return findLargestInTree(startingFrom: left)
            }
        }
		
		// where the right node, doesn't have any children
		if let right = current.right {
            if right.left == nil &&
                right.right == nil {
                return current.value
            }
            current = right
        }
	}
}

// bonus implementation
func _findSecondLargestValue(startingFrom node: BinaryTreeNode) throws -> Int {
	if node.left == nil && node.right == nil {
        throw BinaryTreeSearchError.lessThanTwoNodes
    }
	var stack:[BinaryTreeNode] = [BinaryTreeNode]()
	var largestItemValue = node.value
	var secondLargestItemValue = 0
	stack.append(node)
	while !stack.isEmpty {
		let top = stack.removeFirst()
		if top.value > secondLargestItemValue && top.value < largestItemValue {
			secondLargestItemValue = top.value
		}
		if top.value > largestItemValue && largestItemValue > secondLargestItemValue {
			secondLargestItemValue = largestItemValue
			largestItemValue = top.value
		}
		if top.left != nil {
			stack.append(top.left!)
		}
		if top.right != nil {
			stack.append(top.right!)
		}
		print(top.value, secondLargestItemValue, largestItemValue)
	}
    return secondLargestItemValue
}


let root = BinaryTreeNode(50)
let left = root.insert(leftValue: 30)
left.insert(leftValue: 10)
left.insert(rightValue: 40)
let right = root.insert(rightValue: 70)
right.insert(leftValue: 60)
right.insert(rightValue: 80)

let actual = try? findSecondLargestValue(startingFrom: root)
print(actual!)
let expected = 70


/*
let root = BinaryTreeNode(50)
let left = root.insert(leftValue: 30)
left.insert(leftValue: 10)
left.insert(rightValue: 40)
let right = root.insert(rightValue: 70)
right.insert(leftValue: 60)

let actual = try? findSecondLargestValue(startingFrom: root)
let expected = 60*/
