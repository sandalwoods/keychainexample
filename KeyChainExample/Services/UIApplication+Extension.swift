//
//  UIApplication+Extension.swift
//  KeyChainExample
//
//  Created by kevin on 2022/7/14.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
