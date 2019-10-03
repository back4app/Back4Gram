//
//  AppDelegate.swift
//  Back4Gram
//
//  Created by Venom on 22/08/19.
//  Copyright © 2019 Venom. All rights reserved.
//

import UIKit
import Apollo
import SwiftUI

struct Message {
    var alertTitle: String = ""
    var alertText: String = ""
}

var myMessage = Message()

// Apollo Client initialization.
// More about it here: https://www.back4app.com/docs/ios/swift-graphql
let apollo: ApolloClient = {
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = [
        "X-Parse-Application-Id": "YourAppIdHere",
        "X-Parse-Client-Key": "YourClientKeyHere"
    ]
    
    let url = URL(string: "https://parseapi.back4app.com/graphql")!
    
    return ApolloClient(
        networkTransport: HTTPNetworkTransport(
            url: url,
            configuration: configuration
        )
    )
}()

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
let lightBlueColor = Color(red: 36.0/255.0, green: 158.0/255.0, blue: 235.0/255.0, opacity: 1.0)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

