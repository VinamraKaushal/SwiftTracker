//
//  User.swift
//  SwiftTracker
//
//  Created by Vinamra Kaushal on 24/12/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
