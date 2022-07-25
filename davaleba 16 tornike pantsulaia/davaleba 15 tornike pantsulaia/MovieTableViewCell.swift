//
//  MovieTableViewCell.swift
//  davaleba 15 tornike pantsulaia
//
//  Created by Tornike Pantsulaia on 25.07.22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    var closure1: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func change(_ sender: Any) {
        closure1?()
    }
}
