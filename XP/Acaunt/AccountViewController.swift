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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            userService.deposit(value: valueInput!, userId: 1) { success in
            
            }
        } else {
            userService.withdrawl(value: valueInput!, userId: 1) { success in
                
            }
        }
        
        
    }
    
}
