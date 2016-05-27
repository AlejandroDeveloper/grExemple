//
//  User.swift
//  GrifolsPoC
//
//  Created by Enric Busquet on 14/04/16.
//  Copyright © 2016 everis. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

@IBDesignable public class User: Object, Mappable {
    
    dynamic var id: String = NSUUID().UUIDString
    dynamic var authenticated: Bool = false
    dynamic var userId: Int = -12
    dynamic var emailAddress: String?
    dynamic var userName: String?

    override public static func primaryKey() -> String? {
        return "id"
    }
    
    //MARK: Mappable
    required convenience public init?(_ map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        authenticated   <- map["authenticated"]
        userId          <- map["userId"]
        emailAddress    <- map["emailAddress"]
        userName        <- map["userName"]
    }
}
