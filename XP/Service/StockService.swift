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
    
    func getMyStocks(userId: Int, callback: ((([Stock]) -> Void))) {
        // pega as transações do usuario
        let userTransactions = MockDataBase.transactions.filter{ $0.userId  == userId}
        
        // converte na estrutura de ações
        let myStocks = MockDataBase.stocks.filter { stock in
            return userTransactions.contains(where: { $0.ticker == stock.ticker})
        }.map { stock -> Stock in
            let count = userTransactions
                .filter { $0.ticker == stock.ticker } // transações de uma ação
                .reduce(0, { $0 + $1.amount }) // quantidade de papeis
            return Stock(ticker: stock.ticker, name: stock.name, price: stock.price, quantity: count)
        }
        .filter { $0.quantity! > 0 } // somente ações com mais de 0 papeis comprados
        
        callback(myStocks)
    }
    
    func buy(ticker: String, userId: Int, price: Decimal, quantity: Int, callback: ((Bool) ->Void)) {
        let transaction = Transaction(userId: userId, ticker: ticker, amount: quantity, price: price, date: Date(), type: .buy)
        MockDataBase.transactions.append(transaction)
        callback(true)
    }
    
    func sell(ticker: String, userId: Int, price: Decimal, quantity: Int, callback: ((Bool) ->Void)) {
        let transaction = Transaction(userId: userId, ticker: ticker, amount: -quantity, price: price, date: Date(), type: .sell)
        MockDataBase.transactions.append(transaction)
        callback(true)
    }
}
