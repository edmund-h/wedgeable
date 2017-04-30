//
//  Timeline.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/30/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation

class Timeline {
    enum Scope {
        case application (Application), project (Project)
    }
    
    let scope: Scope
    var collection = [TimelineEntry]()
    
    init (scope: Scope) {
        self.scope = scope
    }
    
    func append(_ elements: [TimelineEntry]){
        guard !elements.isEmpty else {return}
        var elements = elements
        if collection.isEmpty {collection.append(elements.popLast()!)}
        while elements.count > 0 {
            guard let element = elements.popLast() else {break}
            if let index = collection.index(where: { $0.date > element.date }){
                //todo: use binary search instead, .index is O(n^tastic)
                collection.insert(element, at: index)
            } else { elements.append(element) }
        }
    }
    
}

struct Milestone: TimelineEntry {
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
    var description: String { get set }
}
