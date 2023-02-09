//
//  Entry.swift
//  TravelDiary
//
//  Created by Matthew Hill on 2/9/23.
//

import Foundation

class Entry {
    var title: String
    var address: String
    let entryDate: Date
    var body: String
    
    init(title: String, address: String, entryDate: Date = Date(), body: String){
        self.title = title
        self.address = address
        self.entryDate = entryDate
        self.body = body
    }
}// End of class
extension Entry: Equatable { // Adopt
    // Conforming
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.entryDate == rhs.entryDate
    }
    
}

