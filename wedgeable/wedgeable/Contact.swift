//
//  Contact.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/29/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation

class Contact: Event, NeedsFollowUp, Contactable {
    var placeMet: String
    var position: String?
    var company: String?
    var contactInfo = [String]()
    
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
    
    init(name: String, metAt: String, contactInfo: String, fromEvent: Event?) {
        let now = Date(timeIntervalSinceNow: 0)
        self.placeMet = metAt
        super.init(name: name, date: now, aspect: .contacts)
        if fromEvent != nil {
            let flwup = FollowUp(forEvent: self)
            flwup.type = discernContactType(info: contactInfo)
            self.followUp = flwup
        }
    }
}

protocol Contactable {
    var contactInfo: [String] {get set}
}

extension Contactable {
    func discernContactType(info: String)-> FollowUp.Method {
        if info.contains("@") && info.contains(".") {
            return FollowUp.Method.email
        }
        if discernPhoneNumber(info) {return FollowUp.Method.phone}
        return FollowUp.Method.socialMedia
    }
    
    fileprivate func discernPhoneNumber(_ text: String)-> Bool {
        let substr = text.components(separatedBy: [" ", "-", "(",")"])
        for str in substr {
            guard !str.isEmpty else {continue}
            if Int(str) != nil {continue}
            return false
        }
        return true
    }
}
