import Foundation
import Models

public protocol SMSPublishable {
    
    var sms: SMSInfo {get}
    
    init(sms: SMSInfo)
    
    func send()
    
//    func receiveSMS()
    
//    func smsRecord()
}
