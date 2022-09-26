//
//  WeatherManager.swift
//  Hava Durumu
//
//  Created by Fatih Bilgin on 26.09.2022.
//

import Foundation
import CoreLocation
let APIKEY = "145438a09f6ae135d90ac54fb7ebe0d9"
let main = "https://api.openweathermap.org/data/2.5/weather?"
class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "\(main)lat=\(latitude)&lon=\(longitude)&appid=\(APIKEY)&units=metric") else {fatalError("Missing URL")}
        print(url)
        let urlRequest = URLRequest(url: url)
        
       let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data") }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}

struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
