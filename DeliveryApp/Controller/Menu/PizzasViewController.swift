//
//  PizzasViewController.swift
//  DeliveryApp
//
//  Created by Oleh Haidar on 21.11.2020.
//

import UIKit
//import Alamofire

class PizzasViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image.isUserInteractionEnabled = true
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        swipeRight.direction = .right
        image.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        swipeLeft.direction = .left
        image.addGestureRecognizer(swipeLeft)
        
//        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
//        swipeRight.direction = .up
//        image.addGestureRecognizer(swipeUp)
//
//        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
//        swipeLeft.direction = .down
//        image.addGestureRecognizer(swipeDown)
    }
    
//    @objc func swipeGesture(sender: UISwipeGestureRecognizer?) {
//        if let swipeGesture = sender {
//            switch swipeGesture.direction {
//            case UISwipeGestureRecognizer.Direction.right:
//                image.image = UIImage(named: "0")
//            case UISwipeGestureRecognizer.Direction.left:
//                image.image = UIImage(named: "1")
//            default:
//                break
//            }
//        }
//    }
    
    
    @objc func swipeAction(_ swipeGesture: UISwipeGestureRecognizer) {
        UIView.transition(with: image, duration: 0.3, options: [.transitionFlipFromLeft]) {
            switch swipeGesture.direction {
            case .right:
                self.image.image = UIImage(named: "0")
            case .left:
                self.image.image = UIImage(named: "1")
//            case .up:
//                self.image.image = UIImage(named: "2")
//            case .down:
//                self.image.image = UIImage(named: "3")
            default:
                break
            }
        }

    }
    
}
