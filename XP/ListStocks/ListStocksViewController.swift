//
//  ListActionsViewController.swift
//  XP
//
//  Created by Josielle Vaz on 21/07/22.
//

import UIKit

class ListStocksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    //Usuario fixo pq o login não está implementado
    let userId = 1
    var tickers: [Stock] = []
    var myStocks: [Stock] = []
    let service = StockService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "StockTableViewCell", bundle: nil), forCellReuseIdentifier: "cellStockId")
        tableView.dataSource = self
        tableView.delegate = self
        service.getAllTickers { stocks in
            
            self.service.getMyStocks(userId: self.userId) { myTickers in
                self.tickers = stocks.filter { !myTickers.contains($0.ticker)}
                self.myStocks = stocks.filter { myTickers.contains($0.ticker)}
                self.tableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Minhas Ações"
        } else {
            return "Disponíveis para investir"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return myStocks.count
        }else {
            return tickers.count
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as? UITableViewHeaderFooterView)?.textLabel?.textColor = .white
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellStockId") as! StockTableViewCell
        if indexPath.section == 0 {
            let stock = myStocks[indexPath.row]
            cell.nameLabel.text = stock.name
        } else {
            let ticker = tickers[indexPath.row]
            cell.nameLabel.text = ticker.name
        }
        return cell
        
    }
    
    // metodo chamado quando clica em uma celula
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // pega a acao selecionada
        var stock: Stock
        if indexPath.section == 0 {
            stock = myStocks[indexPath.row]
        } else {
            stock = tickers[indexPath.row]
        }
        
        // cria a tela de detalhe
        let detailViewController = StockDetailViewController()
        
        // atribui a acao selecionada para a tela de detalhe
        detailViewController.stock = stock
        // atribui se a acao selecionada é minha ou não
        detailViewController.myStock = indexPath.section == 0
        
        // configura tela para aparecer até a metade
        detailViewController.sheetPresentationController?.detents = [.medium()]
        
        // mostra a tela de detalhe
        present(detailViewController, animated: true, completion: nil)
    }
    
    @IBAction func accountButtonTap(_ sender: Any) {
        let accountViewController = AccountViewController()
        
        present(accountViewController, animated: true, completion: nil)
    }
}
