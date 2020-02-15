//
//  PopularMoviesVC.swift
//  MoviesDB
//
//  Created by BumLak Kim on 2/13/20.
//  Copyright © 2020 BumLak Kim. All rights reserved.
//

import UIKit
private let identifier = "MovieCell"

class PopularMoviesVC: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    private var movies: [Movie]?

    override func viewDidLoad() {
        super.viewDidLoad()
        let width = (view.frame.size.width - 20) / 3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: 200)
        fetch()
    }
    private func fetch() {
        API.fetchPopularMovies { data in
            self.movies = data.results
            self.collectionView.reloadData()
        }
    }
}

extension PopularMoviesVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MovieCollectionViewCell
        cell.movie = movies?[indexPath.item]
        return cell
    }
}
