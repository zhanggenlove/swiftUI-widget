//
//  ClockWidget.swift
//  widgetsExtension
//
//  Created by 张亦梓 on 2020/10/15.


import WidgetKit
import SwiftUI
import Intents

struct ClockProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> ClockEntry {
        return ClockEntry(date: Date())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (ClockEntry) -> Void) {
        let entry = ClockEntry(date: Date())
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 2, to: currentDate)!
        let entry = ClockEntry(date: currentDate)
        let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
        completion(timeline)
    }
}

struct ClockEntry: TimelineEntry {
    public let date: Date
}

struct ClockWidget: Widget {
    private let kind: String = "ClockWidget"
    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: ClockProvider()) { entry in
            ClockEntryView(entry: entry)
        }
        .configurationDisplayName("时间管理大师")
        .description("时间就是生命,且珍惜")
        .supportedFamilies([.systemMedium,.systemSmall])
        
    }
}

struct ClockEntryView : View {
    //这里是Widget的类型判断
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: ClockProvider.Entry
    
    @ViewBuilder
    var body: some View {
        //entry.date
        clockView(date: entry.date)
    }
}

struct Clock_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

