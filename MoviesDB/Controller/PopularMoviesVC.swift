//
//  PopularMoviesVC.swift
//  MoviesDB
//
//  Created by BumLak Kim on 2/13/20.
//  Copyright © 2020 BumLak Kim. All rights reserved.
//

import UIKit

class PopularMoviesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        API.fetchPopularMovies { results in
            print(results.page)
        }
    }
}

