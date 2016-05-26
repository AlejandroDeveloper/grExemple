//
//  UserDao.swift
//  GrifolsPoC
//
//  Created by Enric Busquet on 14/04/16.
//  Copyright © 2016 everis. All rights reserved.
//

import Foundation
import RealmSwift

class UserDao {
    
    // Singleton instance
    static let sharedInstance = UserDao()

    
    //MARK: Public methods
    
    /**
     Persists user in db
     
     - parameter user: The User to persist
     
     - returns: true if saved to db, false otherwise
     */
    func saveUser(user: User) -> Bool {
        print("\(#function)")

        self.cleanUsers()
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(user)
        }
        
        return true
    }
    
    /**
     Gets the authenticated User from database
     
     - returns: The User? from database
     */
    internal func loggedUser() -> User? {
        return try! Realm().objects(User).first
    }
        
    /**
     Removes any user object from db
     */
    internal func cleanUsers() -> Void {
        print("\(#function)")

        let realm = try! Realm()
        try! realm.write {
            realm.delete(realm.objects(User))
        }
    }

    /**
     Returns whether the user is authenticated or not
     
     - parameter user: The User
     
     - returns: true if user is authenticated, false otherwise
     */
    internal func authenticatedFor(user: User?) -> Bool {
        print("\(#function)")

        var authenticated = false
        
        if user == nil {
            // Return value for first element in User table
        }
        else
        {
            authenticated = (user?.authenticated)!
        }
        
        return authenticated
    }
    
    /**
     Returns the user id
     
     - parameter user: The User
     
     - returns: The user id for the specified User
     */
    internal func userIdFor(user: User?) -> Int {
        return (user!.userId ?? -1)
    }

    /**
     Returns the userName
     
     - parameter user: The User
     
     - returns: The userName for the specified User
     */
    internal func userNameFor(user: User?) -> String {
        return (user!.userName ?? "")
    }
    
    /**
     Returns the emailAddress for the user
     
     - parameter user: The User
     
     - returns: The emailAddress for the specified User
     */
    internal func emailAddressFor(user: User?) -> String {
        return (user!.emailAddress ?? "")
    }
}
