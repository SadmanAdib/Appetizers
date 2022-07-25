//
//  User.swift
//  Appetizers
//
//  Created by Sadman Adib on 25/7/22.
//

import Foundation

struct User: Codable {
    
    var firstName = ""
    var lastName = ""
    var email = ""
    var dateofBirth = Date()
    var extraNapkins = false
    var frequentRefills = false
   
    
}
