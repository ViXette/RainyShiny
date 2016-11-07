//
//  Constants.swift
//  RainyShiny
//
//  Created by VX on 06/11/2016.
//  Copyright © 2016 VXette. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LAT = "lat="
let LON = "&lon="
let APP_ID = "&appid="
let API_KEY = "83a77bbc06b61a7ca5d43496dc736b72"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LAT)\(Location.sharedInstance.lat!)\(LON)\(Location.sharedInstance.lon!)\(APP_ID)\(API_KEY)"

typealias DownloadComplete = () -> ()
