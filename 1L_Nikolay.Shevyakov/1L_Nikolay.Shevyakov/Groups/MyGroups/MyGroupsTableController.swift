//
//  MyGroupsTableController.swift
//  1L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 29.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

/*
 
 
 Вероятно можно было сделать все через Коллекции или кортежи в массивах, но я пока не понял как, поэтому реализовал криво через 2 массива!
 
 
 */
import UIKit

class MyGroupsTableController: UITableViewController {

    var myGroupsLabels: [String] = []
    var myGroupsImages: [UIImage] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroupsLabels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupsCellIdent", for: indexPath) as! MyGroupsTableCell

        let myGroupLabel = myGroupsLabels[indexPath.row]
        let myGroupImage = myGroupsImages[indexPath.row]

        cell.myGroupsPhoto.image = myGroupImage
        cell.myGroupsLabel.text = myGroupLabel
        
        return cell
    }

    @IBAction func addGroup(segue: UIStoryboardSegue){
        if segue.identifier == "addMyGroup"{
            let allGroupsTableController = segue.source as! AllGroupsTableController
            if let indexPath = allGroupsTableController.tableView.indexPathForSelectedRow {
                let myGroupLabel = allGroupsTableController.allGroupsName[indexPath.row]
                let myGroupImage = allGroupsTableController.allGroupsImages[indexPath.row]
            
                if !myGroupsLabels.contains(myGroupLabel){
                    myGroupsLabels.append(myGroupLabel)
                    myGroupsImages.append(myGroupImage)
                }
                tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroupsLabels.remove(at: indexPath.row)
            myGroupsImages.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
