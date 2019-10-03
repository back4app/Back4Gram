//
//  SignUpView.swift
//  Back4Gram
//
//  Created by Venom on 23/08/19.
//  Copyright © 2019 Venom. All rights reserved.
//

import SwiftUI
import Apollo

struct SignUpView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var email: String = ""
    
    @State private var showingAlert = false

    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.largeTitle)
                .foregroundColor(lightBlueColor)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            
            TextField("Username", text: $username)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            SecureField("Password", text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            TextField("Email (optional)", text: $email)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            Button(action: {
                // Perform the SignUpUser mutation, passing the parameters we just got from our TextFields
                apollo.perform(mutation: SignUpUserMutation(username: self.username, password: self.password, email: self.email)){ result in
                    // Let's switch the result so we can separate a successful one from an error
                    switch result {
                        // In case of success
                        case .success(let graphQLResult):
                            // We try to parse our result
                            if let objId = graphQLResult.data?.users?.signUp.objectId {
                                myMessage.alertTitle = "Yay!"
                                myMessage.alertText = "User signed up!"
                                
                                self.showingAlert = true

                                print ("User created with ObjectId: " + objId)
                            }
                            // but in case of any GraphQL errors we present that message
                            else if let errors = graphQLResult.errors {
                                // GraphQL errors

                                myMessage.alertTitle = "Oops!"
                                myMessage.alertText = "We've got a GraphQL error: " + errors.description
                                self.showingAlert = true

                                print(errors)
                            }
                        // In case of failure, we present that message
                        case .failure(let error):
                            // Network or response format errors
                            myMessage.alertTitle = "Oops!"
                            myMessage.alertText = "We've got an error: " + error.localizedDescription
                            self.showingAlert = true
                            
                            print(error)
                    }
                }
            }){
                Text("Sign Up!")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(lightBlueColor)
                    .cornerRadius(15.0)
            }
             .alert(isPresented: $showingAlert) {
                 Alert(title: Text(myMessage.alertTitle), message: Text(myMessage.alertText), dismissButton: .default(Text("OK")))
             }
        }.padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
