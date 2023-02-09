//
//  EnteryDetailViewController.swift
//  TravelDiary
//
//  Created by Matthew Hill on 2/9/23.
//

import UIKit

class EnteryDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var entryDateLabel: UILabel!
    @IBOutlet weak var entryTitleTextField: UITextField!
    @IBOutlet weak var entryAddressTextField: UITextField!
    @IBOutlet weak var entryBodyTextView: UITextView!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()

    }
        
    // MARK: - Properties
    var entryReciever: Entry?
    
    // MARK: - Helper Functions
    func updateView() {
        guard let entryReciever = entryReciever else {return}
        entryTitleTextField.text = entryReciever.title
        entryAddressTextField.text = entryReciever.address
        entryBodyTextView.text = entryReciever.body
        entryDateLabel.text = entryReciever.entryDate.stringValue()
    }
    
    // MARK: - Actions

    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = entryTitleTextField.text,
         let address = entryAddressTextField.text,
         let body = entryBodyTextView.text else {return}
        
        // Check to see if `entryReciver` on line 26 has a value
        if let entry = entryReciever {
            // if line 26 has a value, the user has selected a cell, and our segue has sent over the selected `entry`
            EntryController.sharedInstance.updateEntry(entryToUpdate: entry, newTitle: title, newAddress: address, newBody: body)
        } else {
            // else, line 26 does not have a value, the user did not select a cell, the user must have selected the add entry button
            EntryController.sharedInstance.createEntry(title: title, addy: address, body: body)
        }
        
        navigationController?.popViewController(animated: true)
    }
   
} // End of class
