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
    
    var hoursRemaining: Double {
        let now = Date(timeIntervalSinceNow: 0)
        let difference = self.date.compare(now)
        let hours = Double(difference.rawValue)/(60*60)
        return round(hours/100)*100
    }
    
    init? (name: String, forEvent event: Event) {
        guard event.aspect != Aspect.profile else { return nil }
        
        self.event = event
        let date = event.date.addingTimeInterval(86400) //1 day in seconds
        
        super.init(name: name, date: date, aspect: .followups)
    }
}
