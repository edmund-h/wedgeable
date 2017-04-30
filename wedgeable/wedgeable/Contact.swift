//
//  Contact.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/29/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation

class Contact: Event, NeedsFollowUp {
    var placeMet: String
    var position: String?
    var company: String?
    var email: String?
    var telephone: String?
    var website: URL?
    
    weak var followUp: FollowUp?
    
    var dateMet: Date{
        return self.date
    }
    var description: String {
        var qualifier = ", from \(placeMet)"
        if let position = position, let company = company {
            qualifier = ", \(position) at \(company)"
        }
        return self.name + qualifier
    }
    
    init(name: String, metAt: String, fromEvent: Event?) {
        let now = Date(timeIntervalSinceNow: 0)
        self.placeMet = metAt
        super.init(name: name, date: now, aspect: .contacts)
        if let event = fromEvent {
            self.followUp = FollowUp(forEvent: self)
        }
    }
}
