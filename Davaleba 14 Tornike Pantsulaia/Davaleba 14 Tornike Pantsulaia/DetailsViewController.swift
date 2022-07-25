//
//  DetailsViewController.swift
//  Davaleba 14 Tornike Pantsulaia
//
//  Created by Tornike Pantsulaia on 25.07.22.
//

import UIKit

class DetailsViewController: UIViewController {
    var regUserName: String?
    var regEmail: String?
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = regUserName
        label2.text = regEmail
    }
    @IBAction func singOut(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ConfirmViewController") as! ConfirmViewController
        vc.closure1 = {
            self.navigationController?.dismiss(animated: true) {
                self.navigationController?.popToRootViewController(animated: false)
            }
        }
        self.navigationController?.present(vc, animated: true)
    }
}
