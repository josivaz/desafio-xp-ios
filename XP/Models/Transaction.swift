//
//  Transaction.swift
//  XP
//
//  Created by Josielle Vaz on 21/07/22.
//

import Foundation

struct Transaction {
    
    enum TransactionType: String {
        case buy = "b"
        case sell = "s"
    }
    
    let userId: Int
    let ticker: String
    let amount: Int
    let price: Decimal
    let date: Date
    let type: TransactionType
}
