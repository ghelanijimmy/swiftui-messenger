//
//  ChatRowView.swift
//  Messenger
//
//  Created by Jimmy Ghelani on 2023-10-25.
//

import SwiftUI

struct ChatRowView: View {
    // MARK: - PROPERTIES
    let type: MessageType
    var isSender: Bool {
        return type == .sent
    }
    
    // MARK: - FUNCTIONS
    init(type: MessageType) {
        self.type = type
    }
    
    
    var body: some View {
        HStack {
            if isSender {
                Spacer()
            }
            
            if !isSender {
                VStack {
                    Spacer()
                    Circle()
                        .frame(width: 45, height: 45)
                        .foregroundStyle(.pink)
                }
            }
            HStack {
                Text("Hello World. Hello World. Hello World. Hello World. Hello World. Hello World. Hello World.")
                    .foregroundStyle(isSender ? .white : Color(.label))
                    .padding()
            } //: HSTACK
            .background(isSender ? .blue : Color(.systemGray4))
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .padding(isSender ? .leading : .trailing, isSender ? 70 : 40)
            .frame(width: .infinity)
            
            if !isSender {
                Spacer()
            }
        } //: HSTACK
    }
}

#Preview("sent") {
    Group {
        ChatRowView(type: .sent)
        ChatRowView(type: .received)
    }
}
