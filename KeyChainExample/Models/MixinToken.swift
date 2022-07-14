//
//  MixinToken.swift
//  KeyChainExample
//
//  Created by kevin on 2022/7/14.
//

import Foundation

struct MixinToken: Codable {
    var mx_clientID = ""
    var mx_sessionID = ""
    var mx_pinToken = ""
    var mx_privateKey = ""
    
    
    func encoded() -> String {
        let encoder = JSONEncoder()
        let tokenData = try! encoder.encode(self)
        return String(data: tokenData, encoding: .utf8)!
    }
    
    static func decode(_ tokenString: String) -> MixinToken {
        let decoder = JSONDecoder()
        let jsonData = tokenString.data(using: .utf8)
        return try! decoder.decode(MixinToken.self, from: jsonData!)
    }
}
