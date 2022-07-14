//
//  KeyChainExampleApp.swift
//  KeyChainExample
//
//  Created by kevin on 2022/7/14.
//

import SwiftUI

@main
struct KeyChainExampleApp: App {
    @StateObject var authentication = Authentication()
    
    var body: some Scene {
        WindowGroup {
            if authentication.isValidated {
                ContentView()
                    .environmentObject(authentication)
            } else {
                LoginView()
                    .environmentObject(authentication)
            }
        }
    }
}
