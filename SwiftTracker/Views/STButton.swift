//
//  STButton.swift
//  SwiftTracker
//
//  Created by Vinamra Kaushal on 24/12/23.
//

import SwiftUI

struct STButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    STButton(title: "Value", background: .blue) {
        //Action
    }
}
