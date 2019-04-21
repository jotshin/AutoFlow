//
//  ViewController.swift
//  AutoFlow
//
//  Created by Kai-Hong Tseng on 1/15/19.
//  Copyright © 2019 jotshin. All rights reserved.
//

import UIKit

let testSquareButtonSize: CGFloat = 50.0

class ViewController: UIViewController, FlowStep {
    var coordinator: FlowCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: view.center.x - testSquareButtonSize / 2, y: view.center.y - testSquareButtonSize / 2, width: testSquareButtonSize, height: testSquareButtonSize))
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("\(coordinator.getIndex(self))", for: .normal)
        view.addSubview(button)
        
        // logic that can be place other place
        let secondVC = SecondViewController()
        secondVC.coordinator = coordinator
        coordinator.add(secondVC)
        
        let insertedVC = InsertedViewController()
        insertedVC.coordinator = coordinator
        coordinator.add(insertedVC)
        
        coordinator.addDepedency(secondVC, on: insertedVC)
        coordinator.addDepedency(insertedVC, on: self)
        
        print(coordinator.orders)
        print(coordinator.steps)
        
        button.addTarget(self, action: #selector(action), for: .touchUpInside)
    }
    
    @objc func action() {
        guard let nextVC = coordinator.getNext(self) else {
            return
        }
        navigationController?.pushViewController(nextVC as! UIViewController, animated: true)
    }
}
