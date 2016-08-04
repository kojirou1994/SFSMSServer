import Foundation
import SFMongo

public enum SourceType: Int {
    case jucai = 0
    case chedai = 1
}

public struct SMSInfo: SFModel {
    
    public let _id: ObjectId
    
    ///来源
    public var source: SourceType
    
    ///发送至的手机号
    public var send_mobile: String
    
    ///标题
    public var title: String?
    
    ///短信内容
    public var content: String
    
    ///类型
    public var sms_type: SMSType
    
    ///短信提供商
    public var sms_provider: ObjectId
    
    ///短信发送状态
    public var state: SMSState
    
    ///创建时间
    public var create_time: Date
    
    ///发送时间
    public var send_time: Date?
    
    ///完成时间
    public var finish_time: Date?
    
    ///发送成功回调id
    public var send_success_sms_id: String?
    
    ///发送失败回调原因
    public var send_error_description: String?
    
    public init(json: JSON) throws {
        guard let id = json["_id"].oid, let source = SourceType(rawValue: json["source"].intValue), let send_mobile = json["send_mobile"].string, let content = json["content"].string, let sms_type = SMSType(rawValue: json["sms_type"].intValue), let sms_provider = json["sms_provider"].oid, let state = SMSState(rawValue: json["state"].intValue), let create_time = json["create_time"].date else {
            throw SFMongoError.invalidData
        }
        self._id = id
        self.source = source
        self.send_mobile = send_mobile
        self.title = json["title"].string
        self.content = content
        self.sms_type = sms_type
        self.sms_provider = sms_provider
        self.state = state
        self.create_time = create_time
        self.send_time = json["send_time"].date
        self.finish_time = json["finish_time"].date
        self.send_error_description = json["send_error_description"].string
    }
}

// MARK: - New SMS

extension SMSInfo {
    
    public init(source: SourceType, send_mobile: String, title: String? = nil, content: String, sms_type: SMSType, sms_provider: ObjectId, state: SMSState = .wait) {
        self._id = ObjectId.generate()
        self.source = source
        self.send_mobile = send_mobile
        self.title = title
        self.content = content
        self.sms_type = sms_type
        self.sms_provider = sms_provider
        self.state = state
        self.create_time = Date()
    }
}
