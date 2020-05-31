	var stack : [Node] = []
	var depths : [Int] = []
  
	func isBinaryTreeBalanced(_ treeRoot: Node) -> Bool {

		var depths: [Int] = []  // we short-circuit as soon as we find more than 2

		// nodes will store pairs of a node and the node's depth
		var nodes: [NodeDepthPair] = []
		nodes.append(NodeDepthPair(node: treeRoot, depth: 0))

		while !nodes.isEmpty {

			// pop a node and its depth from the top of our stack
			let nodeDepthPair = nodes.removeLast()
			let node = nodeDepthPair.node
			let depth = nodeDepthPair.depth

			// case: we found a leaf
			if node.lnode == nil && node.rnode == nil {

				// we only care if it's a new depth
				if !depths.contains(depth) {
					depths.append(depth)

					// two ways we might now have an unbalanced tree:
					//   1) more than 2 different leaf depths
					//   2) 2 leaf depths that are more than 1 apart
					if depths.count > 2 ||
						(depths.count == 2 && abs(depths[0] - depths[1]) > 1) {
						return false
					}
				}

			// case: this isn't a leaf - keep stepping down
			} else {
				if let left = node.lnode {
					nodes.append(NodeDepthPair(node: left, depth: depth + 1))
				}
				if let right = node.rnode {
					nodes.append(NodeDepthPair(node: right, depth: depth + 1))
				}
			}
		}

		return true
	}
}

class NodeDepthPair {

    let node: Node
    let depth: Int

    init(node: Node, depth: Int) {
        self.node = node
        self.depth = depth
    }
}
