//
//  Protocols.swift
//  AutoFlow
//
//  Created by Kai-Hong Tseng on 1/23/19.
//  Copyright © 2019 jotshin. All rights reserved.
//

import Foundation

protocol FlowCoordinable {
    var steps: [FlowStep] { get set }
    var orders: [Int] { get set }
    func getNext(_ from: FlowStep) -> FlowStep?
    func add(_ step: FlowStep) // do dfs and path here
    func addDepedency(_ from: FlowStep, on step: FlowStep)
}

protocol FlowStep {
    var coordinator: FlowCoordinator! { get set }
}

extension FlowStep {
    func id() -> String {
        return "\(type(of: self))"
    }
}


