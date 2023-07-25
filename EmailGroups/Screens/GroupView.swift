//
//  GroupView.swift
//  EmailGroups
//
//  Created by Samrez Ikram on 25/07/2023.
//

import Foundation
import ComposableArchitecture
import SwiftUI

struct GroupsView: View {
    let store: Store<GroupsState, GroupsAction>

    @State private var isSecondScreenPresented = false

    var body: some View {
        NavigationView {
            WithViewStore(store) { viewStore in
                List(viewStore.groups) { group in
                    VStack(alignment: .leading) {
                        Text(group.name)
                        Text(group.emailIds.joined(separator: ", "))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .onTapGesture {
                        viewStore.send(.selectGroup(group))
                        isSecondScreenPresented = true
                    }
                }
                .navigationBarTitle("Group Listing")
                .navigationBarItems(trailing:
                    Button("Create Group") {
                        viewStore.send(.sendEmail)
                    }
                )
            }
        }
        .sheet(isPresented: $isSecondScreenPresented) {
            SecondScreen(store: store, isPresented: $isSecondScreenPresented)
        }
    }
}
