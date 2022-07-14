//
//  Authentication.swift
//  KeyChainExample
//
//  Created by kevin on 2022/7/14.
//

import SwiftUI

class Authentication: ObservableObject {
    @Published var isValidated = false
    @Published var mxToken = MixinToken()
    
    enum AuthenticationError: Error, LocalizedError, Identifiable {
        case invalidCredentials
        
        var id: String {
            self.localizedDescription
        }
        
        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return NSLocalizedString("Enter your email or password are incorrect.", comment: "")
            }
        }
    }
    
    func updateValidation(success: Bool) {
        withAnimation {
            isValidated = success
            mxToken = MixinToken()
        }
    }
    
    func getMXToken() {
        let token = KeychainStorage.getToken()
        guard let tk = token else {
            return
        }
        mxToken = tk
    }
}
