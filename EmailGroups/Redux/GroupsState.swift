//
//  GroupsState.swift
//  EmailGroups
//
//  Created by Samrez Ikram on 25/07/2023.
//

import Foundation
import SwiftUI
struct GroupsState: Equatable {
    var groups: [Group] = []
    var selectedGroup: Group?
    var isMailComposerPresented = false
}

// Add a convenience initializer to create a default state with initial groups
extension GroupsState {
    static func makeDefault() -> GroupsState {
        let initialGroups = [
            Group(id: 1, name: "Family", emailIds: ["family@example.com"]),
            Group(id: 2, name: "Friends", emailIds: ["friend1@example.com", "friend2@example.com"]),
            // Add more initial groups as needed
        ]
        return GroupsState(groups: initialGroups, selectedGroup: nil)
    }
}
