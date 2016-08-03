//
//  jZRecordCodeHelper.swift
//  SFSMSServer
//
//  Created by Sean on 16/7/21.
//
//

import Foundation

///建周返回码
public enum RecordCodeType: CustomStringConvertible{
    case balance_error
    case password_or_account_error
    case link_provider_error
    case time_out
    case other_error
    case message_content_error
    case dest_mobile_error
    case user_channel_error
    case try_error
    case limit_time_out
    case dest_mobile_no_permission
    case gateway_no_permission
    case channel_id_not_find
    case submit_no_permission
    case request_params_error
    case request_method_error
    case commit_limit
    case spread_params_error
    case ip_error
    case custom(code:Int, message:String)
    
    public var description:String{
        switch self {
        case .balance_error:                 return "余额不足"
        case .password_or_account_error:     return "用户名或密码错误"
        case .link_provider_error:           return "连接服务商失败"
        case .time_out:                      return "超时"
        case .other_error:                   return "其他错误"
        case .message_content_error:         return "短信内容为空"
        case .dest_mobile_error:             return "日标号码为空"
        case .user_channel_error:            return "用户通道设置不正确，需要设置三个通道"
        case .try_error:                     return "捕获未知异常"
        case .limit_time_out:                return "超过最大定时时间限制"
        case .dest_mobile_no_permission:     return "目标号码在黑名单"
        case .gateway_no_permission:         return "没有权限使用该网关"
        case .channel_id_not_find:           return "找不到对应的Channel ID"
        case .submit_no_permission:          return "提交参数名称不正确或缺少参数"
        case .request_method_error:          return "必须为POST提交"
        case .commit_limit:                  return "超速提交"
        case .spread_params_error:           return "扩展参数不正确"
        case .ip_error:                      return "IP 被停封"
        case .custom:                        return "未知错误"
        default:                             return "未知错误"
        }
    }
    
    public static func codeTypeFrom(code:Int) -> RecordCodeType {
        switch code {
        case -1: return .balance_error
        case -2: return .password_or_account_error
        case -3: return .link_provider_error
        case -5: return .other_error
        case -6: return .message_content_error
        case -7: return .dest_mobile_error
        case -8: return .user_channel_error
        case -9: return .try_error
        case -10: return .limit_time_out
        case -11: return .dest_mobile_no_permission
        case -13: return .gateway_no_permission
        case -14: return .channel_id_not_find
        case -17: return .submit_no_permission
        case -18: return .request_params_error
        case -19: return .request_method_error
        case -20: return .commit_limit
        case -21: return .spread_params_error
        case -22: return .ip_error
        default: return .custom(code: code, message:"not find")
        }
    }
}
