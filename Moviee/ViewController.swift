//
//  ViewController.swift
//  Moviee
//
//  Created by Luca Peduto on 19/03/16.
//  Copyright © 2016 Eloquent Bit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var movies = [Movies]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmovies/limit=10/json", completion: didLoadData)
    }
    
    func didLoadData(movies: [Movies]) {
        self.movies = movies
        
        for movie in movies {
            movie.getInfo()
        }
    }
}

