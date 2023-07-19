//
//  WidgetsExtension.swift
//  WidgetsExtension
//
//  Created by Iapp on 21/06/23.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(toDosModel: Array(WidgetDataModel.shared.todos.prefix(3)))
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(toDosModel: Array(WidgetDataModel.shared.todos.prefix(3)))
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let lastDoneTask = Array(WidgetDataModel.shared.todos.prefix(3))
        let taskEntry = [SimpleEntry(toDosModel: lastDoneTask)]

        let timeline = Timeline(entries: taskEntry, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date:Date = .now
    let toDosModel: [WidgetModel]
    
}

struct WidgetsExtensionEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading,spacing: 0) {
            Text("Todo Tasks")
                .fontWeight(.semibold)
                .padding(.bottom,10)
            VStack(alignment: .leading, spacing: 6, content: {
                if entry.toDosModel.isEmpty {
                    Text("No ToDo's")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ForEach(entry.toDosModel.sorted {
                        !$0.isCompleted && $1.isCompleted
                    }) { task in
                        HStack(spacing: 6) {
                            Button(intent: ToggleStateIntent(id: task.id)) {
                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(.blue)
                                
                            }.buttonStyle(.plain)
                            VStack(alignment: .leading, spacing: 4, content: {
                                Text(task.taskTitle)
                                    .lineLimit(1)
                                    .fontWidth(.condensed)
                                    .textScale(.secondary)
                                    .strikethrough(task.isCompleted, pattern: .solid, color: .primary)
                                Divider()
                            })
                        }
                        .padding(.leading, -7.5)
                        if task.id != entry.toDosModel.last?.id {
                            Spacer(minLength: 0)
                        }
                    }
                }
            }) 
        }
        .containerBackground(.fill.tertiary, for: .widget)
        
    }
}

struct WidgetsExtension: Widget {
    let kind: String = "WidgetsExtension"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetsExtensionEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    WidgetsExtension()
} timeline: {
    SimpleEntry(toDosModel: WidgetDataModel.shared.todos)
}
