//
//  ContentView.swift
//  KeyChainExample
//
//  Created by kevin on 2022/7/14.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Authorized.. You are in!!")
                    .font(.largeTitle)
                Image(systemName: "camera.macro")
                
                Text("token \(authentication.mxToken.mx_privateKey)")
                
                Button {
                    authentication.getMXToken()
                } label: {
                    Text("get token")
                }
            }
            .padding()
            .navigationTitle("My Secure App")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Logout") {
                        authentication.updateValidation(success: false)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Authentication())
    }
}
