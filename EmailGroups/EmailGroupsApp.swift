//
//  EmailGroupsApp.swift
//  EmailGroups
//
//  Created by Samrez Ikram on 25/07/2023.
//

import SwiftUI
import ComposableArchitecture

@main
struct EmailGroupsApp: App {
  let store = Store(
    initialState: GroupsState.makeDefault(),
    reducer: groupsReducer,
    environment: Environment(
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
  )
  
  var body: some Scene {
    WindowGroup {
      GroupsView(store: store)
    }
  }
}
