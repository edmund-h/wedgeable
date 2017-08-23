//
//  Application.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/29/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation

class Application: Event, NeedsFollowUp, Contactable {
    
    var company: String
    var position: String
    var status: Application.Status
    var postingURL: URL?
    var contactInfo: [FollowUp.Method : String] = [:]
    weak var timeline: Timeline?
    var followUpID: String?
    var needsFollowup: Bool = false
    var dateApplied: Date{
        return self.date
    }
    
    init(company: String, position: String, dateApplied: Date, status: Application.Status){
        self.company = company
        self.position = position
        self.timeline = Timeline(scope: .applications)
        self.status = status
        super.init(name: "\(position), \(company)", date: dateApplied, aspect: .applications, id: "VOID")
    }
    
    init?(id: String, dict: [String:Any]) {
        if let company = dict["company"] as? String,
            let position = dict["position"] as? String,
            let dateStr = dict["dateApplied"] as? String,
            let dateNSO = Date.from(iso8601: dateStr),
            let statusStr = dict["Status"] as? String,
            let statusEnm = Application.Status(rawValue: statusStr){
                self.company = company
                self.position = position
                self.status = statusEnm
                super.init(name: "\(position), \(company)", date: dateNSO, aspect: .applications, id: id)
                self.followUpID = dict["followUpID"] as? String
        }else{
            return nil
        }
        
        if let timelineDict = dict["timeline"] as? [String: Any],
            timelineDict.keys.count > 0 {
            let myTimeline = Timeline(scope: .applications)
            myTimeline.getEntriesFrom(dict: timelineDict)
            self.timeline = myTimeline
        }
    }
    
    func changeStatus(to status: Status, date: Date, description: String?) {
        var des = "\(status) on \(date)"
        if let description = description { des = description }
        let milestone = ApplyMilestone(status: status, date: date, description: des, complete: false)
        timeline?.append(milestone)
        let followUp = FollowUp(forEvent: self)
        self.followUpID = followUp.id
    }
    
    func addContactInfo(from text: String, with method: FollowUp.Method?) {
        var contactString = ""
        if let method = method{ contactString += "\(method.rawValue): " }
        contactString += text
    }
    
    enum Status: String {
        case coldAppl = "Cold Application", informedAppl = "Informed Application", referAppl = "Referral Application", invitedAppl = "Invited Application"
        case responded = "Responded", interviewed = "Interviewed", techInterviewed = "Technical Interviewed", cultureInterviewed = "Culture Interviewed", receivedOffer = "Received Offer", rejected = "Rejected", needConsultation = "Confer with Career Coach", lapsed = "Lapsed"
        static let applTypes = [coldAppl, informedAppl, referAppl, invitedAppl]
        static let all = applTypes + [responded, interviewed, techInterviewed, cultureInterviewed, receivedOffer, rejected, needConsultation, lapsed]
    }
}
