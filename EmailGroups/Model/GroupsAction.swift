//
//  GroupsAction.swift
//  EmailGroups
//
//  Created by Samrez Ikram on 25/07/2023.
//

import Foundation
enum GroupsAction {
    case fetchGroups
    case addGroup(name: String, emailIds: [String])
    case editGroup(id: Int, name: String, emailIds: [String])
    case selectGroup(Group?)
    case sendEmail
}

enum GroupsViewAction {
    case onAppear
    case onSelectGroup(Group)
    case onComposeEmail
    case onDeleteGroup
}
