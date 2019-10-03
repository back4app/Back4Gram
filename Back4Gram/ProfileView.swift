//
//  ProfileView.swift
//  Back4Gram
//
//  Created by Venom on 11/09/19.
//  Copyright © 2019 Venom. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading){
                HStack{
                    Text("username")
                    .foregroundColor(lightBlueColor)
                        .fontWeight(.semibold)
                        .padding(.leading, 10)
                    
                    Button(action: {}){
                        Image("arrow-down")
                        .resizable()
                        .frame(width: 10, height: 10)
                    }
                    .padding(.top, 5)
                    
                    Spacer()
                    
                    Button(action: {}){
                        Image("menu")
                        .resizable()
                        .frame(width: 20, height: 20)
                    }.padding()
                    
                }.frame(height: 50)
                .padding(.leading, 10)
                
                HStack{
                    VStack{
                        Image("logo-social")
                        .resizable()
                        .frame(width: 90, height: 90)
                            .clipShape(Circle())
                            .shadow(radius: 3)
                            .overlay(Circle().stroke(Color.pink, lineWidth: 1))
                        
                        Text("Your Name")
                            .foregroundColor(lightBlueColor)
                            .fontWeight(.semibold)
                    }.padding(.leading, 10)
                    
                    VStack{
                        Text("10")
                        .font(.system(size: 30))
                        .foregroundColor(lightBlueColor)
                        .fontWeight(.bold)
                        
                        Text("Publications")
                        .font(.system(size: 13))
                        .foregroundColor(lightBlueColor)
                    }.padding(.leading, 30)
                    
                    VStack{
                        Text("100")
                        .font(.system(size: 30))
                        .foregroundColor(lightBlueColor)
                        .fontWeight(.bold)
                        
                        Text("Followers")
                        .font(.system(size: 13))
                        .foregroundColor(lightBlueColor)
                    }.padding()
                    
                    VStack{
                        Text("1000")
                        .font(.system(size: 30))
                        .foregroundColor(lightBlueColor)
                        .fontWeight(.bold)
                        
                        Text("Following")
                        .font(.system(size: 13))
                        .foregroundColor(lightBlueColor)
                    }
                    
                }.frame(height: 100)
                .padding(.leading, 10)
                
                Button(action: {}){
                    Text("Edit Profile")
                    .fontWeight(.bold)
                    .foregroundColor(lightBlueColor)
                }.frame(width: 400)
                .padding()
                
                Divider()
                
                TimelineView().padding(.leading, 10)
                
                Divider()
                
                BottomView()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
