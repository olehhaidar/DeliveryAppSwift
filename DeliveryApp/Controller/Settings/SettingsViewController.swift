//
//  SettingsViewController.swift
//  DeliveryApp
//
//  Created by Oleh Haidar on 26.10.2020.
//

import UIKit

protocol SetTextDelegate {
    func setText(string: String)
}

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var switchTheme: UISwitch!
    @IBOutlet weak var themeLabel: UILabel!
    

    
    var string = ""
    var delegate: SetTextDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = string 
        setupTheme()
    }
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        delegate?.setText(string: nameTextField.text!)
//    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.setText(string: nameTextField.text!)
    }
    
    
    func setupTheme() {
        switchTheme.onTintColor = Theme.currentTheme.redColor
        self.view.backgroundColor = Theme.currentTheme.backgroundColor
        self.themeLabel.textColor = Theme.currentTheme.textColor
    }
    
    @IBAction func switchTheme(_ sender: UISwitch) {
        Theme.currentTheme = sender.isOn ? Dark() : Light()
        setupTheme()
    }
    
}
