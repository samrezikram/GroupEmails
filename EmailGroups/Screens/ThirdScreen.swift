//
//  ThirdScreen.swift
//  EmailGroups
//
//  Created by Samrez Ikram on 25/07/2023.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct ThirdScreen: View {
    let store: Store<GroupsState, GroupsAction>
    var group: Group
    @Binding var isPresented: Bool

    @State private var editedGroupName = ""
    @State private var selectedEmailIds: [String] = []

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Group Name")) {
                    TextField("Enter Group Name", text: $editedGroupName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                Section(header: Text("Select Email IDs")) {
                    List {
                        ForEach(emailIds, id: \.self) { email in
                            Text(email)
                                .onTapGesture {
                                    if selectedEmailIds.contains(email) {
                                        selectedEmailIds.removeAll { $0 == email }
                                    } else {
                                        selectedEmailIds.append(email)
                                    }
                                }
                        }
                    }
                }
            }
            .navigationBarTitle("Edit Group")
            .navigationBarItems(trailing:
                Button("Save") {
                    store.send(.editGroup(id: group.id, name: editedGroupName, emailIds: selectedEmailIds))
                    isPresented = false
                }
            )
            .onAppear {
                editedGroupName = group.name
                selectedEmailIds = group.emailIds
            }
        }
    }

    private var emailIds: [String] {
        // Implement fetching emailIds from your data source or state
        return []
    }
}
