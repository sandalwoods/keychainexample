//
//  KeychainStorage.swift
//  KeyChainExample
//
//  Created by kevin on 2022/7/14.
//

import Foundation
import SwiftKeychainWrapper

enum KeychainStorage {
    static let key2 = "mx_token"
    static let key = "credentials"
    
    static func getToken() -> MixinToken? {
        if let myTokenString = KeychainWrapper.standard.string(forKey: Self.key2) {
            return MixinToken.decode(myTokenString)
        } else {
            return nil
        }
    }
    
    static func saveToken(_ token: MixinToken) -> Bool {
        if KeychainWrapper.standard.set(token.encoded(), forKey: self.key2) {
            return true
        } else {
            return false
        }
    }
    
    static func getCredentials() -> Credentials? {
        if let myCredentialsString = KeychainWrapper.standard.string(forKey: Self.key) {
            return Credentials.decode(myCredentialsString)
        } else {
            return nil
        }
    }
    
    static func saveCredentials(_ credentials: Credentials) -> Bool {
        if KeychainWrapper.standard.set(credentials.encoded(), forKey: Self.key) {
            return true
        } else {
            return false
        }
    }
}


