//
//  Theme.swift
//  DeliveryApp
//
//  Created by Oleh Haidar on 27.10.2020.
//

import UIKit

protocol ThemeProtocol {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
    var redColor: UIColor { get }
}

class Theme {
    static var currentTheme: ThemeProtocol = Light()
}
