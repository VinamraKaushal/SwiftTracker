//
//  SwiftTrackerView.swift
//  SwiftTracker
//
//  Created by Vinamra Kaushal on 24/12/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct SwiftTrackerView: View {
    @StateObject var viewModel: SwiftTrackerViewViewModel
    @FirestoreQuery var items: [SwiftTrackerItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: SwiftTrackerViewViewModel(userId: userId))
    }
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    SwiftTrackerItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Swift Tracker")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
    
    
}

#Preview {
    SwiftTrackerView(userId: "")
}

