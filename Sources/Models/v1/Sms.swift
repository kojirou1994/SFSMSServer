import Foundation
import SFMongo

///短信发送状态
public enum SMSState: Int, JSONStringConvertible, BSONStringConvertible {
    
    case wait = 100
    
    case success = 200
    
    case fail = 400
    
    case other = 500
    
    public var jsonString: String {
        return self.rawValue.description
    }
    
    public var bsonString: String {
        return self.rawValue.bsonString
    }
}

public enum SourceType: Int {
    case ios = 0
}

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

public struct SMSInfo: SFModel {
    
    var _id: ObjectId
    
    ///来源
    var source: SourceType
    
    ///发送至的手机号
    var send_mobile: String
    
    ///标题
    var title: String?
    
    ///短信内容
    var content: String
    
    ///类型
    var sms_type: SMSType
    
    ///短信提供商
    var sms_provider: ObjectId
    
    ///短信发送状态
    var state: SMSState
    
    ///创建时间
    var create_time: Date
    
    ///发送时间
//    var send_date_time: Date?
    
    ///完成时间
    var finish_time: Date?
    
    ///发送成功回调id
    var send_success_sms_id: String?
    
    ///发送失败回调原因
    var send_error_description: String?
    
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
        self.finish_time = json["finish_time"].date
        self.send_error_description = json["send_error_description"].string
    }
}
