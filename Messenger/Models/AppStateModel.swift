//
//  AppStateModel.swift
//  Messenger
//
//  Created by Jimmy Ghelani on 2023-10-25.
//

import Foundation
import SwiftUI

class AppStateModel: ObservableObject {
    // is user signed in
    @AppStorage("currentUsername") var currentUsername: String = ""
    @AppStorage("currentEmail") var currentEmail: String = ""
    
    @Published var showingSignIn: Bool = true
    @Published var conversations: [String] = []
    @Published var messages: [Message] = []
    var otherUsername = ""
    
    // current user being chatted with
    
    // messages, conversations
}

// Search
extension AppStateModel {
    func searchUsers(with name: String, completion: @escaping (_ users: [String]) -> Void) {
        
    }
}

// Conversations
extension AppStateModel {
    func getConversations() {
        // LISTEN FOR CONVERSATIONS
    }
}

// GET / SEND MESSAGES
extension AppStateModel {
    func observeChat() {
        
    }
    
    func sendMessage(text: String) {
        
    }
    
    func createConversationIfNeeded() {
        
    }
}

// Sign In Sign Up
extension AppStateModel {
    func signIn(username: String, password: String) {
        // TRY TO SIGN IN
    }
    
    func signUp(email: String, username: String, password: String) {
        // TRY TO SIGN UP
    }
    
    func signOut() {
        
    }
}

