//
//  ToggleStateIntent.swift
//  InteractiveWdigets
//
//  Created by Iapp on 21/06/23.
//

import SwiftUI
import AppIntents

struct ToggleStateIntent: AppIntent {
    static var title: LocalizedStringResource = "Toogle Task State"
    
    @Parameter(title: "Task ID")
    var id: String
    init() {
        
    }
    init(id: String) {
        self.id = id
         
    }
    
    func perform() async throws -> some IntentResult {
        // Update Database here
        
        if let index = WidgetDataModel.shared.todos.firstIndex(where: { $0.id == id}) {
            WidgetDataModel.shared.todos[index].isCompleted.toggle()
            print("Updated")
        }
        return .result()
    }
}
