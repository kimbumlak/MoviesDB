//
//  MovieCollectionViewCell.swift
//  MoviesDB
//
//  Created by BumLak Kim on 2/14/20.
//  Copyright © 2020 BumLak Kim. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    var movie: Movie? {
        didSet{
            if let movie = movie {
                movieImage.kf.setImage(with: "\(movie.posterPath ?? "")".url)
            }
        }
    }
    @IBOutlet private weak var movieImage: UIImageView!
}

extension String {
    var url: URL? {
        return URL(string: "\(posterUrl)\(self)")
    }
}
