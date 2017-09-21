//
//  VisitViewController.swift
//  Clinic
//
//  Created by Levchuk Misha on 11.09.17.
//  Copyright © 2017 Levchuk Misha. All rights reserved.
//

import UIKit
import FirebaseDatabase

class VisitViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private struct Constants {
        static let cellIdentifier = "dateCell"
        static let timesSegueIdentifier = "timesListSegue"
        static let timesViewControllerId = "timesViewControllerId"
    }

    var workDays = [String]() {
        willSet {
            getDates(with: reference)
        }
        didSet {
            datesCollectionView.reloadData()
        }
    }
    var doctorIndex: Int!
    var reference = Database.database().reference()
    var databaseHandle: DatabaseHandle?


    @IBOutlet weak var datesCollectionView: UICollectionView!

    override func viewWillAppear(_ animated: Bool) {
        getDates(with: reference)

    }


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

    func getDates(with reference: DatabaseReference) {
        if doctorIndex == 0 {
           databaseHandle = reference.child("doc1").observe(.childAdded, with: { (snapshot) in
            self.workDays.append(snapshot.key)
            print(self.workDays.count)



            })
//            Database.database().reference().child("doc1").observe(.childAdded, with: { (snapshot) in
//                guard let dict = snapshot.value as? [String:Any]
//
//            })
        } else if doctorIndex == 1 {

        } else if doctorIndex == 2 {

        } else {
            
        }

    }



//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let timesPage = self.storyboard?.instantiateViewController(withIdentifier: Constants.timesViewControllerId)
//        self.navigationController?.pushViewController(timesPage!, animated: true)
//
//    }


    

}
