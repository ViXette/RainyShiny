//
//  Location.swift
//  RainyShiny
//
//  Created by VX on 07/11/2016.
//  Copyright © 2016 VXette. All rights reserved.
//

import CoreLocation

class Location {
	
	static var sharedInstance = Location()
	
	private init() {}
	
	var lat :Double!
	var lon :Double!
	
}
