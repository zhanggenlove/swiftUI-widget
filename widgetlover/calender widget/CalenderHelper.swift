//
//  CalenderHelper.swift
//  widgetlover
//
//  Created by 张亦梓 on 2020/10/16.
//

import Foundation
struct CalenderHelper {
    
    static var beginningOfTomorrow: Date {
        var date = Date().beginning(of: .day) ?? Date()
        date.add(.day, value: 1)
        return date
    }
    
    static var beginningOfMonth: Date {
        
        let date = Date()
//        var date = Date()
//        date.add(.month, value: -2)
        return date.beginning(of: .month) ?? Date()
        
    }
    
    static var indexOfToday: Int {
        Date().day + CalenderHelper.prefix - 1
    }
    
    static var countOfItems: Int {
        items.count
    }
    
    static var prefix: Int {
        beginningOfMonth.weekday - 1
    }
    
    static var monthName: String {
        beginningOfMonth.monthName
    }
    
    
    
    static var items: [String] {
        
        var daysInMonth = [String]()
        for day in 1 ... beginningOfMonth.daysInMonth {
            daysInMonth.append("\(day)")
        }
        
        return [String](repeating: "", count: prefix) + daysInMonth
    }
    
}
