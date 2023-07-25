//
//  SecondScreen.swift
//  EmailGroups
//
//  Created by Samrez Ikram on 25/07/2023.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct SecondScreen: View {
    let store: Store<GroupsState, GroupsAction>
    @Binding var isPresented: Bool

    @State private var groupName = ""
    @State private var selectedEmailIds: [String] = []

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Group Name")) {
                    TextField("Enter Group Name", text: $groupName)
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
            .navigationBarTitle("Create Group")
            .navigationBarItems(trailing:
                Button("Save") {
                    store.send(.addGroup(name: groupName, emailIds: selectedEmailIds))
                    isPresented = false
                }
            )
        }
    }

    private var emailIds: [String] {
        // Implement fetching emailIds from your data source or state
        return []
    }
}
