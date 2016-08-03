//
//  SmsProvider.swift
//  SFSmsServer
//
//  Created by sean on 16/7/19.
//
import Foundation
import



public struct SmsProvider:SFModel{
    
    var _id:ObjectId
    //名称
    var title:String
    //链接帐号
    var account:Array<SmsProviderAccount>
    //余额
    var balance:String?
    //签名
    var signature:String?
    //提过提供商发送的总条数
    var total_send_sms:Int
    //提供商接口
    var server:ProviderServer?
    
    public init(json:JSON) {

    }
}


public struct SmsProviderAccount:SFModel{
    //账户类型
    var account_type:SmsType
    //用户名
    var account:String
    //密码
    var password:String
    
    public init(json:JSON) {
    }
}



public enum MethodType:String{
    case get = "get"
    case post = "post"
}

public struct ProviderServer:SFModel{
    //功能
    var title:String
    //
    var request_method:MethodType
    //接口入口
    var provider_server:String
    //接口参数
    var server_params:Array<String>
    //
    var record_code:CustomStringConvertible?
    
    public init(json:JSON) {
        
    }
}
