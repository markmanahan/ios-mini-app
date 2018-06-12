// Derived from note.swift form Note Taker Example

// Getters and Setters in Swift: https://syntaxdb.com/ref/swift/getters-setters
// compareTo() model: https://stackoverflow.com/questions/24334684/how-do-i-implement-swifts-comparable-protocol
// Date object in Swift: https://developer.apple.com/documentation/foundation/date

import Foundation

class BucketItem: Comparable { // What constitutes an item on the bucket list and some forms of functionality
    
    // Equatable functionality
    static func <(lhs: BucketItem, rhs: BucketItem) -> Bool { return false }
    static func ==(lhs: BucketItem, rhs: BucketItem) -> Bool { return false }
    
    var name: String
    var longitude: String
    var latitude: String
    var description: String
    var due_date: Date
    var done_status: Bool
    
    // BucketItem constructor
    init(name: String, longitude: String, latitude: String, description: String, due_date: Date) {
    
        self.name = name
        self.longitude = longitude
        self.latitude = latitude
        self.description = description
        self.due_date = due_date
        self.done_status = false
        
    }
    
}

// Bucket item compareTo() method, sorts by completion status and date
func compareTo (this: BucketItem, that: BucketItem) -> Bool {
    
    let completedOne = this.done_status
    let completedTwo = that.done_status
    
    let dateOne = this.due_date
    let dateTwo = that.due_date
    
    if (!completedOne && completedTwo) { return true }
    if (completedOne && !completedTwo) { return false }
    if ((completedOne && completedTwo) || (!completedOne && !completedTwo)) {
        
        return (dateOne < dateTwo)
        
    }
    
    return true
    
}
