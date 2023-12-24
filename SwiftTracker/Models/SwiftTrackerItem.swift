//
//  SwiftTrackerItem.swift
//  SwiftTracker
//
//  Created by Vinamra Kaushal on 24/12/23.
//

import Foundation

struct SwiftTrackerItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
