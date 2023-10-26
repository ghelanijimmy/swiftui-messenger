//
//  SendButtonView.swift
//  Messenger
//
//  Created by Jimmy Ghelani on 2023-10-25.
//

import SwiftUI

struct SendButtonView: View {
    // MARK: - PROPERTIES
    @Binding var text: String
    
    // MARK: - FUNCTIONS
    func sendMessage() {
        guard !text.isEmpty else {
            return
        }
        
        //TODO: Handle Send message
    }
    
    // MARK: - BODY
    var body: some View {
        Button(action: {
            self.sendMessage()
        }, label: {
            Image(systemName: "paperplane")
                .font(.system(size: 33))
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 55)
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(Circle())
        })
    }
}

#Preview {
    SendButtonView(text: .constant("Message"))
}
