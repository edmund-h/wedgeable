//
//  Date.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/30/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation

extension Date {
    
    static func from(iso8601: String)-> Date? {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from: iso8601)
    }

    func stringWithFormat(date dateStyle: DateFormatter.Style,
                   time timeStyle: DateFormatter.Style )-> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter.string(from: self)
    }
    
    func toISO8601()-> String {
        let formatter = ISO8601DateFormatter()
        return formatter.string(from: self)
    }
}
