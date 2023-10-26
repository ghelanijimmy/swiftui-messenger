//
//  SearchView.swift
//  Messenger
//
//  Created by Jimmy Ghelani on 2023-10-25.
//

import SwiftUI

struct SearchView: View {
    // MARK: - PROPERTIES
    @Environment(\.dismiss) var dismiss
    @State var text: String = ""
    let usernames = ["Julia"]
    let completion: (String) -> Void
    
    init(completion: @escaping ((String) -> Void)) {
        self.completion = completion
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            TextField("Username", text: $text)
                .modifier(CustomField())
            
            Button("Search") {
                
            }
            
            List {
                ForEach(usernames, id: \.self) {user in
                    HStack {
                        Circle()
                            .frame(width: 55, height: 55)
                            .foregroundStyle(.green)
                        
                        Text(user)
                            .font(.system(size: 24))
                        
                        Spacer()
                    } //: HSTACK
                    .onTapGesture(perform: {
                        dismiss()
                        completion(user)
                    })
                } //: LOOP
            } //: LIST
            .listStyle(.plain)
            
            Spacer()
        } //: VSTACK
        .navigationTitle("Search")
    }
}

#Preview {
    NavigationStack {
        SearchView(){username in }
    }
}
