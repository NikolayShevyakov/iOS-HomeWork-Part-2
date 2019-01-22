//
//  FriendsTableController.swift
//  1L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 27.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

import UIKit

@IBDesignable class FriendsTableController: UITableViewController {

    var friends = [
        "Nikolay Shevyakov",
        "Ivan Ivanov",
        "Petr Petrov"
    ]
    
    var images: [UIImage] = [
        UIImage(named: "1-Friend.png")!,
        UIImage(named: "2-Friend.png")!,
        UIImage(named: "3-Friend.jpg")!
    ]
    
    // Смещение тени
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 3, height: 3)
    
    // Прозрачность тени
    @IBInspectable var shadowOpacity: Float = 0.3
    
    // Радиус блура тени
    @IBInspectable var shadowRadius: CGFloat = 5
    
    // Цвет тени
    @IBInspectable var shadowColor: UIColor = UIColor.black
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendsTableCell
        let image = images[indexPath.row]
        let friend = friends[indexPath.row]
        
        if let outerView = cell.outerView {
            outerView.clipsToBounds = false
            outerView.layer.shadowColor = self.shadowColor.cgColor
            outerView.layer.shadowOpacity = self.shadowOpacity
            outerView.layer.shadowOffset = self.shadowOffset
            outerView.layer.shadowRadius = self.shadowRadius
            outerView.backgroundColor = UIColor.clear
        }
        
        cell.photoImageView.image = image
        cell.nameLabel.text = friend
        
        return cell
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFriendImage" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let dvc = segue.destination as? FriendsCollectionController{
                    dvc.imageFriendsCollection = self.images[indexPath.row]
                }
            }
        }
    }
}


