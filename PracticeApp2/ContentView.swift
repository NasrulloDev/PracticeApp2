//
//  ContentView.swift
//  PracticeApp2
//
//  Created by Насрулло Исмоилжонов on 25/02/24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var usersList: [User] = []
    
    var body: some View {
        NavigationStack{
            List(usersList, id: \.id){user in
                HStack{
                    NavigationLink{
                        DetailView(user: user)
                    }label: {
                        VStack(alignment: .leading){
                            Text(user.name)
                                .font(.headline)
                            Text(user.company)
                        }
                    }
                }
            }
            .task {
                await loadData()
            }
            .navigationTitle("Users")
            .navigationBarTitleDisplayMode(.inline)
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
            }

        }catch{
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
