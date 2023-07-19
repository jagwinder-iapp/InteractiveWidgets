//
//  ContentView.swift
//  InteractiveWdigets
//
//  Created by Iapp on 20/06/23.
//

import SwiftUI

struct ContentView: View {
    let studentsArray = ["Ron", "Harry", "Snake","Kiara","Ron", "Harry", "Snake","Kiara","Ron", "Harry", "Snake","Kiara","Ron", "Harry", "Snake","Kiara","Ron", "Harry", "Snake","Kiara","Ron", "Harry", "Snake","Kiara","Ron", "Harry", "Snake","Kiara","Ron", "Harry", "Snake","Kiara","Ron", "Harry", "Snake","Kiara","Ron", "Harry", "Snake","Kiara","Ron", "Harry", "Snake","Kiara","Ron", "Harry", "Snake","Kiara","Ron", "Harry", "Snake","Kiara","Ron", "Harry", "Snake","Kiara"]
    @State private var students = "Harry"
    
    
    var body: some View {
    
        NavigationView {
            Form {
                Picker("Select a student", selection: $students) {
                    ForEach(studentsArray, id: \.self) {
                        Text($0)
                    }
                }
            }
            Text("Hello")
                .background(Color.gray.edgesIgnoringSafeArea(.all))
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.large)
        }
     }
}

#Preview {
    ContentView()
}
