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
    weak var timeline: Timeline?
    var contributors: [String]
    var technologies: [String]
    var images: [String] = []
    var goal: TimelineEntry?//note that Project checks needsFollowUp differently. see mark for mor information
    
    init (title: String, dateStarted: Date) {
        let milestone = ProjectMilestone(status: .inProgress, date: dateStarted, description: "Started building \(title) on \(dateStarted).", attained: true)
        self.timeline = Timeline(scope: .projects)
        timeline?.append([milestone])
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
        if let timeline = timeline{timeline.append([newCommits])}
    }
    
    func addMilestone(of status: Status, date: Date, description: String?) {
        let desc = "\(status.rawValue) on \(date)"
        var newMilestone = ProjectMilestone(status: status, date: date, description: desc, attained: true)
        if let description = description {
            newMilestone.description = description
        }
        self.status = status
        if let timeline = timeline{timeline.append([newMilestone])}
    }
    
    enum Action { case add, remove }
    
    func changeContributors(named names: String) {
        let nameList = names.components(separatedBy: ", ")
        self.contributors = nameList
    }
    
    func changeTechnologies(named names: String) {
        let nameList = names.components(separatedBy: ", ")
        self.technologies = nameList
    }
    
    func image(to action: Project.Action, _ name: String)-> Bool {
        if action == .add {
            guard images.count < 4 else {return false}
            if images.contains(name) {
                images.append(name)
                return true
            } else { return false}
        }
        else {
            if let toRemove = images.index(where: {$0 == name}) {
                images.remove(at: toRemove)
                return true
            } else { return false}
        }
    }
    
    func setNextGoal(ofType: Status, forDate date: Date)-> Bool {
        if ofType == Status.commits {
            self.goal = Commits(date: date, number: 1, description: "Put in some work on \(title)")
            return true
        } else {
            self.goal = ProjectMilestone(status: ofType, date: date, description: "Try to get to \(ofType.rawValue) by \(date)", attained: false)
            return true
        }
    }
    
}



