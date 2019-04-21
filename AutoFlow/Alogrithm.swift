//
//  Graph.swift
//  AutoFlow
//
//  Created by Kai-Hong Tseng on 1/15/19.
//  Copyright © 2019 jotshin. All rights reserved.
//

import Foundation

struct Stack {
    var array: [Int]
    
    init(with array: [Int]) {
        if !array.isEmpty {
            self.array = array
        } else {
            self.array = []
        }
    }
    
    init() {
        array = []
    }
    
    mutating func push(_ step: Int) {
        array.append(step)
    }
    
    mutating func pop() -> Int? {
        guard let last = array.popLast() else {
            return nil
        }
        return last
    }
}

struct Graph {
    var adjacentStepList: [[Int]]
    
    init(with stepCount: Int) {
        adjacentStepList = Array(repeating: [], count: stepCount)
        
    }
    
    init(with steps: [Int]) {
        adjacentStepList = Array(repeating: [], count: steps.count)
    }
    
    mutating func addStep(from: Int, to: Int) {
        adjacentStepList[from].append(to)
    }
    
    public func stepCount() -> Int {
        return adjacentStepList.count
    }
}

extension Graph: CustomStringConvertible {
    public var description: String {
        var string = ""
        for step in 0..<adjacentStepList.count {
            for stepTo in adjacentStepList[step] {
                string += "\(step) - \(stepTo), "
            }
        }
        return string
    }
}

struct DFS {
    var marked: [Bool]
    var stack: Stack
    
    init(with graph: Graph) {
        marked = Array<Bool>(repeating: false, count: graph.stepCount())
        stack = Stack()
        
        for from in 0..<graph.stepCount() {
            if !marked[from] {
                dfs(with: graph, from: from)
            }
        }
    }
    
    func hasPathTo(from step: Int) -> Bool {
        return marked[step]
    }
    
    mutating func dfs(with graph: Graph, from: Int) {
        marked[from] = true
        for step in graph.adjacentStepList[from] {
            if !marked[step] {
                dfs(with: graph, from: step)
            }
        }
        stack.push(from)
    }
}

func testAlgorithm() {
    var graph = Graph(with: [0, 1, 2, 3, 4, 5])
    graph.addStep(from: 4, to: 3)
    graph.addStep(from: 4, to: 5)
    graph.addStep(from: 3, to: 1)
    graph.addStep(from: 2, to: 4)
    
    assert(DFS(with: graph).stack.array == [0, 1, 3, 5, 4, 2], "algorithm result doesn't match expected")
}

