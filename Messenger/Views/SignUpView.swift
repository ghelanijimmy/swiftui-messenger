//
//  SignUpView.swift
//  Messenger
//
//  Created by Jimmy Ghelani on 2023-10-25.
//

import SwiftUI

struct SignUpView: View {
    // MARK: - PROPERTIES
    @State var email: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @EnvironmentObject var model: AppStateModel
    @Environment(\.dismiss) var dismiss
    
    // MARK: - FUNCTIONS
    func signUp() {
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6 else {
            return
        }
        
        model.signUp(email: email, username: username, password: password)
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // HEADING
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
            
            // TEXTFIELDS
            
            VStack {
                TextField("Email", text: $email)
                    .modifier(CustomField())
                TextField("Username", text: $username)
                    .modifier(CustomField())
                SecureField("Password", text: $password)
                    .modifier(CustomField())
                
                Button(action: {
                    signUp()
                }, label: {
                    Text("Sign Up")
                        .frame(width: 220, height: 50)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .foregroundStyle(.white)
                })
                .padding(.top, 20)
            } //: VSTACK
            .padding()
            
            Spacer()
        }
        .navigationTitle("Create Account")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SignUpView()
    }
}
