//  Meal.swift
//  EGN 4952C Software App
//  Created by Nitsa Saint Fort on 9/27/26.

import Foundation

struct Meal: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String?

    var id: String {
        idMeal
    }
}
