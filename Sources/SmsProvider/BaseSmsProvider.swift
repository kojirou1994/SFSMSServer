//
//  File.swift
//  SFSmsServer
//
//  Created by Sean on 16/7/26.
//
//

import Foundation

//短信提供者
public protocol BaseSmsProvider{
    
    mutating func sendSms()
    
    mutating func receiveSms()
    
    mutating func smsRecord()
}
