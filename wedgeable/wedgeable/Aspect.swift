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
    
    static let all = [Aspect.profile, Aspect.contacts, Aspect.applications, Aspect.followups, Aspect.appointments, Aspect.blogposts, Aspect.projects]
    
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
    
}
