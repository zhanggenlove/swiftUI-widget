//
//  WeatherData.swift
//  widgetlover
//
//  Created by 张亦梓 on 2020/10/16.
//

import Foundation

class WeatherData: Codable {
    let code: String
    let updateTime: String
    let now: WeatherNow
    
//    let main: Main
//    let weather: [WeatherArray]
}
class WeatherNow: Codable {
    let temp: String
    let feelsLike: String
    let icon: String
    let text: String
    let wind360: String
    let windDir: String
    let windScale: String
    let windSpeed: String
    let humidity: String
    let precip: String
    let pressure: String
    let vis: String
    let cloud: String
    let dew: String
}
