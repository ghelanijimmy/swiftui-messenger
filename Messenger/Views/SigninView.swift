//
//  SigninView.swift
//  Messenger
//
//  Created by Jimmy Ghelani on 2023-10-25.
//

import SwiftUI

struct SigninView: View {
    // MARK: - PROPERTIES
    @State var username: String = ""
    @State var password: String = ""
    @EnvironmentObject var model: AppStateModel
    
    // MARK: - FUNCTIONS
    func signIn() {
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6 else {
            return
        }
        
        model.signIn(username: username, password: password)
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            VStack {
                // HEADING
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                Text("Messenger")
                    .bold()
                    .font(.system(size: 34))
                
                // TEXTFIELDS
                
                VStack {
                    TextField("Username", text: $username)
                        .modifier(CustomField())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $password)
                        .modifier(CustomField())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    Button(action: {
                        signIn()
                    }, label: {
                        Text("Sign In")
                            .frame(width: 220, height: 50)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                            .foregroundStyle(.white)
                    })
                    .padding(.top, 20)
                } //: VSTACK
                .padding()
                
                Spacer()
                
                // SIGNUP
                HStack {
                    Text("New to Messenger?")
                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text("Create an Account")
                    }

                } //: HSTACK
            } //: VSTACK
        } //: NAVIGATION STACK
    }
}

#Preview {
    SigninView()
        .environmentObject(AppStateModel())
}
