//
//  PracticeApp2App.swift
//  PracticeApp2
//
//  Created by Насрулло Исмоилжонов on 25/02/24.
//
import SwiftData
import SwiftUI

@main
struct PracticeApp2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
