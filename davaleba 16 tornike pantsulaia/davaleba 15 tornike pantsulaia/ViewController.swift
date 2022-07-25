//
//  ViewController.swift
//  davaleba 15 tornike pantsulaia
//
//  Created by Tornike Pantsulaia on 25.07.22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var movies = [
        Movie(genre: .comedy, title: "title1", releaseDate: "releaseDate1", imdb: 1, mainActor: "mainActor1", seen: false, isFavourite: false),
        Movie(genre: .comedy,title: "title2",releaseDate: "releaseDate2",imdb: 2,mainActor: "mainActor2",seen: false,isFavourite: false
        ),
        Movie( genre: .action, title: "title3", releaseDate: "releaseDate3", imdb: 3, mainActor: "mainActor3", seen: false, isFavourite: false
        ),
        Movie( genre: .drama, title: "title4", releaseDate: "releaseDate4", imdb: 4, mainActor: "mainActor4", seen: true, isFavourite: false
        ),
        Movie( genre: .comedy, title: "title5", releaseDate: "releaseDate5", imdb: 5, mainActor: "mainActor5", seen: false, isFavourite: false
        ),
        Movie( genre: .action, title: "title6", releaseDate: "releaseDate6", imdb: 6, mainActor: "mainActor6", seen: true, isFavourite: false
        ),
        Movie( genre: .drama, title: "title7", releaseDate: "releaseDate7", imdb: 7, mainActor: "mainActor7", seen: false, isFavourite: false
        ),
        Movie( genre: .comedy, title: "title8", releaseDate: "releaseDate8", imdb: 8, mainActor: "mainActor8", seen: false, isFavourite: false
        ),
        Movie( genre: .action, title: "title9", releaseDate: "releaseDate9", imdb: 9, mainActor: "mainActor9", seen: true, isFavourite: false
        ),
        Movie( genre: .drama, title: "title10", releaseDate: "releaseDate10", imdb: 10, mainActor: "mainActor10", seen: false, isFavourite: false
        )
    ]
    
    var sortingMovies = [Movie]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sortingMovies = movies
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.sectionHeaderTopPadding = 40

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return sortingMovies.filter { $0.seen == false }.count
        } else {
            return sortingMovies.filter { $0.seen == true }.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let unseenMovies = sortingMovies.filter { $0.seen == false }
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
            cell.label1.text = unseenMovies[indexPath.row].title
            cell.label2.text = unseenMovies[indexPath.row].description
            cell.closure1 = {
                unseenMovies[indexPath.row].seen = true
                self.tableView.reloadData()
            }
            return cell
        } else {
            let seenMovies = sortingMovies.filter { $0.seen == true }
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
            cell.label1.text = seenMovies[indexPath.row].title
            cell.label2.text = seenMovies[indexPath.row].description
            cell.closure1 = {
                seenMovies[indexPath.row].seen = false
                self.tableView.reloadData()
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let unseenMovies = sortingMovies.filter { $0.seen == false }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            vc.movie = unseenMovies[indexPath.row]
            vc.sotringMovies = movies.filter { $0.genre == unseenMovies[indexPath.row].genre }
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let seenMovies = sortingMovies.filter { $0.seen == true }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            vc.movie = seenMovies[indexPath.row]
            vc.sotringMovies = movies.filter { $0.genre == seenMovies[indexPath.row].genre }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "unseen"
        } else {
            return "seen"
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCollectionViewCell", for: indexPath) as! GenreCollectionViewCell
        if indexPath.row == 0 {
            cell.label1.text = "All"
        } else if indexPath.row == 1 {
            cell.label1.text = "Comedy"
        } else if indexPath.row == 2 {
            cell.label1.text = "Action"
        } else {
            cell.label1.text = "Drama"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            sortingMovies = movies
        } else if indexPath.row == 1 {
            sortingMovies = movies.filter { $0.genre == .comedy }
        } else if indexPath.row == 2 {
            sortingMovies = movies.filter { $0.genre == .action }
        } else {
            sortingMovies = movies.filter { $0.genre == .drama }
        }
        tableView.reloadData()
    }
}

