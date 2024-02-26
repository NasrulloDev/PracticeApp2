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
            List(user.friends!, id: \.id){ friend in
                Text(friend.name)
            }
        }
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        return DetailView(user: User(id: "", isActive: true, name: "", age: 0, company: "", email: "", address: "", about: "", registered: .now, tags: [], friends: []))
            .modelContainer(container)
    }catch{
        return Text("Failed to build preview \(error.localizedDescription)")
    }
}
