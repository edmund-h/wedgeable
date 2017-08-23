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
    var contactID: String?
    enum Method: String {
        case phone = "Phone", email = "eMail", inPerson = "In Person", socialMedia = "Social Media", mail = "Mail", gift = "Gift", goal = "Goal"
    }
    
    var type: Method?
    var complete: Bool
    var completionDate: Date?
    
    var hoursRemaining: Double {
        let difference = self.date.timeIntervalSinceNow
        let hours = abs(Double(difference)/(60*60))
        return round(hours/100)*100
    }
    var description: String {
        var needed = "Needed"
        if let type = type { needed = type.rawValue }
        return "\(needed) follow-up on \(name)"
    }
    
    init (forEvent event: Event) {
        self.parentEventID = event.id
        self.complete = false
        let date = event.date.addingTimeInterval(86400) //1 day in seconds
        
        super.init(name: event.name, date: date, aspect: .followups, id: "VOID")
    }
    
    //todo: dictionary init
    
    
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

