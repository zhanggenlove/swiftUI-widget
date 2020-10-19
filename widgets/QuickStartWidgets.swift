//
//  QuickStartWidgets.swift
//  widgetsExtension
//
//  Created by 张亦梓 on 2020/10/15.
//

import WidgetKit
import SwiftUI
import Intents

struct QuickStartProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> QuickStartEntry {
        return QuickStartEntry(date: Date())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (QuickStartEntry) -> Void) {
        let entry = QuickStartEntry(date: Date())
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        let currentDate = Date()
        let entry = QuickStartEntry(date: currentDate)
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}

struct QuickStartEntry: TimelineEntry {
    public let date: Date
}

struct QuickStartEntryWidget: Widget {
    private let kind: String = "QuickStartEntryWidget"
    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: QuickStartProvider()) { entry in
            QuickStartEntryView(entry: entry)
        }
        .configurationDisplayName("快捷菜单")
        .description("请选择优雅的快捷菜单主题")
        .supportedFamilies([.systemMedium,.systemSmall])
        
    }
}

struct QuickStartEntryView : View {
    //这里是Widget的类型判断
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: QuickStartProvider.Entry
    
    
    var body: some View {
        //entry.date
        switch family {
        case .systemMedium:
            quickStartViewMedium()
        default:
            quickStartView()
        }
    }
}

struct QuickStart_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

