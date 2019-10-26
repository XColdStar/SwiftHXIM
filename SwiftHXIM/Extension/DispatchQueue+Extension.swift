//
//  DispatchQueue+Extension.swift
//  SwiftHXIM
//
//  Created by hanxing on 2019/10/26.
//  Copyright © 2019 hanxing. All rights reserved.
//

import Foundation

extension DispatchQueue {
    static var onceTokens = [String]()
    class func once(onceToken: String, callback:()->()) {
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        if onceTokens.contains(onceToken) {
            return
        }
        onceTokens.append(onceToken)
        callback()
    }
    
    static let onceToken = UUID().uuidString
    class func onceToken(callback:()->()) {
        once(onceToken: onceToken, callback: callback)
    }
    
}
