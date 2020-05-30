
	func deleteNode(_ value: Int, node: Node?) -> Node? {
		guard let node = node else {
			return nil
		}
		if node.value > value {
			// go left
			node.lnode = deleteNode(value, node: node.lnode)
		} else if node.value < value {
			// go right
			node.rnode = deleteNode(value, node: node.rnode)
		} else {
			if node.lnode == nil {
				return node.rnode
			} else if node.rnode == nil {
				return node.lnode
			} else {
				print("node")
				// both left and right nodes are present here
				let temp = node
				let newNode = findMinimum(_node: node.rnode!)
				print("node min ",newNode.value)
				newNode.rnode = deleteNode(newNode.value, node: node.rnode)
				newNode.lnode = temp.lnode
				return newNode
			}
		}
		return node
	}
	
	func findMinimum(_node: Node) -> Node {
		var temp = node
		while temp?.lnode != nil {
			temp = temp?.lnode
		}
		return temp!
	}
