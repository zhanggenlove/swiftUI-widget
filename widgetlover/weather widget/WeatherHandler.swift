//
//  WeatherHandler.swift
//  widgetlover
//
//  Created by 张亦梓 on 2020/10/16.
//

import Foundation

struct WeatherHandler {
    
    var APIString = "https://devapi.qweather.com/v7/weather/now?key=8d6bfa348d834ae39cd8d488bda63827"
    
    var city: String = "昆明市"
    
    var longitude: Double = 0 {
        didSet {
            APIString = APIString + "&location=\(longitude)" + ",\(latitude)"
        }
    }
    
    var latitude: Double = 0 {
        didSet {
            APIString = APIString + "&location=\(longitude)" + ",\(latitude)"
        }
    }
    
    
    func fetchWeather(completion: @escaping (WeatherDataFliter?) -> ()) {
        
        let APIString = self.APIString.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        
        guard let url = URL(string: APIString) else {
            fatalError("Invalid URL")
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data,response,error in
            if let error = error {
                // handle the transport error
                print("Task Error:\(error.localizedDescription)")
                completion(nil)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                // handle the server error
                print("Server error:")
                completion(nil)
                return
            }
            
            if let safeData = data {
                if let decoded = try? JSONDecoder().decode(WeatherData.self, from: safeData) {
                    let cityName = self.city
                    print(cityName)
                    let temperature = decoded.now.temp
                    let feelsLike = decoded.now.feelsLike
                    let icon = decoded.now.icon
                    let text = decoded.now.text
                    let wind360 = decoded.now.wind360
                    let windDir = decoded.now.windDir
                    let windSpeed = decoded.now.windSpeed
                    
                    let weatherModel = WeatherDataFliter(city: cityName, temp: temperature, feelsLike: feelsLike, icon: icon, text: text, wind360: wind360, windDir: windDir, windSpeed: windSpeed)
                    completion(weatherModel)
                }
            }
        })
        task.resume()
    }
    
}
