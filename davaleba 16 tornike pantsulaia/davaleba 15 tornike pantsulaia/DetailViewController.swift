//
//  DetailViewController.swift
//  davaleba 15 tornike pantsulaia
//
//  Created by Tornike Pantsulaia on 25.07.22.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!

    @IBOutlet weak var collectionView: UICollectionView!
    
    var movie: Movie?
    var sotringMovies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        label8.text = movie?.genre.rawValue
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sotringMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        cell.label1.text = sotringMovies[indexPath.row].title
        cell.label2.text = sotringMovies[indexPath.row].description
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie = sotringMovies[indexPath.row]
        label8.text = selectedMovie.genre.rawValue
        label1.text = selectedMovie.title
        label2.text = selectedMovie.releaseDate
        label3.text = "\(selectedMovie.imdb)"
        label4.text = selectedMovie.mainActor
        label5.text = selectedMovie.seen ? "nanaxi" : "sanaxavi"
        label6.text = selectedMovie.isFavourite ? "pavoriti" : "ara pavoriti"
        label7.text = selectedMovie.description
    }
}
