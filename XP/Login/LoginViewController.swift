//
//  LoginViewController.swift
//  XP
//
//  Created by Josielle Vaz on 20/07/22.
//

import UIKit

var users: [User] = []

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTexFild: UITextField!
    @IBOutlet weak var passwordTexFild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login(_ sender: Any) {
        guard let email = emailTexFild.text, !email.isEmpty else {
            showAlert(message: "O campo email precisa ser preenchido")
            return
        }
        
        guard let password = passwordTexFild.text, !password.isEmpty else {
            showAlert(message: "O campo senha precisa ser preenchido")
            return
        }
    }
    
    private func showAlert(message: String) {
        let alertViewController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertViewController.addAction(okAction)
        present(alertViewController, animated: true, completion: nil)
    }
}
