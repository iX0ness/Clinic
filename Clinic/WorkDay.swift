//
//  WorkDay.swift
//  Clinic
//
//  Created by Levchuk Misha on 11.09.17.
//  Copyright © 2017 Levchuk Misha. All rights reserved.
//

import Foundation

class WorkDay {
    var day: WeekDay
    var startTime: Time
    var finishTime: Time

    init(day: WeekDay, startTime: Time, finishTime: Time) {
        self.day = day
        self.startTime = startTime
        self.finishTime = finishTime
    }

    enum WeekDay: String {
        case mon = "PN"
        case tues = "WT"
        case wed = "ŚR"
        case thurs = "CZ"
        case fri = "PT"
    }

    enum Time: String {
        case eight = "8:00"
        case nine = "9:00"
        case ten = "10:00"
        case eleven = "11:00"
        case twelve = "12:00"
        case thirteen = "13:00"
        case fourteen = "14:00"
        case fifteen = "15:00"
        case sixteen = "16:00"
        case seventeen = "17:00"
    }

    func description() -> String {
        return "\(self.day.rawValue): \(self.startTime.rawValue) - \(self.finishTime.rawValue)"
    }
}



