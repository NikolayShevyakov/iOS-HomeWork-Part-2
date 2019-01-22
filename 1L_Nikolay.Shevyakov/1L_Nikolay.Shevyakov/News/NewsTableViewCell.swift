//
//  NewsTableViewCell.swift
//  1L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 22.01.2019.
//  Copyright © 2019 jasno. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var likeNews: PhotoRating!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
