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
            print(node!.value)
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
	
	func isBinaryTreeValid(_ node : Node) -> Bool {
		if(node.lnode != nil) {
			if node.value > node.lnode!.value {
				isBinaryTreeValid(node.lnode!)
			} else {
				return true
			}
		}
		if(node.rnode != nil) {
			if node.value < node.rnode!.value {
				isBinaryTreeValid(node.rnode!)
			} else {
				return false
			}
		}
		return true
	}
}
var bst = BST()
var node = bst.insert( nil, value: 50)
node = bst.insert( node, value: 17)
node = bst.insert( node, value: 72)
node = bst.insert( node, value: 12)
node = bst.insert( node, value: 23)
node = bst.insert( node, value: 9)
node = bst.insert( node, value: 14)
node = bst.insert( node, value: 19)
node = bst.insert( node, value: 54)
node = bst.insert( node, value: 76)
node = bst.insert( node, value: 67)

//bst.inorderDisplay(node)
//if(bst.isBSTValid(node: node!)) {
//    print("Valid BST")
//} else {
//    print("InValid BST")
//}

//if bst.isBinaryTreeValid(node!) {
//	print("Valid tree")
//}



