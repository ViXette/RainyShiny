//
//  CurrentWeather.swift
//  RainyShiny
//
//  Created by VX on 06/11/2016.
//  Copyright © 2016 VXette. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather
{
	var _cityName :String!
	var cityName :String {
		if _cityName == nil {
			_cityName = ""
		}
		return _cityName
	}
	
	var _date: String!
	var date :String {
		if _date == nil {
			_date = ""
		}
		
		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .medium
		dateFormatter.timeStyle = .none
		let currentDate = dateFormatter.string(from: Date())
		
		_date = "Today, \(currentDate)"
		
		return _date
	}
	
	var _weatherType: String!
	var weatherType :String {
		if _weatherType == nil {
			_weatherType = ""
		}
		return _weatherType
	}
	
	var _currentTemp: Double!
	var currentTemp :Double {
		if _currentTemp == nil {
			_currentTemp = 0.0
		}
		return _currentTemp
	}
	
	func downloadWeatherDetails(completed :@escaping DownloadComplete) {
		let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
		Alamofire.request(currentWeatherURL).responseJSON {
			response in
			
			let result = response.result
			
			if let jsonDict = result.value as? Dictionary<String, AnyObject> {
				if let name = jsonDict["name"] as? String {
					self._cityName = name.capitalized
				}
				
				if let weather = jsonDict["weather"] as? [Dictionary<String, AnyObject>] {
					if let weatherType = weather[0]["main"] as? String {
						self._weatherType = weatherType.capitalized
					}
				}
				
				if let main = jsonDict["main"] as? Dictionary<String, AnyObject> {
					if let temperature = main["temp"] as? Double {
						self._currentTemp = round(temperature - 273.15)
					}
				}
				print(CURRENT_WEATHER_URL)
			}
			completed()
		}
	}
	
}
