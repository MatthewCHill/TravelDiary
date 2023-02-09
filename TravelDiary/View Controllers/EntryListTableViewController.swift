//
//  EntryListTableViewController.swift
//  TravelDiary
//
//  Created by Matthew Hill on 2/9/23.
//

import UIKit

class EntryListTableViewController: UITableViewController {
// MARK: - Lifecylcle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.sharedInstance.entries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath) as? EntryTableViewCell else {return UITableViewCell()}

        // Configure the cell...
        let entry = EntryController.sharedInstance.entries[indexPath.row]
        cell.updateView(with: entry)
        cell.backgroundColor = .tintColor
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let entry = EntryController.sharedInstance.entries[indexPath.row]
            EntryController.sharedInstance.delete(entryToDelete: entry)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }
    



  

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // IIDOO
        
        if segue.identifier == "toDetailVC" {
            // what cell?
            if let indexPath = tableView.indexPathForSelectedRow {
                // what destination
                if let destinationVC = segue.destination as? EnteryDetailViewController {
                    //object to send
                    let entryToSend = EntryController.sharedInstance.entries[indexPath.row]
                    //object to recieve
                    destinationVC.entryReciever = entryToSend                
                }
            }
        }
    }
}
