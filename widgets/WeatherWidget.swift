//
//  WeatherWidget.swift
//  widgetsExtension
//
//  Created by 张亦梓 on 2020/10/17.
//

import WidgetKit
import SwiftUI
import Intents

struct WeatherWidgetProvider: IntentTimelineProvider {
    
    func placeholder(in context: Context) -> WeatherWidgetEntry {
        return WeatherWidgetEntry(date: Date(), weather: Weather())
    }
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (WeatherWidgetEntry) -> Void) {
        let entry = WeatherWidgetEntry(date: Date(), weather: Weather())
        completion(entry)
    }
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 2, to: currentDate)!
        //逃逸闭包传入匿名函数 当调用completion时调用该匿名函数刷新Widget
        let weatherVM = WeatherVM()
        weatherVM.fetchWeather()
        let entry = WeatherWidgetEntry(date: Date(), weather: Weather(temp: weatherVM.temperature, city: weatherVM.cityName, icon: weatherVM.icon, windDir: weatherVM.windDir, windSpeed: weatherVM.windspeed))
       
        let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
        completion(timeline)
    }
}

struct Weather {
    var temp: String = "20℃"
    var city: String = "昆明市"
    var icon: String = "100"
    var windDir: String = "东南风"
    var windSpeed: String = "24km/h"
}

struct WeatherWidgetEntry: TimelineEntry {
    public let date: Date
    public let weather: Weather
}

struct WeatherWidget: Widget {
    private let kind: String = "WeatherWidget"
    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: WeatherWidgetProvider()) { entry in
            WeatherWidgetView(entry: entry)
        }
        .configurationDisplayName("小清新日历")
        .description("请选择优雅的日历主题")
        .supportedFamilies([.systemMedium,.systemSmall])
        
    }
}

struct WeatherWidgetView : View {
    //这里是Widget的类型判断
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: WeatherWidgetProvider.Entry
    
    @ViewBuilder
    var body: some View {
        //entry.date
       weatherView()
    }
}

struct WeatherWidget_Previews: PreviewProvider {
    static var previews: some View {
        WeatherWidgetView(entry: WeatherWidgetEntry(date: Date(),weather: Weather()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
