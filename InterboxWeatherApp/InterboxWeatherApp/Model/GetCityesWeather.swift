//
//  GetCityesWeather.swift
//  InterboxWeatherApp
//
//  Created by Александр Савков on 27.12.21.
//

import Foundation
import CoreLocation

let networkWeatherManager = NetworkWeatherManager()

func getCityWeather(cityArray: [String], completionHandler: @escaping (Int, Weather) -> Void) {
    for (index, item) in cityArray.enumerated() {
        getCoordinateFrom(city: item) { coordinate, error in
            guard let coordinate = coordinate, error ==  nil else {
                return
            }
            networkWeatherManager.fetchWeather(latitude: coordinate.latitude, longitude: coordinate.longitude) { Weather in
                completionHandler(index, Weather)
            }

        }
    }
    
}
func getCoordinateFrom(city: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
    CLGeocoder().geocodeAddressString(city) { (placemark, error) in
        completion(placemark?.first?.location?.coordinate, error)
    }
    
}
