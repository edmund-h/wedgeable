//
//  FollowUp.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/29/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation

class FollowUp: Event, TimelineEntry {
    
    var parentEventID: String
    var complete: Bool
    var contactID: String?
    enum Method: String {
        case phone = "Phone", email = "eMail", inPerson = "In Person", socialMedia = "Social Media", mail = "Mail", gift = "Gift", goal = "Goal"
    }
    var method: Method?
    var completionDate: Date?
    
    var hoursRemaining: Double {
        let difference = self.date.timeIntervalSinceNow
        let hours = abs(Double(difference)/(60*60))
        return round(hours/100)*100
    }
    var description: String {
        var needed = "Needed"
        if let method = method { needed = method.rawValue }
        return "\(needed) follow-up on \(name)"
    }
    
    init (forEvent event: Event) {
        self.parentEventID = event.id
        self.complete = false
        let date = event.date.addingTimeInterval(86400) //1 day in seconds
        
        super.init(name: event.name, date: date, aspect: .followups, id: "VOID")
    }
    
    init? (id: String, dict: [String: Any]) {
        if let name = dict["name"] as? String,
            let dateStr = dict["date"] as? String,
            let dateNSO = Date.from(iso8601: dateStr),
            let parentEventID = dict ["parentEventID"] as? String,
            let completeStr = dict ["complete"] as? String,
            let completeBool = Bool(completeStr) {
                self.parentEventID = parentEventID
                self.complete = completeBool
                super.init(name: name, date: dateNSO, aspect: .followups, id: id)
                // optionals
                self.contactID = dict["contactID"] as? String
        } else {
            return nil
        }
        // non string optionals
        if let methodStr = dict ["method"] as? String,
            let methodEnm = FollowUp.Method(rawValue: methodStr){
                self.method = methodEnm
        }
        if let completionStr = dict["completionDate"] as? String,
            let completionDate = Date.from(iso8601: completionStr){
                self.completionDate = completionDate
        }
    }
    
    
    func markCompleted() {
        self.complete = true
        self.completionDate = Date(timeIntervalSinceNow: 0)
    }
}

protocol NeedsFollowUp {
    var followUpID: String? { get set }
}

extension NeedsFollowUp {
    //TODO: rebuild needsFollowUp
}

