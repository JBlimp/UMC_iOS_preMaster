//
//  WeatherService.swift
//  9week_prac
//
//  Created by junseok on 12/6/23.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case noData
    case decodingError
}

class WeatherService {
    let baseURL = "https://api.openweathermap.org/data/2.5/weather?q=seoul"
    let appid = "&APPID=ed1ab475ac1ed080ecca0ede4ce94159"
    
    func getWeather(completion: @escaping (Result<WeatherResponse, NetworkError>) -> Void) {
        let url = URL(string: baseURL + self.appid)
        
        guard let url = url else {
            print("url error")
            return completion(.failure(.badUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("data error")
                return completion(.failure(.noData))
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            
            if let weatherResponse = weatherResponse {
                completion(.success(weatherResponse))
            } else {
                print("decoding error")
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
