//
//  PersonalInfoController.swift
//  DeliveryApp
//
//  Created by Oleh Haidar on 26.10.2020.
//

import UIKit

class PersonalInfoViewController: UIViewController, SetTextDelegate {
   

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var listOfFoodButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var designableviewNameLabel: DesignableView!
    @IBOutlet weak var designableviewLastNameLabel: DesignableView!
    @IBOutlet weak var designableviewEmailLabel: DesignableView!
    @IBOutlet weak var designableviewAddressLabel: DesignableView!
    @IBOutlet weak var designableviewPhoneNumberNameLabel: DesignableView!
//    @IBOutlet weak var viewbottom: UIView!
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? SettingsViewController {
            controller.string = nameLabel.text!
            controller.delegate = self
        }
    }
    
    
    func setText(string: String) {
        nameLabel.text = string
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTheme()
    }
   
    func setupTheme() {
        self.view.backgroundColor = Theme.currentTheme.backgroundColor
        nameLabel.textColor = Theme.currentTheme.textColor
        lastNameLabel.textColor = Theme.currentTheme.textColor
        addressLabel.textColor = Theme.currentTheme.textColor
        emailLabel.textColor = Theme.currentTheme.textColor
        phoneNumberLabel.textColor = Theme.currentTheme.textColor
        settingsButton.setTitleColor(Theme.currentTheme.backgroundColor, for: .normal)
        settingsButton.backgroundColor = Theme.currentTheme.textColor
        
        designableviewLastNameLabel.backgroundColor = Theme.currentTheme.backgroundColor
        designableviewNameLabel.backgroundColor = Theme.currentTheme.backgroundColor
        designableviewPhoneNumberNameLabel.backgroundColor = Theme.currentTheme.backgroundColor
        designableviewEmailLabel.backgroundColor = Theme.currentTheme.backgroundColor
        designableviewAddressLabel.backgroundColor = Theme.currentTheme.backgroundColor
//        viewbottom.backgroundColor = Theme.currentTheme.backgroundColor
        
    }

}



