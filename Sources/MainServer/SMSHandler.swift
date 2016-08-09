//
//  SMSHandler.swift
//  SFSmsServer
//
//  Created by Kojirou on 16/8/4.
//
//

import Foundation
import PerfectHTTP
import SFMongo
import Models
import Helpers
import SMSProvider

class SMSHandler {
    
    class func smsPost(request: HTTPRequest, response: HTTPResponse) {
        //检查请求是否为空
        guard let bodyString = request.postBodyString else {
            print("No Request Body")
            response.status = .badRequest
            response.completed()
            return
        }
        //将请求body转换为JSON对象
        let json = JSON.parse(bodyString)
        
        guard let source = SourceType(rawValue: json["source"].intValue), let send_mobile = json["send_mobile"].string, let content = json["content"].string, let sms_type = SMSType(rawValue: json["sms_type"].intValue), let sms_provider = json["sms_provider"].oid else {
            response.status = .badRequest
            response.completed()
            return
        }
        
        var sms = SMSInfo(source: source, send_mobile: send_mobile, title: json["title"].string, content: content, sms_type: sms_type, sms_provider: sms_provider, state: .waiting)
        
        let db = DatabaseManager.default
        
        db.insert(sms: sms)
        
        response.status = .created
        response.setBody(string: "smsId: \(sms._id.jsonString)")
        response.completed()
        
    }
    
    class func smsGet(request: HTTPRequest, response: HTTPResponse) {
        guard let smsId = request.request.urlVariables["smsId"] else {
            response.completed()
            return
        }
        if let sms = DatabaseManager.default.sms(smsId) {
            response.addHeader(.contentType, value: "application/json")
            response.setBody(string:  sms.jsonString)
        }else {
            response.status = .notFound
            response.setBody(string: "Can not find the specific sms.")
        }
        response.completed()
    }
}
