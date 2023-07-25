//
//  Environment.swift
//  EmailGroups
//
//  Created by Samrez Ikram on 25/07/2023.
//

import Foundation
struct Environment {
    var fetchGroups: () -> [Group]
    var addGroup: (Group) -> Void
    var updateGroup: (Group) -> Void
    // Add more functions for accessing the SQLite database
}
