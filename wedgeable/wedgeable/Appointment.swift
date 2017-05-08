//
//  Appointment.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/29/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation

class Appointment: Event, NeedsFollowUp, TimelineEntry {
    
    enum OfType: String {
        case meetup = "Meetup", interview = "Interview", informalMeeting = "Informal Meeting", coachMeeting = "Coach Meeting", other = ""
    }
    var address: String
    var completed: Bool = false
    var type: OfType
    var duration: Double
    var userDescription: String?
    weak var associatedApplication: Application?
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
        if let desc = userDescription { return desc }
        var details = ""
        if let contact = associatedContact {
            details += " with \(contact.name)"
        }
        if let appl = associatedApplication {
            details += " of \(appl.company), for \(appl.position)"
        }
        return "\(name)\(details)"
    }//NOTE: Use name for a short description. Use description for a detailed description.
    
    init(address: String, starting: Date, duration: Double, type: OfType) {
        self.type = type
        self.duration = duration
        self.address = address
        super.init(name: "\(type.rawValue) at \(address)", date: starting, aspect: .appointments)
    }
    
    func setCompleted() {
        self.completed = true
        self.followUp = FollowUp(forEvent: self)
    }
    
    func setuserDescription(text: String) {
        self.userDescription = text
        self.name = text
    }
    
}
