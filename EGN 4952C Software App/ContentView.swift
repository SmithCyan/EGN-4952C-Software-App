// ContentView.swift
// EGN 4952C Software App
// Recipe Collection App
// Created by Nitsa Saint Fort on 9/15/26.

import SwiftUI
import Combine
import ParseSwift

    struct ContentView: View {
        @StateObject private var authViewModel = AuthViewModel()
        
        var body: some View {
            NavigationStack {
                if authViewModel.isLoggedIn {
                    HomeView(viewModel: authViewModel)
                } else {
                    LoginView(authViewModel: authViewModel)
                }
            }
        }
    }
    
    #Preview {
        ContentView()
    }

