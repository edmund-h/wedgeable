//
//  FirebaseModel.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 8/31/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation

protocol JSONable {
    var jsonDict: [String:Any] { get }
}

extension FollowUp: JSONable {
    var jsonDict: [String: Any] {
        get {
            var output: [String : Any] = [:]
            output ["name"] = self.name
            output ["date"] = self.date.toISO8601()
            output ["parentEventID"] = self.parentEventID
            output ["complete"] = self.complete.description
            output ["contactID"] = self.contactID
            output ["method"] = self.method?.rawValue
            output ["comlpetionDate"] = self.completionDate?.toISO8601()
            return output
        }
    }
}

extension Contact: JSONable  {
//    init? (id: String, dict: [String:Any]) {
    
    var jsonDict: [String: Any] {
        get {
            var output: [String : Any] = [:]
            output ["name"] = self.name
            output ["date"] = self.date.toISO8601()
            output ["placeMet"] = self.placeMet
            output ["contactInfo"] = self.contactInfoJSON()
            output ["position"] = self.position
            output ["company"] = self.company
            output ["followUpID"] = self.followUpID
            return output
        }
    }
    
    func contactInfoJSON ()-> [String: String] {
        var output: [String:String] = [:]
        for contactMethod in contactInfo.keys {
            output [contactMethod.rawValue] = contactInfo [contactMethod]
        }
        return output
    }
}

extension Appointment: JSONable  {
    var jsonDict: [String: Any] {
        get {
            var dict: [String:String] = [:]
            dict ["address"] = self.address
            dict ["type"] = self.type.rawValue
            dict ["starting"] = self.date.toISO8601()
            dict ["duration"] = "\(self.duration)"
            dict ["applicationID"] = self.applicationID
            dict ["applDescription"] = self.applDescription
            dict ["contactID"] = self.contactID
            dict ["contactDescription"] = self.contactDescription
            dict ["followUpID"] = self.followUpID
            return dict
        }
    }
}

extension BlogPost: JSONable  {
    var jsonDict: [String: Any] {
        get {
            var dict: [String:Any] = [:]
            dict ["title"] = self.title
            dict ["date"] = self.date.toISO8601()
            dict ["topic"] = self.topic
            dict ["status"] = self.status.rawValue
            //make sure this works! ⬇️
            dict ["link"] = self.link?.absoluteString
            dict ["datePublished"] = self.datePublished?.toISO8601()
            return dict
        }
    }
}

extension Project: JSONable  {
    var jsonDict: [String: Any] {
        get {
            var dict: [String:Any] = [:]
            dict ["title"] = self.title
            dict ["dateStarted"] = self.date.toISO8601()
            dict ["status"] = self.status.rawValue
            dict ["contributors"] = self.contributors.joined(separator: ", ")
            dict ["technologies"] = self.technologies.joined(separator: ", ")
            dict ["timeline"] = self.timeline.jsonDict
            dict ["goal"] = self.goal?.jsonDict
            return dict
        }
    }
}

extension Application: JSONable  {
    var jsonDict: [String: Any] {
        get {
            var dict: [String:Any] = [:]
            dict ["company"] = self.company
            dict ["position"] = self.position
            dict ["dateApplied"] = self.date
            dict ["status"] = self.status.rawValue
            dict ["followUpID"] = self.followUpID
            dict ["timeline"] = self.timeline?.jsonDict
            return dict
        }
    }
}

extension Timeline: JSONable  {
    var jsonDict: [String: Any] {
        get {
            var dict: [String:Any] = [:]
            self.getEntries().forEach({
                let str = ($0.description + $0.date.toISO8601())
                let hash = "\(str.hashValue)"
                dict [hash] = $0.jsonDict
            })
            return dict
        }
    }
}

extension ApplyMilestone: JSONable  {
    var jsonDict: [String: Any] {
        get {
            var dict: [String:String] = [:]
            dict ["status"] = self.status.rawValue
            dict ["date"] = self.date.toISO8601()
            dict ["description"] = self.description
            dict ["complete"] = self.complete.description
            return dict
        }
    }
}

extension ProjectMilestone: JSONable  {
    var jsonDict: [String: Any] {
        get {
            var dict: [String:String] = [:]
            dict ["status"] = self.status.rawValue
            dict ["date"] = self.date.toISO8601()
            dict ["description"] = self.description
            dict ["attained"] = self.attained.description
            dict ["timesPushed"] = "\(self.timesPushed)"
            return dict
        }
    }
}

extension Commits: JSONable  {
    var jsonDict: [String: Any] {
        get {
            var dict: [String:String] = [:]
            dict ["date"] = self.date.toISO8601()
            dict ["description"] = self.description
            dict ["number"] = "\(self.number)"
            return dict
        }
    }
}

