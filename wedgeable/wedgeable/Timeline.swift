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
    var count: Int {
        if collection.isEmpty { return 0 }
        let colEntries = collection.flatMap({ (date: Date, entries: [TimelineEntry])->[TimelineEntry] in
            return entries
        })
        return colEntries.count
    }
    
    init () {
        self.scope = .profile
    }
    
    init (scope: Aspect) {
        self.scope = scope
    }
    
    func getEntriesFrom(dict: [String: Any]) {
        for key in dict.keys {
            guard let entryDict = dict [key] as? [String: Any]
                else { continue }
            if let entry = Timeline.makeEntry(from: entryDict){
                append(entry)
            }
        }
    }
    
    func append(_ entry: TimelineEntry) {
        if var entries = collection[entry.date]{
            entries.append(entry)
            collection[entry.date] = entries
        } else {
            collection[entry.date] = [entry]
        }
    }
    
    func append(_ elements: [TimelineEntry]) {
        elements.forEach({
            append($0)
        })
    }
    
    
    func append(timeline: Timeline) {
        timeline.collection.keys.forEach({
            guard let elems = timeline.collection[$0] else {return}
            self.append(elems)
        })
    }
    
    func getEntries()->[TimelineEntry] {
        if collection.isEmpty { return [TimelineEntry]() }
        let entries = collection.flatMap({ (date: Date, entries: [TimelineEntry])->[TimelineEntry] in
            return entries
        })
        return entries.sorted(by:{
            (entry1: TimelineEntry, entry2: TimelineEntry)->Bool in
            return entry1.date > entry2.date
        })
        
    }
    
    func getEntries(upToDate: TimeInterval)->[TimelineEntry] {
        let entries = collection.flatMap({ (date: Date, entries: [TimelineEntry])->[TimelineEntry] in
            if date.timeIntervalSinceNow <= upToDate { return entries }
            return []
        })
        return entries.sorted(by:{
            (entry1: TimelineEntry, entry2: TimelineEntry)->Bool in
            return entry1.date > entry2.date
        })
    }
    
    func getEntry(_ ordinal: Int)->TimelineEntry {
        let entries = getEntries()
        return entries[ordinal]
    }
    
    static func makeEntry(from dict: [String: Any])-> TimelineEntry? {
        guard let type = dict["type"] as? String else { return nil }
        switch type {
        case "commits":
            return Commits(dict: dict)
        case "projectMilestone":
            return ProjectMilestone(dict: dict)
        case "applyMilestone":
            return ApplyMilestone(dict: dict)
        default:
            return nil
        }
    }
}


