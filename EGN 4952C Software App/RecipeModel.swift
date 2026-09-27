//  RecipeModel.swift
//  EGN 4952C Software App
//  Created by Nitsa Saint Fort on 9/27/26.

import Foundation
import ParseSwift

struct Recipe: ParseObject {
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    var name: String?
    var rating: Double?
    var prepTime: String?
    var cookTime: String?
    var readyIn: String?
    var description: String?
    var imageURL: String?
    var ingredients: [String]?
}

