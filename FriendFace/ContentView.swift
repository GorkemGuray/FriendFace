//
//  ContentView.swift
//  FriendFace
//
//  Created by Görkem Güray on 24.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = [User]()
    
    
    
    var body: some View {
        
        NavigationStack {
            List(users, id: \.id) {user in
                NavigationLink(value: user) {
                    VStack (alignment: .leading){
                        Text(user.name)
                            .font(.headline)
                        Text(user.email)
                    } //VStack
                } // NavigationLink
                
            } //List
            .task {
                if users.isEmpty {
                    await loadData()
                }
                
            }
            
            .navigationTitle("Friend Face")
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(for: User.self) { user in
                UserDetailsView(user: user, allUsers: users)
            }
        } //NavigationStack
        
        
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                users = decodedResponse
            }
            
        } catch {
            print("Invalid Data")
        }
        
    } //func loadData()
}

/*
#Preview {
    ContentView()
}
*/
