import PerfectHTTPServer
import PerfectLib
import PerfectHTTP
import SFMongo
import MongoDB
import Helpers

let server = HTTPServer()

var routes = Routes()

routes.add(method: .get, uri: "/") { (request, response) in
    response.appendBody(string: "Hello World!")
    response.completed()
}

routes.add(method: .post, uri: "/login") { (req, res) in
    guard let appId = req.param(name: "appId"), let appKey = req.param(name: "appKey") else {
        res.status = .badRequest
        res.completed()
        return
    }
    print(appId)
    print(appKey)
    res.completed()
}

//提交日志
routes.add(method:.post,uri: "/submit"){ (request,response) in
    guard let access_token = request.param(name:"access_token") else{
        response.status = .badRequest
        response.completed()
        return
    }
    
}

routes.add(method: .get, uri: "/log/{id}") { (request, response) in
    if let logId = request.urlVariables["id"] {
        print("Log ID: \(logId)")
    }else {
        print("No Log ID")
    }
    response.setHeader(HTTPResponseHeader.Name.contentType, value: "application/json")
    response.setBody(string: "{\"data\": 123}")
    response.completed()
}


server.addRoutes(routes)

server.serverPort = 8181

server.documentRoot = "./webroot"

do {
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("Network error thrown: \(err) \(msg)")
}


func test() {

}
