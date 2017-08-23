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
    //TODO: Change all of these to event IDs
    var applicationID: String?
    var applDescription: String?
    var contactID: String?
    var contactDescription: String?
    var followUpID: String?
    
    
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
        if let contact = contactDescription {
            details += contact
        }
        if let appl = applDescription {
            details += appl
        }
        return "\(name)\(details)"
    }//NOTE: Use name for a short description. Use description for a detailed description.
    
    init(address: String, starting: Date, duration: Double, type: OfType) {
        self.type = type
        self.duration = duration
        self.address = address
        super.init(name: "\(type.rawValue) at \(address)", date: starting, aspect: .appointments, id: "VOID")
    }
    
    init?(id: String, dict: [String:Any]) {
        if let addrStr = dict ["address"] as? String,
            let typeStr = dict ["type"] as? String,
            let typeEnm = OfType(rawValue: typeStr),
            let dateStr = dict ["starting"] as? String,
            let starting = Date.from(iso8601: dateStr),
            let durStr = dict ["duration"] as? String,
            let durDbl = Double(durStr) {
                self.type = typeEnm
                self.duration = durDbl
                self.address = addrStr
                super.init(name: "\(typeEnm.rawValue) at \(address)", date: starting, aspect: .appointments, id: id)

        } else {
            return nil
        }
    }
    
    func add(contact: Contact){
        self.contactID = contact.id
        self.contactDescription = " with \(contact.name)"
    }
    
    func add(application: Application){
        self.applicationID = application.id
        self.applDescription = " of \(application.company), for \(application.position)"
    }
    
    func setCompleted() {
        self.completed = true
        // TODO: rebuild this
        //self.followUp = FollowUp(forEvent: self)
    }
    
    func setuserDescription(text: String) {
        self.userDescription = text
        self.name = text
    }
    
}
