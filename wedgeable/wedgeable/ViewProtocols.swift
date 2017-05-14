//
//  View Protocols.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/14/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

protocol InfoView: class {
    var preferredHeight: CGFloat {get}
}

protocol DetailView {
    var preferredHeight: CGFloat? {get}
    func addAndConstrainTo(view: UIView)
    //extended UIView with this f(x) so it automatically conforms
    
    //TODO: because commonInits happen before the event gets assigned, we need to create another f(x) to load the event data into the views. This could even get called inside the Aspect Enum
    //func loadEventData()
}
