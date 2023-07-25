//
//  GroupsReducer.swift
//  EmailGroups
//
//  Created by Samrez Ikram on 25/07/2023.
//

import Foundation
import ComposableArchitecture

let groupsReducer = Reducer<GroupsState, GroupsAction, Environment> { state, action, environment in
    switch action {
    case .fetchGroups:
        // Implement fetching groups from the SQLite database
        state.groups = environment.fetchGroups()
        return .none

    case let .addGroup(name, emailIds):
        // Implement adding a new group to the SQLite database
        let newGroup = Group(id: state.groups.count + 1, name: name, emailIds: emailIds)
        environment.addGroup(newGroup)
        state.groups.append(newGroup)
        return .none

    case let .editGroup(id, name, emailIds):
        // Implement updating an existing group in the SQLite database
        if let index = state.groups.firstIndex(where: { $0.id == id }) {
            var updatedGroup = state.groups[index]
            updatedGroup.name = name
            updatedGroup.emailIds = emailIds
            environment.updateGroup(updatedGroup)
            state.groups[index] = updatedGroup
        }
        return .none

    case let .selectGroup(group):
        state.selectedGroup = group
        return .none

    case .sendEmail:
        state.isMailComposerPresented = true
        return .none
    }
}
