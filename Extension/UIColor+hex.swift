//
//  UIColor+hex.swift
//  widgetlover
//
//  Created by 张亦梓 on 2020/10/14.
//

import Foundation
import UIKit
import SwiftUI

extension UIColor {
     
    convenience init(hex:String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
//
//        if ((cString.count) != 6) {
//            return UIColor.gray
//        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,blue: CGFloat(rgbValue & 0x0000FF) / 255.0,alpha: CGFloat(1.0))
    }
    
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

extension Color {
    //battery color
    static let battery_widgetbgcolor = Color("battery_widgetbgcolor")
    static let battery_batterytextcolor = Color("battery_batterytextcolor")
    static let battery_batterytiptextcolor = Color("battery_batterytiptextcolor")
    static let battery_timetextcolor = Color("battery_timetextcolor")
    static let battery_bordercolor1 = Color("battery_bordercolor1")
    //clock color
    static let clock_widgetbgcolor = Color("clock_widgetbgcolor")
    static let clock_minutehandcolor = Color("clock_minutehandcolor")
    static let clock_hourhandcolor = Color("clock_hourhandcolor")
    static let clock_tickmarkcolor = Color("clock_tickmarkcolor")
    static let clock_shadowcolor1 = Color("clock_shadowcolor1")
    static let clock_shadowcolor2 = Color("clock_shadowcolor2")
    //quick start
    static let quickstart_widgetbgcolor = Color("quickstart_widgetbgcolor")
    static let quickstart_shadowcolor1 = Color("quickstart_shadowcolor1")
    static let quickstart_shadowcolor2 = Color("quickstart_shadowcolor2")
}
