//
//  LocationManager.swift
//  widgetlover
//
//  Created by 张亦梓 on 2020/10/16.
//

import Foundation
import CoreLocation


class LocationManager: NSObject {

    var userLatitude: Double = 0
    var userLongitude: Double = 0
    var city: String = "昆明市"
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

}

extension LocationManager:  CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager.stopUpdatingLocation()
        guard let location = locations.last else { return }
        userLatitude = location.coordinate.latitude
        userLongitude = location.coordinate.longitude
//        print(location)
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let placemark = placemarks?.last{
                // 国家 省  市  区  街道  名称  国家编码  邮编
                let locality=placemark.locality; // 城市
                self.city = locality ?? "昆明市"
            }
        }
    }
}
