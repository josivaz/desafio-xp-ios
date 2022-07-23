//
//  UserService.swift
//  XP
//
//  Created by Josielle Vaz on 23/07/22.
//

import Foundation

struct UserService {
    func login(email: String, senha:String, callback:(User?)->Void) {
        // para teste, senha sempre será 12345
        guard let user = MockDataBase.users.first(where: { $0.email == email }),
              senha == "12345"
        else {
            callback(nil)
            return
        }
        
        callback(user)
    }
    
    func getUserById(id: Int, callback: (User?)->Void) {
        let user = MockDataBase.users.first(where: { $0.id == id })
        callback(user)
    }
    
    func deposit(value:Decimal, userId:Int, callback:((Bool)->Void)){
        guard let index = MockDataBase.users.firstIndex(where: { $0.id == userId }) else {
            callback(false)
            return
        }
        
        MockDataBase.users[index].balance += value
        callback(true)
    }
    
    func withdrawl(value:Decimal, userId:Int, callback:((Bool)->Void)) {
        guard let index = MockDataBase.users.firstIndex(where: { $0.id == userId }) else {
            callback(false)
            return
        }
        
        let user = MockDataBase.users[index]
        if user.balance >= value {
            MockDataBase.users[index].balance -= value
            callback(true)
        } else {
            callback(false)
        }
    }
}
