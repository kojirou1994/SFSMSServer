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
        
    }
}
