//  RecipeCollectionApp.swift
//  EGN 4952C Software App
//  Created by Nitsa Saint Fort on 9/15/26.


import SwiftUI
import ParseSwift

@main
struct RecipeCollectionApp: App {

    init() {
        ParseSwift.initialize(applicationId: "Ap6X62gAwn18FgjKF8G1MR26gEvIBnB3ANYcp7wx",
            clientKey: "VltBxOd8ip1GACLKutF2sOxDRqCnXFcggLIKrXPt",
            serverURL: URL(string: "https://parseapi.back4app.com")!)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
