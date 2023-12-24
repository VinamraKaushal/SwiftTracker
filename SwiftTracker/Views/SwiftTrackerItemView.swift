//
//  SwiftTrackerItemsView.swift
//  SwiftTracker
//
//  Created by Vinamra Kaushal on 24/12/23.
//

import SwiftUI

struct SwiftTrackerItemView: View {
    @StateObject var viewModel = SwiftTrackerItemViewViewModel()
    let item: SwiftTrackerItem
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

#Preview {
    SwiftTrackerItemView(item: .init(id: "lyonglQeP0MsKILga6tAiMixJG82", title: "Show project in college", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
}
