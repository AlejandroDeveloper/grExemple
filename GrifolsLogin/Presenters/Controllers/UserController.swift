//
//  UserController.swift
//  GrifolsPoC
//
//  Created by Enric Busquet on 14/04/16.
//  Copyright © 2016 everis. All rights reserved.
//

import Foundation

class UserController {
    
    // Singleton instance
    static let sharedInstance = UserController()
    
    private let dao: UserDao = UserDao.sharedInstance
    

    // MARK: Public Methods
    
    /**
     Gets the authenticated User from database
     
     - returns: The User? from database
     */
    func loggedUser() -> User? {
        return dao.loggedUser()
    }

    /**
     Calls the dao to persist the User to tb
     
     - parameter user: The User to persist
     
     - returns: true if user persisted, false otherwise
     */
    func saveUser(user: User) -> Bool {
        guard self.isValidUser(user) else {
            return false
        }
        
        return dao.saveUser(user)
    }
    
    /**
     Removes any user object from db
     */
    func cleanUsers() -> Void {
        dao.cleanUsers()
    }
    
    
    // MARK: Private methods
    
    /**
     Checks if user is valid (userId != -1 and userName not empty)
     
     - parameter user: The User to process
     
     - returns: true if valid, false otherwise
     */
    private func isValidUser(user: User) -> Bool {
        print("\(#function)")
        
        guard user.userId != -1 && !((user.userName?.isEmpty)!) else {
            print("Invalid user: userId -> \(user.userId), userName -> \(user.userName ?? "")")
            return false
        }
        
        return true
    }

    
    // MARK: Entity fields
    
    /**
     Returns whether the user is authenticated or not
     
     - parameter user: The User
     
     - returns: true if user is authenticated, false otherwise
     */
    func isAuthenticated(user: User?) -> Bool {
        return (dao.authenticatedFor(user))
    }
    
    /**
     Returns the user id
     
     - parameter user: The User
     
     - returns: The user id for the specified User
     */
    func userIdFor(user: User?) -> Int {
        return (user!.userId)
    }
    
    /**
     Returns the userName
     
     - parameter user: The User
     
     - returns: The userName for the specified User
     */
    func userNameFor(user: User?) -> String {
        return (user!.userName ?? "")
    }
    
    /**
     Returns the emailAddress for the user
     
     - parameter user: The User
     
     - returns: The emailAddress for the specified User
     */
    func emailAddressFor(user: User?) -> String {
        return (user!.emailAddress ?? "")
    }
}
