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

class User: Object, Mappable {
    
    dynamic var id: String = NSUUID().UUIDString
    dynamic var authenticated: Bool = false
    dynamic var userId: Int = -1
    dynamic var emailAddress: String?
    dynamic var userName: String?

    override static func primaryKey() -> String? {
        return "id"
    }
    
    //MARK: Mappable
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        authenticated   <- map["authenticated"]
        userId          <- map["userId"]
        emailAddress    <- map["emailAddress"]
        userName        <- map["userName"]
    }
}
