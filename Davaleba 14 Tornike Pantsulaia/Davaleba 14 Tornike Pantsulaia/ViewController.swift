//
//  ViewController.swift
//  Davaleba 14 Tornike Pantsulaia
//
//  Created by Tornike Pantsulaia on 25.07.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    var regUserName: String?
    var regEmail: String?
    var regPassword: String?

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.layer.cornerRadius = 12
        button2.layer.cornerRadius = 12

    }
    @IBAction func signIn(_ sender: Any) {
        if regUserName == textField1.text && regPassword == textField2.text {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            vc.regUserName = regUserName
            vc.regEmail = regEmail
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let alertController = UIAlertController(title: "error", message: "incorrect credentials", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(action)
            self.navigationController?.present(alertController, animated: true)
        }
    }
    @IBAction func signUp(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        vc.closure1 = { username, email, password in
            self.regUserName = username
            self.regEmail = email
            self.regPassword = password
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

