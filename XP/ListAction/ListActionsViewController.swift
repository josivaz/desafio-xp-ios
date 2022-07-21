//
//  ListActionsViewController.swift
//  XP
//
//  Created by Josielle Vaz on 21/07/22.
//

import UIKit

class ListActionsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "StockTableViewCell", bundle: nil), forCellReuseIdentifier: "cellStockId")
        tableView.dataSource = self
        
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellStockId") as! StockTableViewCell
        cell.nameLabel.text = "Petrobras"
        return cell
    }
    
}
