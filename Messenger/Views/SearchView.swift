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
    @State var usernames: [String] = []
    let completion: (String) -> Void
    @EnvironmentObject var model: AppStateModel
    
    init(completion: @escaping ((String) -> Void)) {
        self.completion = completion
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            TextField("Username", text: $text)
                .modifier(CustomField())
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
            
            Button("Search") {
                guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
                    return
                }
                model.searchUsers(with: text) { users in
                    self.usernames = users
                }
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
            .environmentObject(AppStateModel())
    }
}
