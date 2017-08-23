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
    
    var topic: String?
    var link: URL?
    var status: Status = .planned
    var datePublished: Date?
    
    var title: String {
        return self.name
    }
    
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
        super.init(name: "Untitled", date: due, aspect: .blogposts, id: "VOID")
    }
    
    init?(id: String, dict: [String:Any]){
        if let name = dict ["title"] as? String,
        let dateStr = dict ["date"] as? String,
        let dateNSO = Date.from(iso8601: dateStr){
            super.init(name: name, date: dateNSO, aspect: .blogposts, id: id)
            self.topic = dict ["topic"] as? String
        }
        else {
            return nil
        }
        //non-string optionals
        if let statusStr = dict ["status"] as? String,
            let statusEnm = Status(rawValue: statusStr) {
            self.status = statusEnm
        }
        if let linkStr = dict ["link"] as? String {
            self.link = URL(string: linkStr)
        }
        if let datePub = dict ["datePublished"] as? String {
            self.datePublished = Date.from(iso8601: datePub)
        }
    }
    
    func isInProgress(about topic: String) {
        self.topic = topic
        self.status = .inProgress
    }
    
    func isCompleted(titled: String, published: Date, webAddress: URL) {
        // make sure it's a real url before coming in here!
        self.name = titled
        self.datePublished = published
        self.link = webAddress
        self.status = .finished
    }
    
}
