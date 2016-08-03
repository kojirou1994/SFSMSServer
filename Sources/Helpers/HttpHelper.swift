//
//  HttpHelper.swift
//  SFSMSServer
//
//  Created by Sean on 16/7/26.
//
//

import Foundation

public class HttpHelper {
    
    let uri = "http://www.baidu.com"
    
    func postRequest() {
        
        var request = URLRequest(url: URL(string: uri)!)
        request.httpMethod = "POST"
        let param = [
            "id": 13,
            "name": "Jack"
        ]
        do{
            let requestBody = try JSONSerialization.data(withJSONObject: param, options: .prettyPrinted)
            request.httpBody = requestBody
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                    return
                }
                switch response.statusCode {
                case 200:
                    print(String(data: data, encoding: .utf8))
                default:
                    print("statusCode should be 200, but is \(response.statusCode)")
                    print("response: \(response)")
                }
            })
            task.resume()
        }catch let error as NSError {
            
        }
    }
    
    
}
