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

    }
        
    // MARK: - Actions

    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = entryTitleTextField.text,
         let address = entryAddressTextField.text,
         let body = entryBodyTextView.text else {return}
        
        EntryController.sharedInstance.createEntry(title: title, addy: address, body: body)
        navigationController?.popViewController(animated: true)
        
    }
   
} // End of class
