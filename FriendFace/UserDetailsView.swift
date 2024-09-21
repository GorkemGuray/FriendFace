//
//  UserDetailsView.swift
//  FriendFace
//
//  Created by Görkem Güray on 15.09.2024.
//

import SwiftUI

struct UserDetailsView: View {
    
    let user : User
    @State private var allUsers = [User]()
    let registeredDate: Date
    let userFriends: [Friends]
    
    init(user: User, allUsers: [User] ) {
        let isoDate = user.registered
        let dateFormatter = ISO8601DateFormatter()
        registeredDate = dateFormatter.date(from: isoDate) ?? Date.now
        self.user = user
        self.allUsers = allUsers
        self.userFriends = user.friends
    }
    
    let color0 = Color(red: 18/255, green: 194/255, blue: 233/255)
    let color1 = Color(red: 196/255, green: 113/255, blue: 237/255)
    let color2 = Color(red: 246/255, green: 79/255, blue: 89/255)
    
    var body: some View {
        VStack(alignment:.center) {
            Label {
                Text("\(user.name) , \(user.age)")
            } icon : {
                if user.isActive {
                    Image(systemName: "bolt.circle")
                        .foregroundStyle(.green)
                } else {
                    Image(systemName: "bolt.slash.circle")
                        .foregroundStyle(.red)
                }
            }
            .font(.headline.bold())
            .padding(.top)
            Text(user.email)
                .font(.caption)
                .padding(.bottom)
            Spacer()
            HStack {
                Label("\(user.company)", systemImage: "building.fill")
                Spacer()
                Label("\(registeredDate, format: .dateTime)", systemImage: "pencil.and.list.clipboard")
            } //HStack
            .font(.caption)
            .padding()
            
        } //VStack
        .background(
            LinearGradient(colors: [color0, color1, color2], startPoint: .topLeading, endPoint: .bottomTrailing)
                .blur(radius: 5)
        )
        .clipShape(.rect(cornerRadius: 20))
        .foregroundStyle(.primary)
        .frame(maxHeight: 100)
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
            ForEach(user.tags.indices, id:\.self) { index in
                TagView(labelText: user.tags[index])
            }
        } //LazyVGrid
        .padding()
        
        
        //ScrollView {
        List {
            Section("About") {
                Text(user.about)
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)
            } //Section-1
            
            Section("Address") {
                Text(user.address)
            } //Section-2
            
            Section("Friends") {
                ForEach(allUsers, id: \.id) {userA in
                    ForEach(userFriends, id: \.id) {userFriend in
                        if userA.id == userFriend.id {
                            NavigationLink(value: userA) {
                                Text(userA.name)
                                //Label(title:userA.name, icon: "pencil")
                            }
                        }
                    }
                    
                }
            } //Section-3
            
        } //List
        .scrollContentBackground(.hidden)
        
        
        Spacer()
        Text(user.id.uuidString)
            .font(.caption2)
        
        
        
    } //body
    
    
} //struct


/*
 #Preview {
 UserDetailsView()
 }
 */
