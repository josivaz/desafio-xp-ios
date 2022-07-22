//
//  StockService.swift
//  XP
//
//  Created by Josielle Vaz on 21/07/22.
//

import Foundation

struct StockService {
    
    func getAllTickers(callback: (([Stock]) -> Void)) {
        callback(MockDataBase.stocks)
        
    }
    
    func getMyStocks(userId: Int, callback: ((([String]) -> Void))) {
        let userTransactions = MockDataBase.transactions.filter{ $0.userId  == userId}
            .map { $0.ticker}
        
        callback(userTransactions)
    }
}
