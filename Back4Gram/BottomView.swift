//
//  BottomView.swift
//  Back4Gram
//
//  Created by Venom on 16/09/19.
//  Copyright © 2019 Venom. All rights reserved.
//

import SwiftUI

struct BottomView: View {
    var body: some View {
        HStack{
             Button(action: {}){
                 Image("home")
                 .resizable()
                 .frame(width: 30, height: 30)
             }.padding()
             
             Spacer()
             
             Button(action: {}){
                 Image("search")
                 .resizable()
                 .frame(width: 30, height: 30)
             }.padding()
             
             Spacer()
             
             Button(action: {}){
                 Image("plus-button")
                 .resizable()
                 .frame(width: 30, height: 30)
             }.padding()
             
             Spacer()
             
             Button(action: {}){
                 Image("heart")
                 .resizable()
                 .frame(width: 30, height: 30)
             }.padding()
             
             Spacer()
             
             Button(action: {}){
                 Image("user")
                 .resizable()
                 .frame(width: 30, height: 30)
             }.padding()
        }.frame(height: 35)
    }
}

struct BottomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomView()
    }
}
