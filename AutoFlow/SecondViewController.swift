//
//  SecondViewController.swift
//  AutoFlow
//
//  Created by Kai-Hong Tseng on 1/25/19.
//  Copyright © 2019 jotshin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, FlowStep {
    var coordinator: FlowCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = UIButton(frame: CGRect(x: view.center.x - testSquareButtonSize / 2, y: view.center.y - testSquareButtonSize / 2, width: testSquareButtonSize, height: testSquareButtonSize))
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("\(coordinator.getIndex(self))", for: .normal)
        view.addSubview(button)
        
    }
}
