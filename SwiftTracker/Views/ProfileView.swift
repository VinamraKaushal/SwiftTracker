//
//  ProfileView.swift
//  SwiftTracker
//
//  Created by Vinamra Kaushal on 24/12/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile....")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        //Avatar
        Image("Profile")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 200, height: 200)
            .padding()
        //info: name, email, member since
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            HStack {
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        .padding()
        //sign out
        Button("Log Out") {
            viewModel.logOut()
        }
        .font(.system(size: 20))
        .tint(.red)
        .padding(100)
    }
}

#Preview {
    ProfileView()
}
