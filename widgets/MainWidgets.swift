//
//  MainWidgets.swift
//  widgetsExtension
//
//  Created by 张亦梓 on 2020/10/15.
//

import SwiftUI

struct MainWidgets: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

@main
struct Widgets: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        BatteryWidget()
        ClockWidget()
        QuickStartEntryWidget()
        CalendertEntryWidget()
//        WeatherWidget()
        CountDownWidget()
    }
}

struct MainWidgets_Previews: PreviewProvider {
    static var previews: some View {
        MainWidgets()
    }
}
