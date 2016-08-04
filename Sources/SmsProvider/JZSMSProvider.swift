//
//  JZSMSProvider.swift
//  SFSMSServer
//
//  Created by Sean on 16/7/26.
//
//

import Foundation
import Models

struct JZPath {
    static let normalSMS = "http://www.jianzhou.sh.cn/JianzhouSMSWSServer/http/sendBatchMessage"
    
    static let audioSMS = "http://www.jianzhou.sh.cn/JianzhouSMSWSServer/http/sendAudio"
    
    static let personalSMS = "http://www.jianzhou.sh.cn/JianzhouSMSWSServer/http/sendPersonalMessages"
    
    static let validateUser = "http://www.jianzhou.sh.cn/JianzhouSMSWSServer/http/validateUser"
    
    static let modifyPassword = "http://www.jianzhou.sh.cn/JianzhouSMSWSServer/http/modifyPassword"
    
    static let getUserInfo = "http://www.jianzhou.sh.cn/JianzhouSMSWSServer/http/getUserInfo"
    
}

public struct JZSMSProvider: SMSPublishable {

    public let sms: SMSInfo
    
    public var completion: ((String?) -> ())?
    
    public init(sms: SMSInfo, completion: ((String?) -> ())? = nil) {
        self.sms = sms
        self.completion = completion
        
    }
    
    public func send() {
        var request = URLRequest(url: URL(string: JZPath.normalSMS)!)
        
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("UTF-8", forHTTPHeaderField: "charset")
        
        var parameter = "account=&password&destmobile&msgText="
        if sms.send_time != nil {
            parameter += "&sendDateTime=20130201120000"
        }
        
        request.httpBody = parameter.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil, let data = data {
                self.completion?(String(data: data, encoding: .utf8))
            }else {
                self.completion?(nil)
            }
        }.resume()
    }
}
