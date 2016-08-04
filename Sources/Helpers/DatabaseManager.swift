//
//  DatabaseManager.swift
//  SFSmsServer
//
//  Created by Kojirou on 16/8/4.
//
//

import SFMongo
import MongoDB
import Models

public struct DatabaseManager {
    
    let client: MongoClient
    
//    let logCol: MongoCollection
    
    let smsCol: MongoCollection
    
    public static let `default` = {
        return try! DatabaseManager(mongodb: "mongodb://localhost", database: "SMS")
    }()
    
    init(mongodb: String, database: String) throws {
        client = try MongoClient(uri: mongodb)
        smsCol = client.getCollection(databaseName: database, collectionName: "sms")
    }
}


// MARK: - SMS

extension DatabaseManager {
    
    public func insert(sms: SMSInfo) {
        _ = smsCol.insert(document: try! BSON(json: sms.bsonString))
    }
    
    public func update(sms: SMSInfo) {
        _ = smsCol.save(document: try! BSON(json: sms.bsonString))
    }
    
    ///设置推送是否成功
//    func set(success: Bool, forNotification: ObjectId) {
//        let update = try! BSON(json: "{\"$set\": {\"success\": \(success)}}")
//        let selector = BSON()
//        _ = selector.append(key: "_id", oid: ObjectId.parse(oid: forNotification.id))
//        _ = notiCol.update(update: update, selector: selector)
//    }
    
    ///获取指定Notification
    public func sms(_ bySMSId: String) -> SMSInfo? {
        let query = BSON()
        _ = query.append(key: "_id", oid: ObjectId.parse(oid: bySMSId))
        do {
            return try smsCol.find(query: query)?.map{return try SMSInfo(json: JSON.parse($0.asString))}.first
        }catch {
            return nil
        }
    }
    
    ///根据query查询Notification
    public func smss(_ query: BSON) -> [SMSInfo]? {
        do {
            return try smsCol.find(query: query)?.map{return try SMSInfo(json: JSON.parse($0.asString))}
        }catch {
            return nil
        }
    }
}


// MARK: - SMSProvider

extension DatabaseManager {
    
}
