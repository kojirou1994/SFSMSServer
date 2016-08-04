//
//  JZSMSProvider.swift
//  SFSMSServer
//
//  Created by Sean on 16/7/26.
//
//

import Foundation
import Models

public struct JZSMSProvider: SMSPublishable {
    
    public let sms: SMSInfo
    
    public init(sms: SMSInfo) {
        self.sms = sms
    }
    
    public func send() {
       
    }
    
}
