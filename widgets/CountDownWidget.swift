//
//  CountDownWidget.swift
//  widgetsExtension
//
//  Created by 张亦梓 on 2020/10/16.
//


import WidgetKit
import SwiftUI
import Intents

struct CountDownProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> CountDownEntry {
        return CountDownEntry(date: Date(), data: CountDown(date: Date(),title: "倒计时小组件"))
    }
    
    func getSnapshot(for configuration: CountDownIntent, in context: Context, completion: @escaping (CountDownEntry) -> Void) {
        let entry = CountDownEntry(date: Date(), data: CountDown(date: Date(), title: "倒计时小组件"))
        completion(entry)
    }
    
    func getTimeline(for configuration: CountDownIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 30, to: currentDate)!
        //Widget输入的日期默认为中午12点
        let configureDate = (configuration.date?.date  ?? Date()) - 12 * 3600
        let entry = CountDownEntry(date: currentDate,data: CountDown(day: Date().daysBetweenDate(toDate: configureDate),date: configureDate,title: configuration.title ?? "请配置标题" ))
        let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
        completion(timeline)
    }
}

struct CountDown {
    var day:Int = 0
    var date:Date
    var title:String
}

struct CountDownEntry: TimelineEntry {
    public let date: Date
    public let data: CountDown
}

struct CountDownWidget: Widget {
    private let kind: String = "CountDownWidget"
    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: CountDownIntent.self, provider: CountDownProvider()) { entry in
            CountDownEntryView(entry: entry)
        }
        .configurationDisplayName("倒计时")
        .description("请设置倒计时的日期")
        .supportedFamilies([.systemSmall])
        
    }
}

struct CountDownEntryView : View {
    //这里是Widget的类型判断
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: CountDownProvider.Entry
    
    var body: some View {
        //entry.date
        countdownView(title: entry.data.title,day: entry.data.day)
            
    }
}

struct CountDown_Previews: PreviewProvider {
    static var previews: some View {
        CountDownEntryView(entry: CountDownEntry(date: Date(), data: CountDown(date: Date(), title: "")))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
