//
//  FriendsCollectionController.swift
//  1L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 28.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FriendsCollectionController: UICollectionViewController {

    
    var imageFriendsCollection: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowFriendImage", for: indexPath) as! FriendsCollectionCell
        
        cell.friendsPhotoInCell.image = imageFriendsCollection
        return cell
    }

}





