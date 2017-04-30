//
//  FollowUp.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/29/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation

class FollowUp: Event {
    unowned var event: Event
    enum Method: String {
        case phone = "Phone", email = "eMail", inPerson = "In Person", socialMedia = "Social Media", mail = "Mail", gift = "Gift", goal = "Goal"
    }
    
    var type: Method?
    
    var hoursRemaining: Double {
        let now = Date(timeIntervalSinceNow: 0)
        let difference = self.date.compare(now)
        let hours = Double(difference.rawValue)/(60*60)
        return round(hours/100)*100
    }
    var description: String {
        return "\(type) follow-up on \(event.name)"
    }
    
    init? (name: String, forEvent event: Event) {
        guard event.aspect != Aspect.profile else { return nil }
        
        self.event = event
        let date = event.date.addingTimeInterval(86400) //1 day in seconds
        
        super.init(name: name, date: date, aspect: .followups)
    }
}

protocol NeedsFollowUp {
    var followUp: FollowUp? { get set }
}

extension NeedsFollowUp {
    func needsFollowUp()-> Bool {
        return followUp == nil
    }
}
