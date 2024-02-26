//
//  DetailView.swift
//  PracticeApp2
//
//  Created by Насрулло Исмоилжонов on 26/02/24.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @State var user: User
    
    var body: some View {
        VStack{
            Text(user.about)
            List(user.friends, id: \.id){ friend in
                Text(friend.name)
            }
        }
    }
}

#Preview {
   DetailView(user: User(id: "", isActive: true, name: "", age: 0, company: "", email: "", address: "", about: "", registered: .now, tags: [], friends: []))
}
