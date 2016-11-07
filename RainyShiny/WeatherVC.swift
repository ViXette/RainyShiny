//
//  WeatherVC.swift
//  RainyShiny
//
//  Created by VX on 05/11/2016.
//  Copyright © 2016 VXette. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

	@IBOutlet weak var date_label: UILabel!
	@IBOutlet weak var currTemp_label: UILabel!
	@IBOutlet weak var location_label: UILabel!
	@IBOutlet weak var currWeather_image: UIImageView!
	@IBOutlet weak var currWeather_label: UILabel!
	
	@IBOutlet weak var tableview: UITableView!
	
	let locationManager = CLLocationManager()
	var currentLocation :CLLocation!
	
	var currentWeather :CurrentWeather!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableview.delegate = self
		tableview.dataSource = self
		
		locationManager.delegate = self
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		locationManager.requestWhenInUseAuthorization()
		locationManager.startMonitoringSignificantLocationChanges()
		
		locationAuthStatus()
		
		currentWeather = CurrentWeather()
		currentWeather.downloadWeatherDetails {
			self.updateMainUI()
		}
	}
	
	func locationAuthStatus() {
		if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
			if locationManager.location != nil {
				currentLocation = locationManager.location
				Location.sharedInstance.lat = currentLocation.coordinate.latitude
				Location.sharedInstance.lon = currentLocation.coordinate.longitude
			}
		} else {
			locationManager.requestWhenInUseAuthorization()
			locationAuthStatus()
		}
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 6
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
		
		return cell
	}
	
	func updateMainUI() {
		date_label.text = currentWeather.date
		currTemp_label.text = "\(currentWeather.currentTemp)°"
		location_label.text = currentWeather.cityName
		currWeather_label.text = currentWeather.weatherType
		currWeather_image.image = UIImage(named: currentWeather.weatherType)
	}

}

