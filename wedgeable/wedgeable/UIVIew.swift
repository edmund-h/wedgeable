//
//  UIVIew.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/3/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

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
