//  AuthViewModel.swift
//  EGN 4952C Software App
//  Created by Nitsa Saint Fort on 9/27/26.

import SwiftUI
import ParseSwift
import Combine

class AuthViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var passwordConfirmed = ""
    
    @Published var errorMessage = ""
    @Published var isLoggedIn = false
    
    
    // MARK: - Login
    
    func login() {
        
        errorMessage = ""
        
        guard !username.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter your username and password."
            return
        }
        
        AppUser.login(
            username: username,
            password: password
        ) { result in
            
            DispatchQueue.main.async {
                
                switch result {
                    
                case .success(let user):
                    
                    print(
                        "Logged in as",
                        user.username ?? "(no username)"
                    )
                    
                    self.isLoggedIn = true
                    
                case .failure(let error):
                    
                    self.errorMessage =
                        error.localizedDescription
                }
            }
        }
    }
    
    
    // MARK: - Signup
    
    func signup() {
        
        errorMessage = ""
        
        guard !username.isEmpty,
              !email.isEmpty,
              !password.isEmpty,
              !passwordConfirmed.isEmpty else {
            
            errorMessage = "Please fill in all fields."
            return
        }
        
        guard password == passwordConfirmed else {
            
            errorMessage = "Passwords do not match."
            return
        }
        
        var newUser = AppUser()
        
        newUser.username = username
        newUser.email = email
        newUser.password = password
        
        newUser.signup { result in
            
            DispatchQueue.main.async {
                
                switch result {
                    
                case .success(let user):
                    
                    print(
                        "Signed up:",
                        user.username ?? "(none)"
                    )
                    
                    self.isLoggedIn = true
                    
                case .failure(let error):
                    
                    self.errorMessage =
                        error.localizedDescription
                }
            }
        }
    }
    
    
    // MARK: - Logout
    
    func logout() {
        
        AppUser.logout { result in
            
            DispatchQueue.main.async {
                
                switch result {
                    
                case .success:
                    
                    print("Logged out")
                    self.isLoggedIn = false
                    
                case .failure(let error):
                    
                    self.errorMessage =
                        error.localizedDescription
                }
            }
        }
    }
}
