//
//  Battery.swift
//  widgetlover
//
//  Created by 张亦梓 on 2020/10/14.
//

import Foundation
import UIKit

struct Battery {
    let batteryLevel: Float
    let batteryStatus: Int
    let strNowTime: String
}

struct BatteryGet {
    static func getBattery() -> (batteryLevel:Float, batteryState:Int,strNowTime:String) {
        UIDevice.current.isBatteryMonitoringEnabled = true
        let batteryLevel = UIDevice.current.batteryLevel
        let batteryState: Int = UIDevice.current.batteryState.rawValue
        print(batteryLevel)
        print(batteryState)
        print(CGFloat(batteryLevel))
        //获取时间
        let date = Date()
        let timeFormatter = DateFormatter()
        //日期显示格式，可按自己需求显示
        timeFormatter.dateFormat = "HH:mm"
        let strNowTime = timeFormatter.string(from: date) as String
        //  case unknown = 0
        //  case unplugged = 1
        //  case charging = 2
        //  case full = 3
        let data = (batteryLevel,batteryState,strNowTime)
        return data
    }
}

