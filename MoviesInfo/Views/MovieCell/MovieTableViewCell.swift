//
//  MovieTableViewCell.swift
//  MoviesInfo
//
//  Created by YEH on 20/7/2022.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    static let nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
    static let identifier = "MovieTableViewCell"
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fill(using data: ResponseItem?) {
        if let posterPath = data?.posterPath, let url = URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath)") {
            movieImage.kf.setImage(with: url)
        }
        movieTitle.text = data?.title
        movieReleaseDate.text = data?.releaseDate
    }
    
}
