//
//  EntryController.swift
//  TravelDiary
//
//  Created by Matthew Hill on 2/9/23.
//

import Foundation

class EntryController {
    
    // MARK: - Singleton
    
    /// Singleton: To ensure that we are interacting with the *SAME* instance of our *entries* array we created a singleton to pass around this specific instance of our **EntryController**
    static let sharedInstance = EntryController()
    // MARK: - Source Of Truth
    
    /// Source of Truth: The single location we will store our **Entry** data.
    var entries: [Entry] = []
    
    // MARK: - CRUD FUNCTIONS
    func createEntry(title: String, addy: String, body: String ) {
        let newEntry = Entry(title: title, address: addy, body: body)
        // Adding it to the SOT
        entries.append(newEntry)
        save()
    }
    
    func updateEntry(entryToUpdate: Entry, newTitle: String, newAddress: String, newBody: String) {
        entryToUpdate.title = newTitle
        entryToUpdate.address = newAddress
        entryToUpdate.body = newBody
        save()
    }
    
    func delete(entryToDelete: Entry) {
        guard let index = entries.firstIndex(of: entryToDelete) else {return}
        entries.remove(at: index)
        save()
    }
    
    // MARK: - Persistence
    
    func save() {
        
    }
    func load() {
        
    }
    
    
} //End of class
