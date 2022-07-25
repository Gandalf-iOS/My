//
//  ConfirmViewController.swift
//  Davaleba 14 Tornike Pantsulaia
//
//  Created by Tornike Pantsulaia on 25.07.22.
//

import UIKit

class ConfirmViewController: UIViewController {
    var closure1: (()->Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func yes(_ sender: Any) {
        closure1?()
    }
    @IBAction func no(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
