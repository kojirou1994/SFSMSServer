//
//  SMSHandler.swift
//  SFSmsServer
//
//  Created by Kojirou on 16/8/4.
//
//

import Foundation
import PerfectHTTP
import PerfectLib
import SFMongo
import SFJSON
import Models
import Helpers
import SMSProvider

class SMSHandler {
    
    public class func smsPost(request: HTTPRequest, response: HTTPResponse) {
        //检查请求是否为空
        guard let bodyString = request.postBodyString else {
            Log.warning(message: "No Request Body")
            response.status = .badRequest
            response.completed()
            return
        }
        
        //将请求body转换为JSON对象
        guard let json = SFJSON(jsonString: bodyString) else {
            Log.warning(message: "请求参数不是JSON格式")
            response.status = .badRequest
            response.completed()
            return
        }
        
        guard let source = SourceType(rawValue: json["source"].intValue), let send_mobile = json["send_mobile"].string, let content = json["content"].string, let sms_type = SMSType(rawValue: json["sms_type"].intValue) else {
            response.status = .badRequest
            response.completed()
            return
        }
        
        let newSMS = SMSInfo(source: source, send_mobile: send_mobile, title: json["title"].string, content: content, sms_type: sms_type, state: .waiting)
        
        let db = DatabaseManager.default
        
        db.insert(sms: newSMS)
        
        response.status = .created
        response.setBody(string: "smsId: \(newSMS._id.jsonString)")
        response.completed()
        sendCycle()
    }
    
    public class func smsGet(request: HTTPRequest, response: HTTPResponse) {
        guard let smsId = request.urlVariables["smsid"] else {
            response.status = .notFound
            response.setBody(string: "Can not find the specific sms.")
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
    
    static var sendingSMS: Bool = false
    
    //循环检测未发送短信，逐条发送
    class func sendCycle() {
        Log.debug(message: "Start Checking Unsend SMS")
        if let unsendSMS = DatabaseManager.default.unsendSMS(), !sendingSMS {
            sendingSMS = true
            Log.debug(message: "Start Send SMS")
            
            let sender = JZSMSProvider(sms: unsendSMS) { message in
                
                var updateSMS = unsendSMS
                
                if let message = message, message.utf8.count != 0 {
                    
                    let result = JZResult.result(fromCode: message)

                    switch result {
                    case .success(taskId: let id):
                        //保存成功信息
                        updateSMS.state = .success
                        updateSMS.send_success_sms_id = id
                    default:
                        //保存失败信息
                        updateSMS.state = .failed
                        updateSMS.send_error_description = result.description
                    }
                    
                }else {
                    updateSMS.send_error_description = "原因不明"
                    updateSMS.state = .failed
                }
                updateSMS.finish_time = Date()
                DatabaseManager.default.update(sms: updateSMS)
                sendingSMS = false
                sendCycle()
            }
            sender.send()
        }else {
            Log.debug(message: "No Unsend SMS or Already Sending")
        }
    }
}
