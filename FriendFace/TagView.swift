//
//  TagView.swift
//  FriendFace
//
//  Created by Görkem Güray on 19.09.2024.
//

import SwiftUI

struct TagView: View {
    let labelText: String
    
    var body: some View {
        Text(labelText)
            .font(.caption)
            .padding(.horizontal,12)
            .padding(.vertical,6)
            .foregroundStyle(.blue)
            .background(.white)
            .clipShape(.rect(cornerRadius: 20))
            .lineLimit(1)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue, lineWidth: 1.5)
            )
    }
}

#Preview {
    TagView(labelText: "Test Tag")
}
