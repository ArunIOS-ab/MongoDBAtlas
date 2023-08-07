//
//  ContentView.swift
//  MongoDBAtlas
//
//  Created by AB on 27/07/23. atlasab
//hbaMVQd557jFrYOY

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    
    var body: some View {
        return NavigationView {
            Group {
                if username == "" {
                    LoginView(username: $username)
                } else {
                  //  ChatRoomsView(username: username)
                }
            }
            .navigationBarItems(trailing: username != "" ? LogoutButton(username: $username) : nil) }
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LogoutButton: View {
    @Binding var username: String
    
    @State private var isConfirming = false
    
    var body: some View {
        Button("Logout") { isConfirming = true }
        .confirmationDialog("Are you that you want to logout",
                            isPresented: $isConfirming) {
            Button("Confirm Logout", role: .destructive) {
                logout()
            }
            Button("Cancel", role: .cancel) {}
        }
    }
                     
    private func logout() {
        Task {
            do {
                try await realmApp.currentUser?.logOut()
                username = ""
            } catch {
                print("Failed to logout: \(error.localizedDescription)")
            }
        }
    }
}

struct LogoutButton_Previews: PreviewProvider {
    static var previews: some View {
        LogoutButton(username: .constant("andrew"))
    }
}
