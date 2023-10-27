//
//  AppStateModel.swift
//  Messenger
//
//  Created by Jimmy Ghelani on 2023-10-25.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class AppStateModel: ObservableObject {
    // is user signed in
    @AppStorage("currentUsername") var currentUsername: String = ""
    @AppStorage("currentEmail") var currentEmail: String = ""
    
    @Published var showingSignIn: Bool
    @Published var conversations: [String] = []
    @Published var messages: [Message] = []
    var otherUsername = ""
    let database = Firestore.firestore()
    let auth = Auth.auth()
    
    // current user being chatted with
    
    // messages, conversations
    
    init() {
        self.showingSignIn = Auth.auth().currentUser == nil
    }
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
    // MARK: - SIGNIN
    func signIn(username: String, password: String) {
        // Get email from db
        database.collection("users")
            .document(username)
            .getDocument {[weak self] snapshot, error in
                guard let snapshot = snapshot, let document = snapshot.data(), error == nil else {
                    print(error?.localizedDescription ?? "can't find doc")
                    return
                }
                
                guard let email = document["email"] as? String else {
                    print("Not able to get email")
                    return
                }
                // try to sign in
                self?.auth.signIn(withEmail: email, password: password, completion: { result, error in
                    guard error == nil, result != nil else {
                        print(error?.localizedDescription ?? "Couldn't sign in")
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self?.currentEmail = email
                        self?.currentUsername = username
                        self?.showingSignIn = false
                    }
                })
            }
    }
    
    // MARK: - SIGNUP
    func signUp(email: String, username: String, password: String) {
        // CREATE
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            // INSERT USERNAME IN DB
            let data = [
                "email" : email,
                "username" : username
            ]
            
            self?.database
                .collection("users")
                .document(username)
                .setData(data) { error in
                    guard error == nil else {
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self?.currentUsername = username
                        self?.currentEmail = email
                        self?.showingSignIn = false
                    }
                }
        }
        
    }
    
    // MARK: - SIGNOUT
    func signOut() {
        do {
            try auth.signOut()
            self.showingSignIn = true
        } catch {
            print(error)
        }
    }
}

