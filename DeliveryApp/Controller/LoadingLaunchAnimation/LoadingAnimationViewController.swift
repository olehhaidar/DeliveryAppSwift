//
//  LaunchScreenViewController.swift
//  DeliveryApp
//
//  Created by Oleh Haidar on 02.12.2020.
//


import UIKit
import Lottie

class LoadingAnimationViewController: UIViewController {

       var animationView: AnimationView?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            animate()
        }
    
    @IBOutlet weak var buttonWelcomeTapped: UIButton!
    
        
        func animate() {
            animationView = .init(name: "animation")
//            animationView?.frame = view.bounds
            animationView?.loopMode = .loop
            animationView?.animationSpeed = 0.85
            view.addSubview(animationView!)
            animationView?.play()
            
            animationView?.translatesAutoresizingMaskIntoConstraints = false
            animationView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            animationView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            animationView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            animationView?.bottomAnchor.constraint(equalTo: buttonWelcomeTapped.topAnchor).isActive = true
            
    }

}
