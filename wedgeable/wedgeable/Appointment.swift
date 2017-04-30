//
//  Appointment.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/29/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation

class Appointment: Event, NeedsFollowUp {
    
    enum OfType: String {
        case meetup = "Meetup", interview = "Interview", informalMeeting = "Informal Meeting", coachMeeting = "Coach Meeting", other = ""
    }
    
    var completed: Bool = false
    var type: OfType
    var duration: Double
    weak var associatedContact: Contact?
    weak var followUp: FollowUp?
    
    var startDate: Date {
        return self.date
    }
    
    var endDate: Date {
        let timeInSeconds = duration * (360)
        return Date(timeInterval: timeInSeconds, since: startDate)
    }
    
    var description: String {
        var withContact = ""
        if let contact = associatedContact {
            withContact = " with \(contact.name)"
        }
        return "\(type.rawValue), \(name)," + withContact
    }
    
    init(name: String, starting: Date, duration: Double, type: OfType) {
        self.type = type
        self.duration = duration
        super.init(name: name, date: starting, aspect: .appointments)
    }
    
    func setCompleted() {
        self.completed = true
        self.followUp = FollowUp(forEvent: self)
    }
    
}
