//
//  Event.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/29/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation

class Event {
    
    let name: String
    var date: Date
    var aspect: Aspect
    
    init (name: String, date: Date, aspect: Aspect) {
        self.name = name
        self.date = date
        if aspect != Aspect.profile {
            self.aspect = aspect
        } else { self.aspect = .contacts }
    }
    
    
}
