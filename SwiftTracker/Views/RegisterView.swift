//
//  RegisterView.swift
//  SwiftTracker
//
//  Created by Vinamra Kaushal on 24/12/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            //Header
            HeaderView(title: "Register", subtitle: "Start organising todos", angle: -15, background: .yellow)
            Spacer()
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                STButton(title: "Create Account", background: .green) {
                    //Attempt registration
                    viewModel.register()
                    viewModel.requestNotificationPermission()
                }
                .padding()
            }
            .offset(y: -100)
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
