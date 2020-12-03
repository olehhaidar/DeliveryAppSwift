//
//  MenuViewController.swift
//  DeliveryApp
//
//  Created by Oleh Haidar on 21.11.2020.
//

import UIKit

class MenuViewController: UIViewController {

    
    
    @IBOutlet weak var pizzasConstraint: NSLayoutConstraint!
    @IBOutlet weak var burgersConstraint: NSLayoutConstraint!
    @IBOutlet weak var drinksConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pizzasConstraint.constant -= view.bounds.width
        burgersConstraint.constant -= view.bounds.width
        drinksConstraint.constant -= view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.65, delay: 0, options: .curveEaseOut, animations: {
            self.pizzasConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.65, delay: 0.1, options: .curveEaseOut, animations: {
            self.burgersConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.65, delay: 0.2, options: .curveEaseOut, animations: {
            self.drinksConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    

}
