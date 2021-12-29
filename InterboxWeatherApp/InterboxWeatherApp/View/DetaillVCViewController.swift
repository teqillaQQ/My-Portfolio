//
//  DetaillVCViewController.swift
//  InterboxWeatherApp
//
//  Created by Александр Савков on 27.12.21.
//

import UIKit
import SwiftSVG

class DetaillVCViewController: UIViewController {

    @IBOutlet weak var nameCityLabel: UILabel!
    @IBOutlet weak var imageCityLabel: UIView!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var tempCityLabel: UILabel!
    
    @IBOutlet weak var pressureCityLabel: UILabel!
    @IBOutlet weak var wintdSpeedCityLabel: UILabel!
    @IBOutlet weak var maxTempCityLabel: UILabel!
    @IBOutlet weak var minTempCityLabel: UILabel!
    
    var weatherModel: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreashLabels()
    }
    
    func refreashLabels() {
        nameCityLabel.text = weatherModel?.name
        
        let url = URL(string: "https://yastatic.net/weather/i/icons/funky/dark/\(weatherModel!.conditionCode).svg")
        let weatherImage = UIView(svgURL: url!) {(image) in
            image.resizeToFit(self.imageCityLabel.bounds)
        }
        
        self.imageCityLabel.addSubview(weatherImage)
        conditionLabel.text = weatherModel?.conditionString
        tempCityLabel.text = "\(weatherModel?.temperature ?? 0)"
        pressureCityLabel.text = "\(weatherModel?.pressureMm ?? 0)"
        wintdSpeedCityLabel.text = "\(weatherModel?.windSpeed ?? 0)"
        maxTempCityLabel.text = "\(weatherModel?.tempMax ?? 0)"
        minTempCityLabel.text = "\(weatherModel?.tempMin ?? 0)"
    }
    
}
