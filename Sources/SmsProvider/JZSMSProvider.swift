//
//  JZSMSProvider.swift
//  SFSMSServer
//
//  Created by Sean on 16/7/26.
//
//

import Foundation
import Models
import SFCurl

struct JZPath {
    ///普通短信
    static let normalSMS = "http://www.jianzhou.sh.cn/JianzhouSMSWSServer/http/sendBatchMessage"
    
    
    ///语音短信
    static let audioSMS = "http://www.jianzhou.sh.cn/JianzhouSMSWSServer/http/sendAudio"
    
    
    ///个性化短信
    static let personalSMS = "http://www.jianzhou.sh.cn/JianzhouSMSWSServer/http/sendPersonalMessages"
    
    ///验证用户
    static let validateUser = "http://www.jianzhou.sh.cn/JianzhouSMSWSServer/http/validateUser"
    
    ///修改密码
    static let modifyPassword = "http://www.jianzhou.sh.cn/JianzhouSMSWSServer/http/modifyPassword"
    
    ///获取用户信息
    static let getUserInfo = "http://www.jianzhou.sh.cn/JianzhouSMSWSServer/http/getUserInfo"
    
}

struct JZAccount {
    let account: String
    let password: String
    static let `default` = JZAccount(account: "", password: "")
}

public struct JZSMSProvider: SMSPublishable {

    public let sms: SMSInfo
    
    public var completion: ((String?) -> ())?
    
    public init(sms: SMSInfo, completion: ((String?) -> ())? = nil) {
        self.sms = sms
        self.completion = completion
        
    }
    
    public func send() {
        var request = SFURLRequest(url: JZPath.normalSMS)
        
        request.httpMethod = .post
        request.setValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        
        var parameter = "account=\(JZAccount.default.account)&password=\(JZAccount.default.password)&destmobile=\(sms.send_mobile)&msgText=\(sms.content)"
        if sms.send_time != nil {
            parameter += "&sendDateTime=\(sms.send_time)"
        }
        
        request.httpBody = parameter
        
        do {
            let response = try SFURLConnection.send(request: request)
//            print(response.bodyString)
            self.completion?(response.bodyString)
        }catch {
            self.completion?(nil)
        }
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if error == nil, let data = data {
//                self.completion?(String(data: data, encoding: .utf8))
//            }else {
//                self.completion?(nil)
//            }
//        }.resume()
    }
}

extension Dictionary {
    var queryParameters: String {
        var parts = [String]()
        for (key, value) in self {
            let part = String(format: "%@=%@", key as! CVarArg, value as! CVarArg)
            parts.append(part)
        }
        return parts.joined(separator: "&")
    }
    

}
