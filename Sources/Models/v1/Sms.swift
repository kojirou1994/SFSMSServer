import Foundation
import SFMongo

///短信发送状态
public enum RecordType: Int {
    
    case wait = 100
    
    case success = 200
    
    case fild = 400
    
    case other = 500
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
    var sms_provider: SMSProvider
    
    ///短信发送状态
    var record_type: RecordType
    
    ///创建时间
    var create_time: Date
    
    ///发送时间
    var send_date_time: Date?
    
    ///回调时间
    var recrod_date_time: Date?
    
    ///发送成功回调id
    var send_success_sms_id: String?
    
    ///发送失败回调原因
    var send_error_discrption: String?
    
    public init(json: JSON) throws {
        guard let id = json["_id"].oid, let send_mobile = json["send_mobile"].string, let content = json["content"].string, let sms_type = SMSType(rawValue: json["sms_type"].intValue) else {
            throw SFMongoError.invalidData
        }
        throw SFMongoError.invalidData
    }
}
