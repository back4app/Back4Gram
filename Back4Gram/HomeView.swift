//
//  HomeView.swift
//  Back4Gram
//
//  Created by Venom on 09/09/19.
//  Copyright © 2019 Venom. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack{
                HStack{
                    Button(action: {}){
                        Image("camera")
                        .resizable()
                        .frame(width: 30, height: 30)
                    }.padding()

                    Text("Back4Gram")
                        .font(.largeTitle)
                        .foregroundColor(lightBlueColor)
                        .fontWeight(.semibold)

                    Spacer()

                    Button(action: {}){
                        Image("home")
                        .resizable()
                        .frame(width: 30, height: 30)
                    }

                    Button(action: {}){
                        Image("paper-plane")
                        .resizable()
                        .frame(width: 30, height: 30)
                    }.padding()

                }.frame(height: 50)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        PreviewViewTop()
                        PreviewViewTop()
                        PreviewViewTop()
                        PreviewViewTop()
                        PreviewViewTop()
                        PreviewViewTop()
                    }
                }.frame(height: 70)
                
                TimelineDetailView().padding(.top, 20)
                
                BottomView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct PreviewViewTop: View {
    var body: some View {
        ZStack(alignment: .bottom){
            HStack{
                VStack {
                    Image("logo-social")
                    .resizable()
                    .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                        .overlay(Circle().stroke(Color.pink, lineWidth: 1))
                    
                    Text("Your Stories")
                        .font(.caption)
                }
            }
        }
    }
}
