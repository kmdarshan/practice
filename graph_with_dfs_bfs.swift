
import UIKit

enum QError : Error {
	case EmptyQueue
	case FullQueue
}

class Queue<T> {
	var array : [T] = Array<T>()
	func insert(_ element : T) {
		array.append(element)
	}
	
	func remove() throws -> T {
		if array.count > 0 {
			let element = array.remove(at: 0)
			return element
		}
		throw QError.EmptyQueue
	}
	
	func isEmpty() -> Bool {
		return array.isEmpty
	}
	
	func display() {
		print(array)
	}
}

class Graph<T> {
	var numberOfVertices : Int = 0
	var array : [Array<Int>] = Array<Array<Int>>()
	var visited = false
	init(vertices:Int) {
		numberOfVertices = vertices
		for i in 0..<numberOfVertices {
			array.append(Array<Int>())
		}
	}
	
	func addEdge(startEdge:Int, endEdge:Int) {
		array[startEdge].append(endEdge)
	}
	
	func dfsHelper(vertex: Int, visited : inout [Bool]) {
		print(vertex)
		visited[vertex] = true
		var adjacentVertices = array[vertex]
		for adjVertex in adjacentVertices {
			if visited[adjVertex] != true {
				dfsHelper(vertex: adjVertex, visited: &visited)
			}
		}
	}
	
	func dfs(vertex: Int) {
		var visited : [Bool] = []
		for i in 0..<numberOfVertices {
			visited.append(false)
		}
		dfsHelper(vertex: vertex, visited: &visited)
	}
	
	func bfs(vertex: Int) {
		var visited : [Bool] = []
		var q : Queue<Int> = Queue<Int>()
		for i in 0..<numberOfVertices {
			visited.append(false)
		}
		visited[vertex] = true
		q.insert(vertex)
		
		while !q.isEmpty() {
			do {
				var vertex = try q.remove()
				print(vertex)
				var adjacentVertices = array[vertex]
				for vertex in adjacentVertices {
					if !visited[vertex] {
						visited[vertex] = true
						q.insert(vertex)
					}
				}
			} catch {
				print(error)
			}
		}
	}
	
}

var g1 = Graph<Int>(vertices: 4)
g1.addEdge(startEdge: 0, endEdge: 1)
g1.addEdge(startEdge: 0, endEdge: 2)
g1.addEdge(startEdge: 1, endEdge: 2)
g1.addEdge(startEdge: 2, endEdge: 0)
g1.addEdge(startEdge: 2, endEdge: 3)
g1.addEdge(startEdge: 3, endEdge: 3)
g1.dfs(vertex: 2)
print("----")
g1.bfs(vertex: 2)
