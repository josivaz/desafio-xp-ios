//
//  AcauntViewController.swift
//  XP
//
//  Created by Josielle Vaz on 22/07/22.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var informTextField: UITextField!
    @IBOutlet weak var depositSegmentedControl: UISegmentedControl!
    @IBOutlet weak var removeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonTouchUpInside(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmTap(_ sender: Any) {
        
    }
    
}
