//
//  LoginViewModel.swift
//  KeyChainExample
//
//  Created by kevin on 2022/7/14.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var credentials = Credentials()
    @Published var showProgressView = false
    @Published var error: Authentication.AuthenticationError?
    @Published var storeCredentialsNext = true
    
    
    var loginDisabled: Bool {
        credentials.email.isEmpty || credentials.password.isEmpty
    }
    
    func login(completion: @escaping (Bool) -> Void) {
        showProgressView = true
        
        APIService.shared.login(credentials: credentials) { [unowned self] (result: Result<Bool, Authentication.AuthenticationError>) in
            showProgressView = false
            
            switch result {
            case .success:
                if storeCredentialsNext {
                    if KeychainStorage.saveToken(MixinToken(mx_clientID: "123", mx_sessionID: "456", mx_pinToken: "789", mx_privateKey: "321")){
                        storeCredentialsNext = false
                    }
                }
                
                completion(true)
            case .failure(let authError):
                credentials = Credentials()
                error = authError
                completion(false)
            }
        }
    }
}
