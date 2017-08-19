//
//  BlogPost.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/29/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation

class BlogPost: Event, TimelineEntry {
    
    enum Status: String {
        case finished = "Finished", inProgress = "In Progress", planned = "Planned"
    }
    
    var title: String = "Untitled"
    var topic: String?
    var link: URL?
    var status: Status = .planned
    var datePublished: Date?
    
    var dueDate : Date {
        return self.date
    }
    
    var description: String {
        var withTopic = ""
        if let topic = topic { withTopic = "about \(topic) " }
        switch self.status {
        case .planned:
            return "Planned blog post \(withTopic)due \(dueDate)"
        case .inProgress:
            return "Blog post \(withTopic)due \(dueDate)"
        case .finished:
            if let datePublished = datePublished{
                return "\(self.name) (published \(datePublished))"
            }
            else {return "\(self.name)"}
        }
    }
    
    init(due: Date){
        super.init(name: title, date: due, aspect: .blogposts)
    }
    
    func isInProgress(about topic: String) {
        self.topic = topic
        self.status = .inProgress
    }
    
    func isCompleted(titled: String, published: Date, webAddress: URL) {
        // make sure it's a real url before coming in here!
        self.title = titled
        self.name = titled
        self.datePublished = published
        self.link = webAddress
        self.status = .finished
    }
    
}
