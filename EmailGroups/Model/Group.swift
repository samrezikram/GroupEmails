//
//  Group.swift
//  EmailGroups
//
//  Created by Samrez Ikram on 25/07/2023.
//

import Foundation

struct Group: Identifiable, Equatable {
    var id: Int
    var name: String
    var emailIds: [String]
}
