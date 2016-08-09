import PerfectHTTPServer
import PerfectLib
import PerfectHTTP
import SFMongo
import MongoDB
import Helpers
import Foundation
import SMSProvider

let server = HTTPServer()

var routes = Routes()

routes.add(method: .post, uri: "/sms", handler: SMSHandler.smsPost)

routes.add(method: .get, uri: "/sms/{smsId}", handler: SMSHandler.smsGet)

server.addRoutes(routes)

server.serverPort = 8181

server.documentRoot = "./webroot"

//循环检测未发送短信，逐条发送
func sendCycle(timer: Timer) {
    timer.invalidate()
    if let unsendSMS = DatabaseManager.default.unsendSMS() {
        let sender = JZSMSProvider(sms: unsendSMS) { message in
            if let message = message {
                let result = JZResult.result(fromCode: message)
                switch result {
                case .success(taskId: let id):
                    //保存成功信息
                    unsendSMS.state = .success
                    unsendSMS.send_success_sms_id = id
                default:
                    //保存失败信息
                    unsendSMS.state = .failed
                    unsendSMS.send_error_description = result.description
                }
                
            }else {
                sms.send_error_description = "原因不明"
                sms.state = .fail
            }
            sms.finish_time = Date()
            DatabaseManager.default.update(sms: unsendSMS)
            sendCycle(timer: timer)
        }
        sender.send()
    }else {
        timer.fire()
    }
}

let checkUnsendSMSTimer = Timer.scheduledTimer(withTimeInterval: 300, repeats: true, block:sendCycle)

do {
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("Network error thrown: \(err) \(msg)")
}
