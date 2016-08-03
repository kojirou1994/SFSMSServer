//
//  HttpHelper.swift
//  SFSmsServer
//
//  Created by Sean on 16/7/26.
//
//

import Foundation

public class HttpHelper{
    
    var uri = "http://www.baidu.com"
    
    func postRequest() {
        
         let request = NSMutableURLRequest(URL:uri )
         request.httpMethod = "POST"
         let postString = "id=13&name=Jack"
         request.httpBody = postString.data(NSUTF8StringEncoding)
          let task = URLSession.sharedSession.dataTaskWithRequest(request) { data, response, error in
                    guard error == nil && data != nil else{                                                          // check for fundamental networking error
                        print("error=\(error)")
                        return
                    }
                    if let httpStatus = response as? NSHTTPURLResponse , httpStatus.statusCode != 200 {           // check for http errors
                        print("statusCode should be 200, but is \(httpStatus.statusCode)")
                        print("response = \(response)")
                    }
                    let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                    print("responseString = \(responseString)")
                }
                task.resume()
            }
    }
    
    
//    func postRequest()  {
//    
//       // let request = NSMutableURLRequest(URL:uri )
//        request.httpMethod = "POST"
//        
//        let postString = "id=13&name=Jack"
//        request.httpBody = postString.data(NSUTF8StringEncoding)
//        let task = URLSession.sharedSession.dataTaskWithRequest(request) { data, response, error in
//            guard error == nil && data != nil else {                                                          // check for fundamental networking error
//                print("error=\(error)")
//                return
//            }
//            
//            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
//                print("statusCode should be 200, but is \(httpStatus.statusCode)")
//                print("response = \(response)")
//            }
//            
//            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            print("responseString = \(responseString)")
//        }
//        task.resume()
//    }

//}
