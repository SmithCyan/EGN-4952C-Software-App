//  RecipeListView.swift
//  EGN 4952C Software App
//  Created by Nitsa Saint Fort on 9/27/26.

import SwiftUI
import ParseSwift

struct RecipeListView: View {

    @State private var recipes: [Recipe] = []
    @State private var searchText = ""

    var filteredRecipes: [Recipe] {

        if searchText.isEmpty {
            return recipes
        }

        return recipes.filter { recipe in

            let nameMatches =
                recipe.name?.localizedCaseInsensitiveContains(searchText) ?? false

            let ingredientMatches =
                recipe.ingredients?.contains {
                    $0.localizedCaseInsensitiveContains(searchText)
                } ?? false

            return nameMatches || ingredientMatches
        }
    }

    var body: some View {

        NavigationStack {

            List(filteredRecipes, id: \.objectId) { recipe in

                VStack(alignment: .leading, spacing: 8) {

                    Text(recipe.name ?? "Untitled Recipe")
                        .font(.headline)

                    if let rating = recipe.rating {
                        Text("⭐️ \(rating, specifier: "%.1f")")
                            .font(.subheadline)
                    }

                    if let description = recipe.description {
                        Text(description)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .lineLimit(2)
                    }

                }
                .padding(.vertical, 5)
            }

            .navigationTitle("Recipes")

            // ⭐️ SEARCH BAR
            .searchable(
                text: $searchText,
                prompt: "Search recipes or ingredients"
            )

            .task {
                await loadRecipes()
            }
        }
    }

    // MARK: - Load Recipes

    func loadRecipes() async {

        do {

            let results = try await Recipe.query().find()

            await MainActor.run {
                recipes = results
            }

        } catch {

            print("Error loading recipes:")
            print(error)
        }
    }
}
