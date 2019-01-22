//
//  MyGroupsTableCell.swift
//  1L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 29.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

import UIKit

class MyGroupsTableCell: UITableViewCell {

    @IBOutlet weak var myGroupsLabel: UILabel!
    @IBOutlet weak var myGroupsPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
