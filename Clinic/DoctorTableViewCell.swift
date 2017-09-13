//
//  DoctorTableViewCell.swift
//  Clinic
//
//  Created by Levchuk Misha on 11.09.17.
//  Copyright © 2017 Levchuk Misha. All rights reserved.
//

import UIKit

class DoctorTableViewCell: UITableViewCell {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var doctorImageView: UIImageView!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var specialtyLabel: UILabel!
    @IBOutlet weak var workTimeLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func configure(with doctor: Doctor) {
        firstNameLabel.text = doctor.firstName
        lastNameLabel.text = doctor.lastName
        specialtyLabel.text = doctor.specialty
        doctorImageView.image = doctor.image
        workTimeLable.text = doctor.presentWorkDays().description
    }




}
