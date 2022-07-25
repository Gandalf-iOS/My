//
//  DetailViewController.swift
//  davaleba 15 tornike pantsulaia
//
//  Created by Tornike Pantsulaia on 25.07.22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!

    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = movie?.title
        label2.text = movie?.releaseDate
        label3.text = "\(movie?.imdb ?? 1)"
        label4.text = movie?.mainActor
        label5.text = movie?.seen ?? false ? "nanaxi" : "sanaxavi"
        label6.text = movie?.isFavourite ?? false ? "pavoriti" : "ara pavoriti"
        label7.text = movie?.description
    }

    @IBAction func favorite(_ sender: Any) {
        movie?.isFavourite = true
        label6.text = "pavoriti"
    }
}
