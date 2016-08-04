//
//  SMSType.swift
//  SFSmsServer
//
//  Created by Kojirou on 16/8/4.
//
//

import Foundation
import SFMongo

public enum SMSType: Int, JSONStringConvertible, BSONStringConvertible {
    
    ///普通短信
    case normal = 0
    
    ///个性化短信
    case personal = 1
    
    ///语音短信
    case audio = 2
    
    public var bsonString: String {
        return self.rawValue.description
    }
    
    public var jsonString: String {
        return self.rawValue.description
    }
}
