//
//  Doctor.swift
//  Clinic
//
//  Created by Levchuk Misha on 11.09.17.
//  Copyright © 2017 Levchuk Misha. All rights reserved.
//

import Foundation
import UIKit

class Doctor {

    var firstName: String
    var lastName: String
    var specialty: String
    var image: UIImage
    var workDays: [WorkDay]

    init(firstName: String, lastName: String, specialty: String, image: UIImage, workDays: [WorkDay]) {
        self.firstName = firstName
        self.lastName = lastName
        self.specialty = specialty
        self.image = image
        self.workDays = workDays
    }

    func presentWorkDays() -> String {
        var workDaysString = String()
        for day in workDays {
            workDaysString.append("\(day.description()) \n")
        }
        return workDaysString
    }
    
}
