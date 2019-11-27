//
//  SearchMoviesViewController.swift
//  MovieDatabase
//
//  Created by Gil Nakache on 27/11/2019.
//  Copyright © 2019 Gil Nakache. All rights reserved.
//

import UIKit

class SearchMoviesViewController: UIViewController, UISearchBarDelegate {
    // MARK: - Variables
    
    var listViewController: ViewController?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        listViewController = segue.destination as? ViewController
    }
    
    // MARK: UISearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        MovieStore.searchMovies(queryString: searchText) { movies in
            DispatchQueue.main.async {
                self.listViewController?.movies = movies
            }
        }
    }
}
