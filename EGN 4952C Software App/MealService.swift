//  MealService.swift
//  EGN 4952C Software App
//  Created by Nitsa Saint Fort on 9/27/26.

import Foundation

class MealService {

    func searchMeals(searchText: String) async throws -> [Meal] {

        guard let encodedSearch = searchText.addingPercentEncoding(
            withAllowedCharacters: .urlQueryAllowed
        ) else {
            return []
        }

        let urlString =
            "https://www.themealdb.com/api/json/v1/1/search.php?s=\(encodedSearch)"

        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let response = try JSONDecoder().decode(
            MealResponse.self,
            from: data
        )

        return response.meals ?? []
    }
}
