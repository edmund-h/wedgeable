//
//  Contactable.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/1/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation

protocol Contactable {
    var contactInfo: [FollowUp.Method : String] {get set}
}

extension Contactable {
    func discernContactType(info: String)-> FollowUp.Method {
        if info.contains("@") && info.contains(".") {
            return FollowUp.Method.email
        }
        if discernPhoneNumber(info) {return FollowUp.Method.phone}
        return FollowUp.Method.socialMedia
    }
    
    fileprivate func discernPhoneNumber(_ text: String)-> Bool {
        let substr = text.components(separatedBy: [" ", "-", "(",")"])
        for str in substr {
            guard !str.isEmpty else {continue}
            if Int(str) != nil {continue}
            return false
        }
        return true
    }
}
