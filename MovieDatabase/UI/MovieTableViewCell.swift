//
//  MovieTableViewCell.swift
//  MovieDatabase
//
//  Created by Gil Nakache on 16/10/2019.
//  Copyright © 2019 Gil Nakache. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    // MARK: - Variables

    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var overViewLabel: UILabel!
    @IBOutlet var ratingsLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
}
