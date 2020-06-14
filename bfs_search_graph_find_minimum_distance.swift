import UIKit

enum ShortestPathError: String, Error, CustomStringConvertible {
	case startNodeNotInGraph = "Start node not in graph"
    case endNodeNotInGraph = "End node not in graph"

    var description: String {
        return self.rawValue
    }
}

func findMinimum(_ startNode: String, endNode: String) throws {
		
	let graph = [
		"Min"     : ["William", "Jayden", "Omar"],
		"William" : ["Min", "Noam"],
		"Jayden"  : ["Min", "Amelia", "Ren", "Noam"],
		"Ren"     : ["Jayden", "Omar"],
		"Amelia"  : ["Jayden", "Adam", "Miguel"],
		"Adam"    : ["Amelia", "Miguel", "Sofia", "Lucas"],
		"Miguel"  : ["Amelia", "Adam", "Liam", "Nathan"],
		"Noam"    : ["Nathan", "Jayden", "William"],
		"Omar"    : ["Ren", "Min", "Scott"]
	]
	
	guard graph[startNode] != nil else {
        throw ShortestPathError.startNodeNotInGraph
    }

    guard graph[endNode] != nil else {
        throw ShortestPathError.endNodeNotInGraph
    }

	var nodesToVisit : [String] = []
	var nodesAlreadySeen: Set<String> = []
	nodesToVisit.append(startNode)
	
	// keep track of how we got to each node
    // we'll use this to reconstruct the shortest path at the end
    var howWeReachedNodes: [String: String] = [:]
    howWeReachedNodes[startNode] = ""

	while !nodesToVisit.isEmpty {
		let currentNode = nodesToVisit.removeFirst()
		if currentNode == endNode {
			let path = reconstructPath(howWeReachedNodes: howWeReachedNodes, startNode: startNode, endNode: endNode)
			print(path)
			return
		}
		if graph[currentNode] != nil {
			let adjacentNodes = graph[currentNode]!
			for neighbor in adjacentNodes {
				print("----", neighbor)
				if(!nodesAlreadySeen.contains(neighbor)) {
					nodesAlreadySeen.insert(currentNode)
					nodesToVisit.append(neighbor)
					// keep track of how we got to this node
					 howWeReachedNodes[neighbor] = currentNode
				}
			}
		}
		print("************************ ", nodesToVisit)
	}
}

func reconstructPath(howWeReachedNodes: [String: String],
					 startNode: String, endNode: String) -> [String]  {

    var shortestPath: [String] = []

    // start from the end of the path and work backwards
    var currentNode: String! = endNode

    while currentNode != nil && currentNode.count > 0 {
        shortestPath.append(currentNode)
        currentNode = howWeReachedNodes[currentNode]
    }

	return shortestPath.reversed()
}

try findMinimum("Jayden",endNode: "Adam")

