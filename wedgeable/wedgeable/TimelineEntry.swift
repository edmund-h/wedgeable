//
//  TimelineEntry.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 8/22/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation


protocol TimelineEntry {
    var date: Date { get set }
    var description: String { get }
    var jsonDict: [String:Any] { get }
}

struct ApplyMilestone: TimelineEntry {
    var status: Application.Status
    var date: Date
    var description: String
    var complete: Bool
}
// dictionary inits must be in a separate extension in order to preserve piecewise initializer
extension ApplyMilestone {
    init? (dict: [String: Any]) {
        if let statusStr = dict["status"] as? String,
            let statusEnm = Application.Status(rawValue: statusStr),
            let dateStr = dict["date"] as? String,
            let dateNSO = Date.from(iso8601: dateStr),
            let description = dict ["description"] as? String,
            let completeStr = dict ["complete"] as? String,
            let completeBool = Bool.init(completeStr) {
            self.status = statusEnm
            self.complete = completeBool
            self.description = description
            self.date = dateNSO
        }else {
            return nil
        }
    }
}

struct ProjectMilestone: TimelineEntry {
    var status: Project.Status
    var date: Date
    var timesPushed: Int = 0
    var description: String
    var attained: Bool
}

extension ProjectMilestone {
    init? (dict: [String: Any]) {
        if let statusStr = dict["status"] as? String,
            let statusEnm = Project.Status(rawValue: statusStr),
            let dateStr = dict["date"] as? String,
            let dateNSO = Date.from(iso8601: dateStr),
            let description = dict ["description"] as? String,
            let attainedStr = dict ["attained"] as? String,
            let attainedBool = Bool.init(attainedStr) {
            self.status = statusEnm
            self.attained = attainedBool
            self.description = description
            self.date = dateNSO
        }else {
            return nil
        }
        if let timesStr = dict["timesPushed"] as? String,
            let timesInt = Int(timesStr) {
            self.timesPushed = timesInt
        }
    }
    
}

struct Commits: TimelineEntry {
    var date: Date
    var number: Int
    var description: String
}

extension Commits {
    init? (dict: [String: Any]) {
        if let dateStr = dict["date"] as? String,
            let dateNSO = Date.from(iso8601: dateStr),
            let description = dict ["description"] as? String,
            let numberStr = dict ["number"] as? String,
            let numberInt = Int(numberStr) {
                self.description = description
                self.date = dateNSO
                self.number = numberInt
        }else {
            return nil
        }
    }
}
