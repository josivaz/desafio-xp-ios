//
//  AcauntViewController.swift
//  XP
//
//  Created by Josielle Vaz on 22/07/22.
//

import UIKit
import Foundation

class AccountViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var informTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    let userService = UserService()
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUser()
    }
    
    func getUser() {
        let userId = UserDefaults.standard.integer(forKey: "userId")
        userService.getUserById(id: userId) { user in
            self.user = user
            self.updateBalance()
        }
    }

    func updateBalance() {
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.currencyCode = "BRL"
        formatter.numberStyle = .currency

        valueLabel.text = formatter.string(from: user!.balance as NSNumber)
    }

    @IBAction func buttonTouchUpInside(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func confirmTap(_ sender: Any) {
        var valueInput: Decimal?
        
        if let text = informTextField.text {
            valueInput = Decimal(string: text)
        }

        if segmentedControl.selectedSegmentIndex == 0 {
            userService.deposit(value: valueInput!, userId: user!.id) { success in
            
                if success {
                    self.getUser()
                } else {
                    self.showAlert(message: "Erro ao depositar o dinheiro")
                }
            }
        } else {
            userService.withdrawl(value: valueInput!, userId: user!.id) { success in
                if success {
                    self.getUser()
                } else {
                    self.showAlert(message: "Erro ao sacar o dinheiro")
                }
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
