//
//  colors.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/29/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit


extension UIColor {
    static let wallGreen = UIColor(red: 197/255, green: 245/255, blue: 144/255, alpha: 1)
    static let slashBlue = UIColor(red: 45/255, green: 156/255, blue: 219/255, alpha: 1)
}

extension UIView {
    func addAndConstrainTo(view: UIView) {
        view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
}
