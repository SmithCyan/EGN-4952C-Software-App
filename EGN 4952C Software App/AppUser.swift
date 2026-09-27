//  AppUser.swift
//  EGN 4952C Software App
//  Created by Nitsa Saint Fort on 9/18/26.

import Foundation
import ParseSwift

struct AppUser: ParseUser {
    
    // Required ParseObject properties
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    // Required ParseUser properties
    var username: String?
    var email: String?
    var password: String?
    var authData: [String: [String: String]?]?
    
    // Email verification status
    var emailVerified: Bool?
}
