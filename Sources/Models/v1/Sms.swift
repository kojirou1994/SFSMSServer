
//短信发送状态
public enum recordType:Int{
    case wait = 100
    case success = 200
    case fild = 400
    case other = 500
}

public struct SmsInfo:SFModel{
    
    var _id:ObjectId
    //来源
    var source:SourceType
    //发送至的手机号
    var send_mobile:String
    //标题
    var title:String?
    //短信内容
    var content:String
    //类型
    var sms_type:SmsType
    //短信提供商
    var sms_provider:SmsProvider
    //短信发送状态
    var record_type:recordType
    //创建时间
    var create_time:Date
    //发送时间
    var send_date_time:Date?
    //回调时间
    var recrod_date_time:Date?
    //发送成功回调id
    var send_success_sms_id:String?
    //发送失败回调原因
    var send_error_discrption:String?
    
    public init(json: JSON) {

    }
}
