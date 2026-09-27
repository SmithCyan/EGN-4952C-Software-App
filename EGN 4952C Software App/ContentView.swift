// ContentView.swift
// EGN 4952C Software App
// Recipe Collection App
// Created by Nitsa Saint Fort on 9/15/26.

import SwiftUI

struct ContentView: View {

    @State private var searchText = ""
    @State private var meals: [Meal] = []
    @State private var errorMessage = ""

    let mealService = MealService()

    var body: some View {

        NavigationStack {

            VStack {

                TextField("Search for a recipe", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                Button("Search") {

                    Task {
                        await searchMeals()
                    }
                }
                .buttonStyle(.borderedProminent)

                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }

                List(meals) { meal in

                    VStack(alignment: .leading) {

                        Text(meal.strMeal)
                            .font(.headline)

                        if let category = meal.strCategory {
                            Text(category)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }

                    }
                }

            }
            .navigationTitle("Recipes")

        }
    }

    func searchMeals() async {

        do {

            let results = try await mealService.searchMeals(
                searchText: searchText
            )

            meals = results

            errorMessage = ""

        } catch {

            errorMessage = "Unable to load recipes."
            print(error)
        }
    }
}

#Preview {
    ContentView()
}
