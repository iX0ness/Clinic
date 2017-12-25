//
//  DateCollectionViewCell.swift
//  Clinic
//
//  Created by Levchuk Misha on 12.09.17.
//  Copyright © 2017 Levchuk Misha. All rights reserved.
//

import UIKit

/**
 Custom cell which is used in VisitViewController.swift
 */

class DateCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var dateLabel: UILabel!


    /**
     Function which creating cell's view
     */

    func configureCell() {
        let image = UIImage(named: "circle")
        let imageView = UIImageView(image: image)
        self.backgroundView = imageView
    }
}
