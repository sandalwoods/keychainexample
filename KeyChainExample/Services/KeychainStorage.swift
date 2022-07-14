//
//  KeychainStorage.swift
//  KeyChainExample
//
//  Created by kevin on 2022/7/14.
//

import Foundation
import SwiftKeychainWrapper

enum KeychainStorage {
    static let key = "mx_token"
    
    static func getToken() -> MixinToken? {
        if let myTokenString = KeychainWrapper.standard.string(forKey: Self.key) {
            return MixinToken.decode(myTokenString)
        } else {
            return nil
        }
    }
    
    static func saveToken(_ token: MixinToken) -> Bool {
        if KeychainWrapper.standard.set(token.encoded(), forKey: self.key) {
            return true
        } else {
            return false
        }
    }
}


