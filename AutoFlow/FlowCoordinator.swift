//
//  FlowCoordinator.swift
//  AutoFlow
//
//  Created by Kai-Hong Tseng on 1/25/19.
//  Copyright © 2019 jotshin. All rights reserved.
//

import Foundation

class FlowCoordinator: FlowCoordinable {
    var steps: [FlowStep] = []
    var orders: [Int] = []
    var graph: Graph = Graph(with: [])
    
    // MARK: - TODO - find why orders.first return wrong index
    func getNext(_ from: FlowStep) -> FlowStep? {
        let currentIndex = getIndex(from)
        guard let currentInOrderIndex = orders.firstIndex(where: { currentIndex == $0 }) else {
            return nil
        }
        guard currentInOrderIndex + 1 < orders.count else {
            return nil
        }
        return steps[orders[currentInOrderIndex + 1]]
    }
    
    func add(_ step: FlowStep) {
        steps.append(step)
        graph.adjacentStepList.append([])
    }
    
    func addDepedency(_ from: FlowStep, on step: FlowStep) {
        graph.addStep(from: getIndex(from), to: getIndex(step))
        orders = DFS(with: graph).stack.array
    }
    
    // MARK: helpers
    func getIndex(_ step: FlowStep) -> Int {
        return steps.firstIndex(where: { $0.id() == step.id() })!
    }
}
