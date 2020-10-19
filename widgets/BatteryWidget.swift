//
//  battery.swift
//  widgetsExtension
//
//  Created by 张亦梓 on 2020/10/14.
//

import WidgetKit
import SwiftUI
import Intents

struct BatteryProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> BatteryEntry {
        return BatteryEntry(date: Date(), data: Battery(batteryLevel: BatteryGet.getBattery().batteryLevel, batteryStatus: BatteryGet.getBattery().batteryState, strNowTime: BatteryGet.getBattery().strNowTime))
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (BatteryEntry) -> Void) {
        let entry = BatteryEntry(date: Date(), data: Battery(batteryLevel: BatteryGet.getBattery().batteryLevel, batteryStatus: BatteryGet.getBattery().batteryState, strNowTime: BatteryGet.getBattery().strNowTime))
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 2, to: currentDate)!
        let entry = BatteryEntry(date: currentDate,data: Battery(batteryLevel: BatteryGet.getBattery().batteryLevel, batteryStatus: BatteryGet.getBattery().batteryState, strNowTime: BatteryGet.getBattery().strNowTime))
        let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
        completion(timeline)
    }
}

struct BatteryEntry: TimelineEntry {
    public let date: Date
    public let data: Battery
}

//@main
struct BatteryWidget: Widget {
    private let kind: String = "BatteryWidget"
    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: BatteryProvider()) { entry in
            BatteryEntryView(entry: entry)
        }
        .configurationDisplayName("电池电量")
        .description("关注您的电池健康")
        .supportedFamilies([.systemMedium,.systemSmall])
        
    }
}

struct BatteryEntryView : View {
    //这里是Widget的类型判断
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: BatteryProvider.Entry
    
    @ViewBuilder
    var body: some View {
        batteryView(percentage: entry.data.batteryLevel,batterystatus: entry.data.batteryStatus,time: entry.data.strNowTime)
    }
}

struct battery_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
