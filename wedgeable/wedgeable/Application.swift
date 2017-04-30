//
//  Application.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/29/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation

class Application: Event {
    var company: String
    var position: String
    var postingURL: URL?
    weak var timeline: Timeline
    var dateApplied: Date{
        return self.date
    }
    
    init {
        
    }
}
