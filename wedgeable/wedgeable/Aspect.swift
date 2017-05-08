//
//  Aspect.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/29/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation

enum Aspect {
    case profile, contacts, applications, followups, appointments, blogposts, projects
    
    static let all = [Aspect.profile, Aspect.applications, Aspect.followups, Aspect.appointments, Aspect.blogposts, Aspect.projects, Aspect.contacts]
    
    func getAspectView()-> InfoView{
        switch self {
        case .profile:
            return ProfileView()
        case .contacts:
            return ContactsView()
        case .applications:
            return ApplicationsView()
        case .followups:
            return FollowUpsView()
        case.appointments:
            return AppointmentsView()
        case .blogposts:
            return BlogPostsView()
        case .projects:
            return ProjectsView()
        }
    }
    
    func getXibHeight()-> Double{
        switch self {
        case .profile:
            return 0
        case .contacts:
            return 0
        case .applications:
            return 0
        case .followups:
            return 0
        case.appointments:
            return 0
        case .blogposts:
            return 0
        case .projects:
            return 550
        }
    }
    
    func getTestData()-> [Event]{
        let all = [
            Event(name: "lol", date: Date(timeIntervalSinceNow: 0), aspect: .followups),
            Event(name: "loll", date: Date(timeIntervalSinceNow: 0), aspect: .blogposts ),
            Event(name: "lolll", date: Date(timeIntervalSinceNow: 0), aspect: .followups),
            Event(name: "llol", date: Date(timeIntervalSinceNow: 0), aspect: .applications),
            Event(name: "lllol", date: Date(timeIntervalSinceNow: 0), aspect: .appointments),
            Event(name: "lloll", date: Date(timeIntervalSinceNow: 0), aspect: .followups),
            Event(name: "lllolll", date: Date(timeIntervalSinceNow: 0), aspect: .appointments),
            Event(name: "loool", date: Date(timeIntervalSinceNow: 0), aspect: .followups),
            Event(name: "lolol", date: Date(timeIntervalSinceNow: 0), aspect: .followups),
            Project(title: "Wedgeable", dateStarted: Date(timeIntervalSinceNow: -750000.0)),
            Project(title: "HereThere.Be", dateStarted: Date(timeIntervalSinceNow: -10000000.0)),
            Contact(name: "Mom", metAt: "Born", info: "9178547765", fromEvent: nil),
            Contact(name: "Ali", metAt: "Party", info: "4254662904", fromEvent: nil),
            Appointment(address: "Hacker Meetup", starting: Date(timeIntervalSinceNow: 750000.0), duration: (180.0*60.0), type: .meetup),
            Appointment(address: "date with hot girl", starting: Date(timeIntervalSinceNow: 750000.0), duration: (180.0*60.0), type: .informalMeeting)
            
        ]
        switch self {
        case .profile:
            return [Event]()
        case .contacts:
            let result = all.flatMap({ (element) -> Contact? in
               return element as? Contact
            })
            return result
        case .applications:
            let result = all.flatMap({ (element) -> Application? in
                return element as? Application
            })
            return result
        case .followups:
            let result = all.flatMap({ (element) -> FollowUp? in
                return element as? FollowUp
            })
            return result
        case.appointments:
            let result = all.flatMap({ (element) -> Appointment? in
                return element as? Appointment
            })
            return result
        case .blogposts:
            let result = all.flatMap({ (element) -> BlogPost? in
                return element as? BlogPost
            })
            return result
        case .projects:
            let result = all.flatMap({ (element) -> Project? in
                return element as? Project
            })
            return result
        }
    }
}
