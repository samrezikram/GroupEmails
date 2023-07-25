//
//  GroupsState.swift
//  EmailGroups
//
//  Created by Samrez Ikram on 25/07/2023.
//

import Foundation
struct GroupsState: Equatable {
    var groups: [Group] = []
    var selectedGroup: Group?
    var isMailComposerPresented = false
}
