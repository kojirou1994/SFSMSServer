//
//  SMSState.swift
//  SFSmsServer
//
//  Created by Kojirou on 16/8/4.
//
//

import Foundation
import SFMongo

///短信发送状态
public enum SMSState: Int, JSONStringConvertible, BSONStringConvertible {
    
    case waiting = 100
    
    case success = 200
    
    case failed = 400
    
    case other = 500
    
    public var jsonString: String {
        return self.rawValue.description
    }
    
    public var bsonString: String {
        return self.rawValue.bsonString
    }
}
