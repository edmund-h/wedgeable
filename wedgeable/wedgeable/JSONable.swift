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

extension Profile: JSONable {
    var jsonDict: [String: Any] {
        get {
            var output: [String: Any] = [:]
            output ["name"] = self.name
            output ["startDate"] = self.startDate.toISO8601()
            output ["endDate"] = self.endDate.toISO8601()
            //TODO: make sure these work ⬇️
            output ["sheetURL"] = self.sheetURL?.absoluteString
            output ["gitURL"] = self.gitURL?.absoluteString
            
            return output
        }
    }
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
            var output: [String:String] = [:]
            output ["address"] = self.address
            output ["type"] = self.type.rawValue
            output ["starting"] = self.date.toISO8601()
            output ["duration"] = "\(self.duration)"
            output ["applicationID"] = self.applicationID
            output ["applDescription"] = self.applDescription
            output ["contactID"] = self.contactID
            output ["contactDescription"] = self.contactDescription
            output ["followUpID"] = self.followUpID
            return output
        }
    }
}

extension BlogPost: JSONable  {
    var jsonDict: [String: Any] {
        get {
            var output: [String:Any] = [:]
            output ["title"] = self.title
            output ["date"] = self.date.toISO8601()
            output ["topic"] = self.topic
            output ["status"] = self.status.rawValue
            //make sure this works! ⬇️
            output ["link"] = self.link?.absoluteString
            output ["datePublished"] = self.datePublished?.toISO8601()
            return output
        }
    }
}

extension Project: JSONable  {
    var jsonDict: [String: Any] {
        get {
            var output: [String:Any] = [:]
            output ["title"] = self.title
            output ["dateStarted"] = self.date.toISO8601()
            output ["status"] = self.status.rawValue
            output ["contributors"] = self.contributors.joined(separator: ", ")
            output ["technologies"] = self.technologies.joined(separator: ", ")
            output ["timeline"] = self.timeline.jsonDict
            output ["goal"] = self.goal?.jsonDict
            return output
        }
    }
}

extension Application: JSONable  {
    var jsonDict: [String: Any] {
        get {
            var output: [String:Any] = [:]
            output ["company"] = self.company
            output ["position"] = self.position
            output ["dateApplied"] = self.date
            output ["status"] = self.status.rawValue
            output ["followUpID"] = self.followUpID
            output ["timeline"] = self.timeline?.jsonDict
            return output
        }
    }
}

extension Timeline: JSONable  {
    var jsonDict: [String: Any] {
        get {
            var output: [String:Any] = [:]
            self.getEntries().forEach({
                let str = ($0.description + $0.date.toISO8601())
                let hash = "\(str.hashValue)"
                output [hash] = $0.jsonDict
            })
            return output
        }
    }
}

extension ApplyMilestone: JSONable  {
    var jsonDict: [String: Any] {
        get {
            var output: [String:String] = [:]
            output ["status"] = self.status.rawValue
            output ["date"] = self.date.toISO8601()
            output ["description"] = self.description
            output ["complete"] = self.complete.description
            return output
        }
    }
}

extension ProjectMilestone: JSONable  {
    var jsonDict: [String: Any] {
        get {
            var output: [String:String] = [:]
            output ["status"] = self.status.rawValue
            output ["date"] = self.date.toISO8601()
            output ["description"] = self.description
            output ["attained"] = self.attained.description
            output ["timesPushed"] = "\(self.timesPushed)"
            return output
        }
    }
}

extension Commits: JSONable  {
    var jsonDict: [String: Any] {
        get {
            var output: [String:String] = [:]
            output ["date"] = self.date.toISO8601()
            output ["description"] = self.description
            output ["number"] = "\(self.number)"
            return output
        }
    }
}

