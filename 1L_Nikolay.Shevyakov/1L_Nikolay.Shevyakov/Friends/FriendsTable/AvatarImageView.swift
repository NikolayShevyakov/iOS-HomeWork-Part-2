//
//  AvatarImageView.swift
//  1L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 18.01.2019.
//  Copyright © 2019 jasno. All rights reserved.
//

import UIKit

class AvatarImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.size.width / 2
        self.contentMode = .scaleAspectFit
        self.clipsToBounds = true
    }

}
