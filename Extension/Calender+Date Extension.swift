//
//  Calender+Date Extension.swift
//  widgetlover
//
//  Created by 张亦梓 on 2020/10/16.
//

import Foundation

extension Calendar {

    func numberOfDaysInMonth(for date: Date) -> Int {
        return range(of: .day, in: .month, for: date)!.count
    }

}

extension Date {
    
    var calendar: Calendar {
        Calendar.current
    }
    
    var daysInMonth: Int {
        calendar.numberOfDaysInMonth(for: self)
    }
    
    var weekday: Int {
        return calendar.component(.weekday, from: self)
    }
    
    var day: Int {
        get {
            return calendar.component(.day, from: self)
        }
        set {
            let allowedRange = calendar.range(of: .day, in: .month, for: self)!
            guard allowedRange.contains(newValue) else { return }

            let currentDay = calendar.component(.day, from: self)
            let daysToAdd = newValue - currentDay
            if let date = calendar.date(byAdding: .day, value: daysToAdd, to: self) {
                self = date
            }
        }
    }
    
    var monthName: String {
  
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        dateFormatter.locale = Locale(identifier: "zh_CN")
        return dateFormatter.string(from: self)
    }
    
    func beginning(of component: Calendar.Component) -> Date? {
        if component == .day {
            return calendar.startOfDay(for: self)
        }

        var components: Set<Calendar.Component> {
            switch component {
            case .second:
                return [.year, .month, .day, .hour, .minute, .second]

            case .minute:
                return [.year, .month, .day, .hour, .minute]

            case .hour:
                return [.year, .month, .day, .hour]

            case .weekOfYear, .weekOfMonth:
                return [.yearForWeekOfYear, .weekOfYear]

            case .month:
                return [.year, .month]

            case .year:
                return [.year]

            default:
                return []
            }
        }

        guard !components.isEmpty else { return nil }
        return calendar.date(from: calendar.dateComponents(components, from: self))
    }
    
    mutating func add(_ component: Calendar.Component, value: Int) {
        if let date = calendar.date(byAdding: component, value: value, to: self) {
            self = date
        }
    }
    
    /**
     扩展Date
     daysBetweenDate: 计算两天差距天数
     */
    func daysBetweenDate(toDate: Date) -> Int {
        let now = Date()
        let nowTimeStamp = Int(now.timeIntervalSince1970)
        let toDateTimeStamp = Int(toDate.timeIntervalSince1970)
        let difference:Double = Double(abs(nowTimeStamp - toDateTimeStamp))
        if(nowTimeStamp < toDateTimeStamp){
            return Int(floor( difference / (86400))) + 1
        }
        else{
            return Int(floor( difference / (86400)))
        }
        
    }
    func dateToString(_ date:Date,dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter()
         formatter.locale = Locale.init(identifier: "zh_CN")
         formatter.dateFormat = dateFormat
         let date = formatter.string(from: date)
         return date
    }
    func getRelateiveDate(unitsStyle: RelativeDateTimeFormatter.UnitsStyle)->String{
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = unitsStyle
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
