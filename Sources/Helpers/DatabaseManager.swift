//
//  DatabaseManager.swift
//  SFSmsServer
//
//  Created by Kojirou on 16/8/4.
//
//

import SFMongo
import SFJSON
import MongoDB
import Models

public class DatabaseManager {
    
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
    
    ///获取指定SMS
    public func sms(_ bySMSId: String) -> SMSInfo? {
        let query = BSON()
        _ = query.append(key: "_id", oid: ObjectId.parse(oid: bySMSId))
        do {
            return try smsCol.find(query: query)?.map{return try SMSInfo(json: SFJSON(jsonString: $0.asString)!)}.first
        }catch {
            return nil
        }
    }
    
    ///获取第一条未发送的SMS
    public func unsendSMS() -> SMSInfo? {
        let query = BSON()
        _ = query.append(key: "state", int: SMSState.waiting.rawValue)
        do {
            return try smsCol.find(query: query, limit: 1)?.map{return try SMSInfo(json: SFJSON(jsonString: $0.asString)!)}.first
        }catch {
            return nil
        }
    }
    
    ///根据query查询Notification
    public func smss(_ query: BSON) -> [SMSInfo]? {
        do {
            return try smsCol.find(query: query)?.map{return try SMSInfo(json: SFJSON(jsonString: $0.asString)!)}
        }catch {
            return nil
        }
    }
}


// MARK: - SMSProvider

extension DatabaseManager {
    
}
