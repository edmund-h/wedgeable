//
//  Profile.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/3/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation

struct Profile {
    
    enum webData: String { case sheets = "sheet", git = "git" }
    
    let name: String
    let startDate: Date
    let endDate: Date
    var sheetURL: URL?
    var gitURL: URL?
    //weak var settings: Settings
    
    static var data = UserDefaults.standard
    
    private init(name: String, start: Date, end: Date, sheet: URL?, git: URL?) {
        self.name = name
        self.startDate = start
        self.endDate = end
        if let sheet = sheet, let git = git {
            self.sheetURL = sheet
            self.gitURL = git
        }
    }
    
    static func setCriticalUserData(name: String, start: Date, end: Date) {
        data.set(name, forKey: "name")
        let startInterval = start.timeIntervalSince1970
        let endInterval = end.timeIntervalSince1970
        data.set(startInterval, forKey: "start")
        data.set(endInterval, forKey: "end")
    }
    
    static func setUrl(_ text: String, forService: webData )-> Bool {
        guard let url = URL(string: text) else { return false }
        data.set(url, forKey: forService.rawValue)
        return true
    }
    
    static func getProfile()-> Profile {
        return Profile(
            name: data.string(forKey: "name") ?? "",
            start: Date(timeIntervalSince1970: data.double(forKey: "start")),
            end: Date(timeIntervalSince1970: data.double(forKey: "start")),
            sheet: data.url(forKey: "sheet"),
            git: data.url(forKey: "git")
        )
    }
    
}
