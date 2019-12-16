//
//  MovieDetailViewController.swift
//  MovieDatabase
//
//  Created by Gil Nakache on 13/11/2019.
//  Copyright © 2019 Gil Nakache. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    // MARK: - Variables
    

    
    @IBOutlet var releaseDate: UILabel!
    @IBOutlet var averageRate: UILabel!
    @IBOutlet var topImageView: UIImageView!
    @IBOutlet var overview: UILabel!
    @IBOutlet weak var actorCollectionView: UICollectionView!

    var movie: Movie?
    var actors: [Actor]?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let movie = movie else { return }
        
        navigationItem.title = movie.title
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM YYYY"
        
        releaseDate.text = dateFormatter.string(from: movie.releaseDate ?? Date.distantPast)
        averageRate.text = String(repeating: "❤️", count: Int(movie.voteAverage))
        overview.text = movie.overview
        
        guard let urlPath = movie.backdropPath
        else {
            return
        }
        
        MovieStore.getImage(posterPath: urlPath) { _, image in
            self.topImageView.image = image
        }
        
        MovieStore.getActors(idMovie: String(movie.id)){
            (cast) in print(cast[0].name)
            self.actors = cast
                
        }
    }
    
}


extension MovieDetailViewController: UICollectionViewDataSource {

    
    // MARK: - UITableViewDatasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actors?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
        let cell = actorCollectionView.dequeueReusableCell(withReuseIdentifier: "cellule", for: indexPath) as! ActorCollectionViewCell
            
        let actor = actors![indexPath.row]
        cell.actorName.text = actor.name
        cell.actorCharacter.text = actor.character
        //cell.actorImage = nil
        
        //if actor.profilePath != nil {
            MovieStore.getImage(posterPath: actor.profilePath! ) { path, image in
                if self.actors!.count > indexPath.row {
                    let newActor = self.actors![indexPath.row]
                    if path == newActor.profilePath {
                        cell.actorImage.image = image
                    } else {
                        cell.actorImage.image = nil
                    }
                }
            }
        //}
        return cell
    }
}
