import UIKit
import PlaygroundSupport


//let viewVC = UIViewController()
//viewVC.view = UIView(frame: .init(x: 0, y: 0, width: 736, height: 414))
//viewVC.view.backgroundColor = .white

let alertVC = UIAlertController(title: nil, message: "test", preferredStyle: .alert)
alertVC.view.frame = .init(x: 0, y: 0, width: 736, height: 414)
PlaygroundPage.current.liveView = alertVC.view
