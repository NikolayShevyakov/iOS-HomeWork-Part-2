//
//  FriendsTableCell.swift
//  1L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 27.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

import UIKit

class FriendsTableCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: AvatarImageView!
    @IBOutlet weak var outerView: UIView!
    
    // MARK: LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
