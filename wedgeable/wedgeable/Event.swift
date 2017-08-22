//
//  Event.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/29/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation

class Event {
    
    //let id: String
    var name: String
    var date: Date
    var aspect: Aspect
    
    init (name: String, date: Date, aspect: Aspect/*, id: String*/) {
        self.name = name
        self.date = date
       // self.id = id
        if aspect != Aspect.profile {
            self.aspect = aspect
        } else { self.aspect = .contacts }
    }
}
