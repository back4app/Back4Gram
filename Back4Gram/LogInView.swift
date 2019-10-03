//
//  LogInView.swift
//  Back4Gram
//
//  Created by Venom on 28/08/19.
//  Copyright © 2019 Venom. All rights reserved.
//

import SwiftUI
import SwiftKeychainWrapper

struct LogInView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    @State private var showingAlert = false

    var body: some View {
        NavigationView {
            VStack{
                Image("logo-social")
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 150, height: 150)
                     .clipShape(Circle())
                     .overlay(Circle().stroke(Color.white, lineWidth: 2))
                     .shadow(radius: 5)
                     .padding(.bottom, 75)
                
                Text("Log In")
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
                
                Button(action: {
                    // Check if there is a Password typed
                    if (self.password.count == 0 || self.username.count == 0){
                        
                        // If not, we must show the Alert
                        myMessage.alertText = "You must provide an Username and Password."
                        myMessage.alertTitle = "Oops..."
                        self.showingAlert = true
                    } else {
                        // If so, we can proceed
                        
                        // Perform the LogInUser mutation, passing the parameters we just got from our TextFields
                        apollo.perform(mutation: LogInUserMutation(username: self.username, password: self.password)){ result in
                            // Let's switch the result so we can separate a successful one from an error
                            switch result {
                                // In case of success
                                case .success(let graphQLResult):
                                    // We try to parse our result
                                    if let sessionToken = graphQLResult.data?.users?.logIn.sessionToken {
                                        myMessage.alertTitle = "Yay!"
                                        myMessage.alertText = "User signed in!"
                                        
                                        self.showingAlert = true

                                        print ("User sessionToken " + sessionToken)
                                        
                                        let _: Bool = KeychainWrapper.standard.set(sessionToken, forKey: "Back4Gram.sessionToken")
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
                    }
                }){
                    Text("Log In!")
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
                
                Button(action: {
                    // Check if there is sessionToken storeStringhould only log out if logged in.
                    if (KeychainWrapper.standard.string(forKey: "Back4Gram.sessionToken") != nil) {
                        print("Found sessionToken! We can logout.")
                        
                        // Perform the LogInUser mutation, passing the parameters we just got from our TextFields
                        apollo.perform(mutation: LogOutUserMutation()){ result in
                            // Let's switch the result so we can separate a successful one from an error
                            switch result {
                                // In case of success
                                case .success(let graphQLResult):
                                    // We try to parse our result
                                    if let result = graphQLResult.data?.users?.logOut {
                                        if (result) {
                                            myMessage.alertTitle = "Yay!"
                                            myMessage.alertText = "User logged out!"
                                            
                                            self.showingAlert = true
                                            
                                            // Clear the stored sessionToken
                                            let _: Bool = KeychainWrapper.standard.set("", forKey: "Back4Gram.sessionToken")
                                        } else {
                                            myMessage.alertTitle = "Oops!"
                                            myMessage.alertText = "User logout operation returned False."
                                            self.showingAlert = true
                                        }
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
                    } else {
                        // Network or response format errors
                        myMessage.alertTitle = "Oops!"
                        myMessage.alertText = "The user does not seem to be logged in."
                        self.showingAlert = true
                    }
                 }){
                    Text("Log Out")
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
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
