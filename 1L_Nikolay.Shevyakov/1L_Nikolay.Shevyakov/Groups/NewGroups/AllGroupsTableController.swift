//
//  AllGroupsTableController.swift
//  1L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 29.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

import UIKit

class AllGroupsTableController: UITableViewController {

    var allGroupsName: [String] = [
        "iOS",
        "Java",
        "Python"
    ]
    
    var allGroupsImages: [UIImage] = [
        UIImage(named: "iOS.jpg")!,
        UIImage(named: "java.png")!,
        UIImage(named: "python.png")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allGroupsName.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allGroupsCellIdent", for: indexPath) as! AllGroupsTableCell

        let groupName = allGroupsName[indexPath.row]
        let groupImage = allGroupsImages[indexPath.row]

        cell.allGroupLabel.text = groupName
        cell.allGroupPhoto.image = groupImage
        
        return cell
    }

}
