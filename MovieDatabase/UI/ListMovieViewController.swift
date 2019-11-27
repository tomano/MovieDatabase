//
//  ListMovieViewController.swift
//  MovieDatabase
//
//  Created by Gil Nakache on 13/11/2019.
//  Copyright © 2019 Gil Nakache. All rights reserved.
//

import UIKit

class ListMovieViewController: UIViewController {
    
    // MARK: - Variables
    
    var listViewController: ViewController?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieStore.getMovies { movies in
            
            DispatchQueue.main.async {
                self.listViewController?.movies = movies
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        listViewController = segue.destination as? ViewController
    }
}
