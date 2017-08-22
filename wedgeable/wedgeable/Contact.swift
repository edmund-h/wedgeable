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
    var contactInfo: [FollowUp.Method : String] = [:]
    private var associatedEvents = [TimelineEntry]()
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
    
    init(name: String, metAt: String, info: String, fromEvent: Event?) {
        let now = Date(timeIntervalSinceNow: 0)
        self.placeMet = metAt
        super.init(name: name, date: now, aspect: .contacts)
        if fromEvent != nil {
            let followup = FollowUp(forEvent: self)
            followup.type = discernContactType(info: info)
            self.followUp = followup
        }
    }
    
    /*init? (id: String, dict: [String:Any]) {
        if let name = dict ["name"] as? String,
        let aspectStr = dict ["aspect"] as? String,
        let aspectEnm = Aspect(rawValue: aspectStr),
        let dateStr = dict ["date"] as? String,
        let dateNSO = 
    }*/
    
    
    func getAssociatedEvents()->Timeline {
        let timeline = Timeline(scope: .contacts)
        timeline.append(associatedEvents)
        return timeline
    }
    
    func addAssociatedEvent(_ event: TimelineEntry){
        self.associatedEvents.append(event)
    }
}


