import PerfectHTTPServer
import PerfectLib
import PerfectHTTP
import SFMongo
import SFJSON
import Models
import MongoDB
import Helpers
import Foundation
import SMSProvider

let server = HTTPServer()

var routes = Routes()

Log.logger = SysLogger()

routes.add(method: .post, uri: "sms", handler: SMSHandler.smsPost)

routes.add(method: .get, uri: "sms/{smsId}", handler: SMSHandler.smsGet)

routes.add(method: .get, uri: "test", handler: {_,response in
    response.status = .ok
    Log.info(message: "GET TEXT")
    response.completed()
})

server.addRoutes(routes)

server.serverPort = 8181

server.documentRoot = "./webroot"

do {
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("Network error thrown: \(err) \(msg)")
}
