//
//  WidgetModel.swift
//  InteractiveWdigets
//
//  Created by Iapp on 21/06/23.
//

import SwiftUI

struct WidgetModel: Identifiable {
    var id:String = UUID().uuidString
    var taskTitle: String
    var isCompleted: Bool = false
    
}

// MARK: - Sample Data

class WidgetDataModel {
    static let shared = WidgetDataModel()
    
    var todos: [WidgetModel] = [
        .init(taskTitle: "Go To Gym"),
        .init(taskTitle: "Finish the Work"),
        .init(taskTitle: "Had enough Sleep")
    
    ]
}
