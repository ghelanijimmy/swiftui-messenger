//
//  ContentView.swift
//  Messenger
//
//  Created by Jimmy Ghelani on 2023-10-25.
//

import SwiftUI

struct ConversationListView: View {
    // MARK: - PROPERTIES
    let usernames = ["Joe", "Jill", "Bob"]
    
    // MARK: - FUNCTIONS
    func signOut() {
        
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                ForEach(usernames, id: \.self) {name in
                    NavigationLink {
                        ChatView(otherUsername: name)
                    } label: {
                        HStack {
                            Circle()
                                .foregroundStyle(.pink)
                                .frame(width: 65, height: 65)
                                .padding(.trailing, 10)
                            
                            Text(name)
                                .bold()
                                .font(.system(size: 32))
                                .foregroundStyle(Color(.label))
                            
                            Spacer()
                        } //: HSTACK
                        .padding()
                    } //: NAV LABEL

                } //: LOOP
            } //: SCROLLVIEW
            .navigationTitle("Conversations")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Sign Out") {
                        signOut()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        SearchView()
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }

                }
            }
        } //: NAVIGATION STACK
        .padding()
    }
}

#Preview {
    ConversationListView()
}
