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
    
//    func append(_ elements: [TimelineEntry]){
//        guard !elements.isEmpty else {return}
//        var elements = elements
//        if collection.isEmpty {collection.append(elements.popLast()!)}
//        while elements.count > 0 {
//            guard let element = elements.popLast() else {break}
//            if let index = collection.index(where: { $0.date > element.date }){
//                //todo: use binary search instead, .index is O(n^tastic)
//                collection.insert(element, at: index)
//            } else { collection.append(element) }
//        }
//    }
//    
//    func binarySearch(date: Date)-> Int? {
//        var min = 0
//        var max = collection.count - 1
//        if min > max {
//    }
    
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
}

struct ProjectMilestone: TimelineEntry {
    var status: Project.Status
    var date: Date
    var description: String
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
