//
//  WeatherVM.swift
//  widgetlover
//
//  Created by 张亦梓 on 2020/10/16.
//

import Foundation

class WeatherVM: ObservableObject {
    
    var weatherHandler = WeatherHandler()
    
    @Published var cityName: String = ""
    @Published var temperature: String = ""
    @Published var icon: String = "100"
    @Published var windspeed: String = "1"
    @Published var windDir: String = "西南风"
    
    func fetchWeather() {
        let locationDataManager = LocationManager()
        weatherHandler.city = locationDataManager.city
        weatherHandler.latitude = locationDataManager.userLatitude
        weatherHandler.longitude = locationDataManager.userLongitude

        weatherHandler.fetchWeather() { model in
            if model != nil {
                DispatchQueue.main.async {
                    self.cityName = model!.city
                    self.temperature = model!.temp
                    self.icon = model!.icon
                    self.windspeed = model!.windSpeed
                    self.windDir = model!.windDir
                }
                
            }
        }
    }

}
