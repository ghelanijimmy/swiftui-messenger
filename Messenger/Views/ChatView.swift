//
//  ChatView.swift
//  Messenger
//
//  Created by Jimmy Ghelani on 2023-10-25.
//

import SwiftUI

struct ChatView: View {
    // MARK: - PROPERTIES
    @State var message: String = ""
    
    // MARK: - BODYdf
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                ChatRowView(type: .received)
                    .padding(3)
                ChatRowView(type: .sent)
                    .padding(3)
                ChatRowView(type: .received)
                    .padding(3)
            } //: SCROLL VIEW
            
            // FIELD SEND BUTTON
            HStack {
                TextField("Message...", text: $message)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 7))
                SendButtonView(text: $message)
            } //: HSTACK
            .padding()
        } //: VSTACK
        .navigationTitle("Samantha")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
