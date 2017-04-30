//
//  Project.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/29/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation

class Project: Event{
    enum Status: String {
        case planning = "Planning/Research", inProgress = "Early Development", testing = "Pre-Release Testing", submitted = "Submitted", published = "Published", released = "Released", updating = "Updated Regularly", seekingInvestment = "Seeking Investment", incorporated = "Incorporated", sold = "Sold", lapsed = "Development Lapsed", mothballed = "Mothballed", commits = "commits"
        
        static let all: [Project.Status] = [.planning, .inProgress, .testing, .submitted, .published, .released, .updating, .seekingInvestment, .incorporated, .sold, .lapsed, .mothballed]
    }
    
    var title: String {
        return self.name
    }
    var dateStarted: Date {
        return self.date
    }
    var status: Status
    var link: URL?
    var timeline: [TimelineEntry]
    var contributors: [String]
    var technologies: [String]
    var goal: TimelineEntry?//note that Project checks needsFollowUp differently. see mark for mor information
    
    init (title: String, dateStarted: Date) {
        let milestone = Milestone(status: .inProgress, date: dateStarted, description: "Started building \(title) on \(dateStarted).")
        timeline = [milestone]
        contributors = []
        technologies = []
        self.status = .planning
        super.init(name: title, date: dateStarted, aspect: .projects)
    }
    
    func addCommits(date: Date, number: Int, description: String?) {
        let desc = "\(number) commits on \(date)"
        var newCommits = Commits(date: date, number: number, description: desc)
        if let description = description {
            newCommits.description = description
        }
        timeline.append(newCommits)
    }
    
    func addMilestone(of status: Status,date: Date, description: String?) {
        let desc = "\(status.rawValue) on \(date)"
        var newMilestone = Milestone(status: status, date: date, description: desc)
        if let description = description {
            newMilestone.description = description
        }
        self.status = status
        timeline.append(newMilestone)
    }
    
    func addContributors(named names: String) {
        let nameList = names.components(separatedBy: ", ")
        self.contributors.append(contentsOf: nameList)
    }
    
    func addTechnologies(named names: String) {
        let nameList = names.components(separatedBy: ", ")
        self.technologies.append(contentsOf: nameList)
    }
    
    func setNextGoal(ofType: Status, forDate date: Date)-> Bool {
        if ofType == Status.commits {
            self.goal = Commits(date: date, number: 1, description: "Put in some work on \(title)")
            return true
        } else {
            self.goal = Milestone(status: ofType, date: date, description: "Try to get to \(ofType.rawValue) by \(date)")
            return true
        }
    }
    
}

// MARK: Helper Structs

extension Project {
    
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
}

protocol TimelineEntry {
    var date: Date { get set }
    var description: String { get set }
}
