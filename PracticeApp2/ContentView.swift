//
//  ContentView.swift
//  PracticeApp2
//
//  Created by Насрулло Исмоилжонов on 25/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var usersList: [User] = []
    
    var body: some View {
        List(usersList, id: \.id){user in
            Text(user.name)
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let decodedUsers = try? decoder.decode([User].self, from: data){
                usersList = decodedUsers
                print(decodedUsers[0].registered)
            }

        }catch{
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
