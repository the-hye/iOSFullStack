//
//  Forecast.swift
//  WeatherApp
//
//  Created by Jihye Seok on 4/1/25.
//

import Foundation

struct Factor: Codable {
    let temp: Double
    let humidity: Int
}

struct Weather: Codable {
    let main: String
    let description: String
    let icon: String
}

struct Forecast: Codable {
    let weather: [Weather]
    let factor: Factor
    let strDate: String
    
    enum CodingKeys: String, CodingKey {
        case strDate = "dt_txt"
        case weather
        case factor = "main"
    }
}

struct ForecastRoot: Codable {
    let list: [Forecast]
    let cnt: Int
}
