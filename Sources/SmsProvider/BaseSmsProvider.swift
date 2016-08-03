//
//  File.swift
//  SFSMSServer
//
//  Created by Sean on 16/7/26.
//
//

import Foundation

//短信提供者
public protocol BaseSMSProvider {
    
    mutating func sendSMS()
    
    mutating func receiveSMS()
    
    mutating func smsRecord()
}
