//
//  Transaction.swift
//  XP
//
//  Created by Josielle Vaz on 21/07/22.
//

import Foundation

struct MockDataBase {
    static var users: [User] = [
        .init(id: 1, email: "usuario1@xpi.com", name: "Luiz Correa", balance: 5000),
        .init(id: 2, email: "usuario2@xpi.com", name: "Janete Ferreira", balance: 321.30)
    ]
    
    static let stocks: [Stock] = [
        .init(ticker: "ABEV3", name: "Ambev", price: 14.59),
        .init(ticker: "BBAS3", name: "Banco Do Brasil", price: 33.28),
        .init(ticker: "BBDC3", name: "Banco Bradesco S/A", price: 13.75),
        .init(ticker: "BBSE3", name: "BB Seguridade", price: 27.50),
        .init(ticker: "BRDT3", name: "VIBRA ENERGIA SA", price: 16.82),
        .init(ticker: "BRKM5", name: "Braskem", price: 34.78),
        .init(ticker: "BTOW3", name: "Americanas SA", price: 16.32),
        .init(ticker: "BVMF3", name: "BM&F Bovespa", price: 10.03),
        .init(ticker: "CCRO3", name: "CCR", price: 11.94),
        .init(ticker: "CMIG4", name: "Cia Energetica de Minas Gerais", price: 10.45),
        .init(ticker: "CPFE3", name: "CPFL Energia", price: 31.60),
        .init(ticker: "CSAN3", name: "Cosan USA", price: 17.23),
        .init(ticker: "CSNA3", name: "Companhia Siderurgica Nacional", price: 13.84),
        .init(ticker: "EGIE3", name: "Engie Brasil Energia SA", price: 41.80),
        .init(ticker: "ELET3", name: "Centrais Eletricas Brasileiras", price: 44.05),
        .init(ticker: "EQTL3", name: "Equatorial Energia", price: 22.45),
        .init(ticker: "GGBR4", name: "Gerdau", price: 23.54),
        .init(ticker: "HAPV3", name: "Hapvida Participaçoes e Investimentos SA", price: 5.81),
        .init(ticker: "HYPE3", name: "Hypermarcas", price: 39.86),
        .init(ticker: "ITSA4", name: "Itaúsa", price: 8.35),
        .init(ticker: "ITUB4", name: "Itaú Unibanco", price: 22.55),
        .init(ticker: "JBSS3", name: "JBS", price: 30.02),
        .init(ticker: "KLBN1", name: "Klabin SA", price: 18.50),
        .init(ticker: "LREN3", name: "Lojas Renner", price: 25.07),
        .init(ticker: "MGLU3", name: "Magazine Luiza SA", price: 2.78),
        .init(ticker: "NTCO3", name: "Natura & Co Holding SA", price: 15.65),
        .init(ticker: "PETR3", name: "Petrobras", price: 30.31),
        .init(ticker: "RADL3", name: "Raia Drogasil", price: 20.85),
        .init(ticker: "RDOR3", name: "Rede D'Or", price: 26.71),
        .init(ticker: "RENT3", name: "Localiza Rent A", price: 54.40),
        .init(ticker: "RUMO3", name: "Rumo Logistica", price: 15.34),
        .init(ticker: "SANB1", name: "Banco Santander", price: 27.15),
        .init(ticker: "SBSP3", name: "Compania Sanea", price: 43.21),
        .init(ticker: "SUZB3", name: "Suzano Papel e Celulose SA", price: 43.94),
        .init(ticker: "TOTS3", name: "TOTVS SA", price: 23.26),
        .init(ticker: "VALE3", name: "Vale S.A", price: 68.37),
        .init(ticker: "WEGE3", name: "Weg S/A", price: 26.55)
    ]
    
    
    static let transactions: [Transaction] = [
        .init(userId: 1, ticker: "ABEV3", amount: 20, price: 14.50, date: try! Date("2022-07-20T13:15:00Z-03:00", strategy: .iso8601), type: .buy),
        .init(userId: 1, ticker: "SUZB3", amount: 14, price: 44.00, date: try! Date("2022-07-20T14:15:00Z-03:00", strategy: .iso8601), type: .buy),
        .init(userId: 1, ticker: "ABEV3", amount: 10, price: 14.50, date: try! Date("2022-07-20T16:35:00Z-03:00", strategy: .iso8601), type: .sell),
        .init(userId: 2, ticker: "ABEV3", amount: 20, price: 26.45, date: try! Date("2022-07-20T16:25:00Z-03:00", strategy: .iso8601), type: .buy)
    ]
}
