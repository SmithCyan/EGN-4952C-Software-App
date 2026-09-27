//  HomeView.swift
//  EGN 4952C Software App
//  Created by Nitsa Saint Fort on 9/18/26.

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: AuthViewModel
    
    @State private var searchText = ""
    @State private var meals: [Meal] = []
    @State private var errorMessage = ""
    
    let mealService = MealService()
    
    var body: some View {
        VStack {
            Button("Log Out") {
                viewModel.logout()
            }
            .buttonStyle(.bordered)
            .foregroundColor(.red)
            .padding()
            
            Text("Recipes")
                .font(.largeTitle)
                .bold()
            
            HStack {
                TextField("Search for a recipe", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                
                Button("Search") {
                    Task {
                        await searchMeals()
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
            
            List(meals) { meal in
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(meal.strMeal)
                        .font(.headline)
                    
                    if let category = meal.strCategory {
                        Text(category)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .navigationTitle("Recipes")
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
    HomeView(viewModel: AuthViewModel())
}
