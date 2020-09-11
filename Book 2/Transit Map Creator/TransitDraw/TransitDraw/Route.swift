//
//  Route.swift
//  TransitDraw
//
//  Created by Student on 2020-08-26.
//  Copyright © 2020 Student. All rights reserved.
//

import Foundation

// fix ID type and arrival/departure times
struct Agency {
    var agencyID: String
    var agencyName: String
    var agencyURL: URL
    var agencyTimeZone: TimeZone
    var agencyLanguage: String
    var agencyPhone: String
    var agencyFareURL: URL
    var agencyEmail: String
}

struct Stop {
    var stopID: String
    var stopCode: String
    var stopName: String
    var stopDescription: String
    var stopLatitude: Float
    var stopLongitude: Float
    var zoneID: String
    var stopURL: URL
    
    enum locationType {
        case zero, one, two, three
    }
    
    var parentStation: String
    var stopTimeZone: TimeZone
    
    enum wheelchairBoarding {
        
    }
}

struct Route {
    var routeID: String
    var agencyID: String
    var routeShortName: String
    var routeLongName: String
    var roudeDescription: String
    
    enum routeType {
        case zero, one, two, three, four, five, six, seven, eleven, twelve
    }
    
    var routeURL: URL
    var routeColor: String
    var routeTextColor: String
}

struct Trip {
    var routeID: String
    var serviceID: String
    var tripID: String
    var tripHeadsign: String
    var tripShortName: String
    
    enum directionID {
        case zero, one
    }
    
    var blockID: String
    var shapeID: String
    
    enum wheelchairAccessible {
        case zero, one, two
    }
    
    enum bikesAllowed {
        case zero, one, two
    }
}

struct StopTime {
    var tripID: String
    var arrivalTime: Date
    var departureTime: Date
    var stopID: String
    var stopSequence: Int
    var stopHeadsign: String
    
    enum pickupTime {
        case zero, one, two, three
    }
    
    enum dropOffTime {
        case zero, one, two, three
    }
    
    var shapeDistanceTravelled: Float
    
    enum timepoint {
        case zero, one
    }
}

struct CalendarDate {
    var serviceID: String
    var date: Date
    
    enum exceptionTime {
        case one, two
    }
}

struct Shape {
    var shapeID: String
    var shapePointLatitude: Float
    var shapePointLongitude: Float
    var shapePointSequence: Int
    var shapeDistanceTravelled: Float
}

struct FeedInfo {
    var feedPublisherName: String
    var feedPublisherURL: URL
    var feedLanguage: String
    var feedStartDate: Date
    var feedEndDate: Date
    var feedVersion: String
}
