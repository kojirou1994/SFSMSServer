import Foundation
import Models

public protocol SMSPublishable {
    
    var sms: SMSInfo {get}
    
//    var provider: SMSProvider {get}
    
    var completion: ((String?) -> ())? {set get}
    
    init(sms: SMSInfo, completion: ((String?) -> ())?)
    
    func send()
    
    
//    func receiveSMS()
    
//    func smsRecord()
}
