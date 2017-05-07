//
//  Timeline.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/30/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation

class Timeline {
    
    let scope: Aspect
    var collection: [Date:[TimelineEntry]] = [:]
    
    init (scope: Aspect) {
        self.scope = scope
    }
    
    func append(_ elements: [TimelineEntry]){
        elements.forEach({
            if var entries = collection[$0.date]{
                entries.append($0)
                collection[$0.date] = entries
            } else {
                collection[$0.date] = [$0]
            }
        })
    }
    
    func append(timeline: Timeline){
        timeline.collection.keys.forEach({
            guard let elems = timeline.collection[$0] else {return}
            self.append(elems)
        })
    }
    
    
}

struct ApplyMilestone: TimelineEntry {
    var status: Application.Status
    var date: Date
    var description: String
    var complete: Bool
}

struct ProjectMilestone: TimelineEntry {
    var status: Project.Status
    var date: Date
    var description: String
    var attained: Bool
}

struct Commits: TimelineEntry {
    var date: Date
    var number: Int
    var description: String
    
}

protocol TimelineEntry {
    var date: Date { get set }
    var description: String { get }
}
