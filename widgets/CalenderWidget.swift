//
//  CalenderWidget.swift
//  widgetsExtension
//
//  Created by 张亦梓 on 2020/10/16.

//struct CalenderWidget: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

import WidgetKit
import SwiftUI
import Intents

struct CalenderProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> CalendertEntry {
        return CalendertEntry(date: Date())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (CalendertEntry) -> Void) {
        let entry = CalendertEntry(date: Date())
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        let tomorrow = CalenderHelper.beginningOfTomorrow
        let entry = CalendertEntry(date: tomorrow)
        let timeline = Timeline(entries: [entry], policy: .after(tomorrow))
        completion(timeline)
    }
}

struct CalendertEntry: TimelineEntry {
    public let date: Date
}

struct CalendertEntryWidget: Widget {
    private let kind: String = "CalendertWidget"
    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: CalenderProvider()) { entry in
            CalenderEntryView(entry: entry)
        }
        .configurationDisplayName("小清新日历")
        .description("请选择优雅的日历主题")
        .supportedFamilies([.systemMedium,.systemSmall])
        
    }
}

struct CalenderEntryView : View {
    //这里是Widget的类型判断
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: CalenderProvider.Entry
    
    @ViewBuilder
    var body: some View {
        //entry.date
        calenderView()
            .background(Color.clock_widgetbgcolor)
    }
}

struct Calender_Previews: PreviewProvider {
    static var previews: some View {
        CalenderEntryView(entry: CalendertEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
