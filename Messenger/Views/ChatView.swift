//
//  ChatView.swift
//  Messenger
//
//  Created by Jimmy Ghelani on 2023-10-25.
//

import SwiftUI

struct CustomField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 7))
    }
}

struct ChatView: View {
    // MARK: - PROPERTIES
    @State var message: String = ""
    let otherUsername: String
    
    init(otherUsername: String) {
        self.otherUsername = otherUsername
    }
    
    // MARK: - BODYdf
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                ChatRowView(type: .received, text: "Hello World")
                    .padding(3)
                ChatRowView(type: .sent, text: "Hello World")
                    .padding(3)
                ChatRowView(type: .received, text: "Hello World")
                    .padding(3)
            } //: SCROLL VIEW
            
            // FIELD SEND BUTTON
            HStack {
                TextField("Message...", text: $message)
                    .modifier(CustomField())
                SendButtonView(text: $message)
            } //: HSTACK
            .padding()
        } //: VSTACK
        .navigationTitle(otherUsername)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ChatView(otherUsername: "other user")
    }
}
