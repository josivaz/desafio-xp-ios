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
    @IBOutlet weak var loginButton: UIButton!
    let userService = UserService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.keyboardLayoutGuide.topAnchor.constraint(
            equalToSystemSpacingBelow: loginButton.bottomAnchor, multiplier: 1.0).isActive = true
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
        
        userService.login(email: email, senha: password) { user in
            if let user = user {
                // salva o id do usuário e vai para a tela de lista de ações
                UserDefaults.standard.set(user.id, forKey: "userId")
                navigationController?.pushViewController(ListStocksViewController(), animated: true)
            } else {
                self.showAlert(message: "Não foi possível realizar o login. Tente novamente.")
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
