//  AppUser.swift
//  EGN 4952C Software App
//  Created by Nitsa Saint Fort on 9/18/26.

import Foundation
import ParseSwift

struct AppUser: ParseUser {
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    var username: String?
    var email: String?
    var password: String? 
}
