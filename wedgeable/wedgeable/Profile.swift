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
    
    private init?(name: String, start: Date?, end: Date?, sheet: URL?, git: URL?) {
        guard let start = start, let end = end else { return nil }
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
        let startString = start.toISO8601()
        let endString = end.toISO8601()
        data.set(startString, forKey: "start")
        data.set(endString, forKey: "end")
    }
    
    static func setUrl(_ text: String, forService: webData )-> Bool {
        guard let url = URL(string: text) else { return false }
        data.set(url, forKey: forService.rawValue)
        return true
    }
    
    static func getProfile()-> Profile? {
        guard let nameString = data.string(forKey: "name"),
            let startString = data.string(forKey: "start"),
            let endString = data.string(forKey: "end") else {
                return nil
        }
        return Profile(
            name: nameString,
            start: Date.from(iso8601: startString),
            end: Date.from(iso8601: endString),
            sheet: data.url(forKey: "sheet"),
            git: data.url(forKey: "git")
        )
    }
    
}
