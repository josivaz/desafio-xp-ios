//
//  StockDetailViewController.swift
//  XP
//
//  Created by Josielle Vaz on 21/07/22.
//

import UIKit

class StockDetailViewController: UIViewController {
    var stock: Stock?
    var myStock: Bool = false
    
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var qantityTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var sellButton: UIButton!
    @IBOutlet weak var companyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tickerLabel.text = stock?.ticker
        companyLabel.text = stock?.name
        sellButton.isHidden = myStock == false
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.currencyCode = "BRL"
        formatter.numberStyle = .currency
        priceLabel.text = formatter.string(from: stock!.price as NSDecimalNumber)
    }
    

}
