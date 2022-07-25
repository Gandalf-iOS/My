//
//  RegistrationViewController.swift
//  Davaleba 14 Tornike Pantsulaia
//
//  Created by Tornike Pantsulaia on 25.07.22.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    var closure1: ((String, String, String) -> Void)?
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func signUp(_ sender: Any) {
        if textField1.text != nil && textField1.text != "" && textField2.text != nil && textField2.text != "" && textField3.text != nil && textField3.text != "" && textField4.text != nil && textField4.text != "" {
            if textField3.text != textField4.text {
                let alertController = UIAlertController(title: "error", message: "passwords doesn't match", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel)
                alertController.addAction(action)
                self.navigationController?.present(alertController, animated: true)
            } else {
                closure1?(textField1.text!, textField2.text!, textField3.text!)
                navigationController?.popViewController(animated: true)
            }
        } else {
            let alertController = UIAlertController(title: "error", message: "fill all fields", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(action)
            self.navigationController?.present(alertController, animated: true)
        }
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
