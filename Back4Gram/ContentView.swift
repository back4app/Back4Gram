//
//  ContentView.swift
//  Back4Gram
//
//  Created by Venom on 22/08/19.
//  Copyright © 2019 Venom. All rights reserved.
//

import SwiftUI
import Apollo

struct ContentView : View {
    var body: some View {
        //ProfileView()
        HomeView()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
