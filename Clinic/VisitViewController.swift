//
//  VisitViewController.swift
//  Clinic
//
//  Created by Levchuk Misha on 11.09.17.
//  Copyright © 2017 Levchuk Misha. All rights reserved.
//

import UIKit

class VisitViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private struct Constants {
        static let cellIdentifier = "dateCell"
        static let timesSegueIdentifier = "timesListSegue"
        static let timesViewControllerId = "timesViewControllerId"
    }

    let workDays = ["20.01", "24.01", "28.01"]

    @IBOutlet weak var datesCollectionView: UICollectionView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datesCollectionView.delegate = self
        datesCollectionView.dataSource = self

        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workDays.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = datesCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath) as! DateCollectionViewCell
        cell.dateLabel.text = workDays[indexPath.row]

        return cell

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.timesSegueIdentifier, sender: nil)
    }



//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let timesPage = self.storyboard?.instantiateViewController(withIdentifier: Constants.timesViewControllerId)
//        self.navigationController?.pushViewController(timesPage!, animated: true)
//
//    }
    

    

}
