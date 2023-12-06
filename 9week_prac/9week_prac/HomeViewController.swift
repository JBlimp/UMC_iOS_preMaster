//
//  HomeViewController.swift
//  9week_prac
//
//  Created by junseok on 12/6/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var maxtempLabel: UILabel!
    @IBOutlet weak var mintempLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var weather: Weather?
    var main: Main?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        WeatherService().getWeather { result in
            switch result {
            case .success(let weatherResponse):
                DispatchQueue.main.async {
                    self.weather = weatherResponse.weather.first
                    self.main = weatherResponse.main
                    self.name = weatherResponse.name
                    self.setWeatherUI()
                }
            case .failure(_ ):
                print("error")
            }
        }
    }
    
    private func setWeatherUI() {
        let url = URL(string: "https://openweathermap.org/img/wn/\(self.weather?.icon ?? "00")@2x.png")
            let data = try? Data(contentsOf: url!)
            if let data = data {
                weatherImage.image = UIImage(data: data)
            }
        tempLabel.text = "기온: "+"\(main!.temp)"
        maxtempLabel.text = "최고 기온: " + "\(main!.temp_max)"
        mintempLabel.text = "    최저 기온: " + "\(main!.temp_min)"
    }
}
