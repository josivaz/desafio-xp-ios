//
//  StockDetailViewController.swift
//  XP
//
//  Created by Josielle Vaz on 21/07/22.
//

import UIKit

protocol StockDetailViewControllerDelegate: AnyObject {
    func transactionWithSuccess()
}

class StockDetailViewController: UIViewController {
    var stock: Stock?
    var myStock: Bool = false
    let service = StockService()
    
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var qantityTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var sellButton: UIButton!
    @IBOutlet weak var companyLabel: UILabel!
    
    weak var delegate: StockDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tickerLabel.text = stock?.ticker
        companyLabel.text = stock?.name
        sellButton.isHidden = myStock == false
        
        if let quantity = stock?.quantity {
            quantityLabel.text = "\(quantity)"
        } else {
            quantityLabel.text = "-"
        }
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.currencyCode = "BRL"
        formatter.numberStyle = .currency
        priceLabel.text = formatter.string(from: stock!.price as NSDecimalNumber)
    }
    
    @IBAction func buyStockTap(_ sender: Any) {
        let userId = UserDefaults.standard.integer(forKey: "userId")
        var priceInput: Decimal?
        
        if let text = priceTextField.text {
            priceInput = Decimal(string: text)
        } else {
            showAlert(message: "Erro ao comprar a ação.")
        }
        
        if let text = qantityTextField.text, let quantity = Int(text), let price = priceInput {
            service.buy(ticker: stock!.ticker, userId: userId, price: price, quantity: quantity) { success in
                if success {
                    self.dismiss(animated: true, completion: nil)
                    self.delegate?.transactionWithSuccess()
                    showAlert(message: "Ação comprada com sucesso.")
                }
            }
        }
    }
    
    @IBAction func sellStockTap(_ sender: Any) {
        let userId = UserDefaults.standard.integer(forKey: "userId")
        var priceInput: Decimal?
        
        if let text = priceTextField.text {
            priceInput = Decimal(string: text)
        } else {
            showAlert(message: "Erro ao vender a ação.")
        }

        if let text = qantityTextField.text, let quantity = Int(text), let price = priceInput {
            if quantity <= stock!.quantity! {
                service.sell(ticker: stock!.ticker, userId: userId, price: price, quantity: quantity) { success in
                    if success {
                        self.dismiss(animated: true, completion: nil)
                        self.delegate?.transactionWithSuccess()
                        showAlert(message: "Ação vendida com sucesso.")
                    }
                }
            } else {
                showAlert(message: "Não é possível vender mais papeis que você possui.")
            }
        }
    }
    
    private func showAlert(message: String) {
        let alertViewController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertViewController.addAction(okAction)
        present(alertViewController, animated: true, completion: nil)
    }

}
