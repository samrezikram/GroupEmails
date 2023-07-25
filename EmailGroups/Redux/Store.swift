//
//  Store.swift
//  EmailGroups
//
//  Created by Samrez Ikram on 25/07/2023.
//

import Foundation
import ComposableArchitecture


let environment = Environment(
    fetchGroups: {
        // Implement fetching groups from the SQLite database
        return []
    },
    addGroup: { group in
        // Implement adding a new group to the SQLite database
    },
    updateGroup: { group in
        // Implement updating an existing group in the SQLite database
    }
)

let store = Store(
    initialState: GroupsState(),
    reducer: groupsReducer,
    environment: environment
)
