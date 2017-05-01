//
//  Application.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/29/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation

class Application: Event, NeedsFollowUp, Contactable {
    
    enum Status: String {
        case coldAppl = "Cold Application", informedAppl = "Informed Application", referAppl = "Referral Application", invitedAppl = "Invited Application"
        case responded = "Responded", interviewed = "Interviewed", techInterviewed = "Technical Interviewed", cultureInterviewed = "Culture Interviewed", receivedOffer = "Received Offer", rejected = "Rejected", needConsultation = "Confer with Career Coach", lapsed = "Lapsed"
        static let applTypes = [coldAppl, informedAppl, referAppl, invitedAppl]
        static let all = applTypes + [responded, interviewed, techInterviewed, cultureInterviewed, receivedOffer, rejected, needConsultation, lapsed]
    }
    
    var company: String
    var position: String
    var postingURL: URL?
    var contactInfo: [FollowUp.Method : String] = [:]
    weak var timeline: Timeline?
    weak var followUp: FollowUp?
    var dateApplied: Date{
        return self.date
    }
    
    init(company: String, position: String, dateApplied: Date){
        self.company = company
        self.position = position
        self.timeline = Timeline(scope: .applications)
        super.init(name: "\(position), \(company)", date: dateApplied, aspect: .applications)
    }
    
    func changeStatus(to status: Status, date: Date, description: String?) {
        var des = "\(status) on \(date)"
        if let description = description { des = description }
        let milestone = ApplyMilestone(status: status, date: date, description: des)
        timeline?.append([milestone])
        self.followUp = FollowUp(forEvent: self)
    }
    
    func addContactInfo(from text: String, with method: FollowUp.Method?) {
        var contactString = ""
        if let method = method{ contactString += "\(method.rawValue): " }
        contactString += text
    }
}
