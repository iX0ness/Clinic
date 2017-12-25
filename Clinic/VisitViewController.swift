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

    /**
     The structure contains data, which won't be modified.
     */
    private struct Constants {
        static let cellIdentifier = "dateCell"
        static let timesSegueIdentifier = "timesListSegue"
        static let timesViewControllerId = "timesViewControllerId"
    }

    private struct Doctors {
        static let doctor1 = "doc1"
        static let doctor2 = "doc2"
        static let doctor3 = "doc3"
    }

    var workDays = [String]() {

        didSet {
            datesCollectionView.reloadData()
        }
    }

    // MARK: -  Stored properties
    var doctorIndex: Int!
    /// Reference to firebase database
    var reference = Database.database().reference()
    var databaseHandle: DatabaseHandle?


    @IBOutlet weak var datesCollectionView: UICollectionView!



    override func viewDidLoad() {
        super.viewDidLoad()
        datesCollectionView.delegate = self
        datesCollectionView.dataSource = self
        getDates(with: reference)
        configureCollectionView()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workDays.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = datesCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath) as! DateCollectionViewCell
        cell.configureCell()
        cell.dateLabel.text = workDays[indexPath.row].replacingOccurrences(of: "dot", with: ".")
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = datesCollectionView.cellForItem(at: indexPath)
        self.performSegue(withIdentifier: Constants.timesSegueIdentifier, sender: cell)
    }



    /// Function gets work days of selected doctor.
    ///
    /// - parameter reference: Reference to database.
    ///

    func getDates(with reference: DatabaseReference) {
        if doctorIndex == 0 {
           databaseHandle = reference.child(Doctors.doctor1).observe(.childAdded, with: { (snapshot) in
            self.workDays.append(snapshot.key)
            })

        } else if doctorIndex == 1 {
            databaseHandle = reference.child(Doctors.doctor2).observe(.childAdded, with: { (snapshot) in
                self.workDays.append(snapshot.key)
            })

        } else if doctorIndex == 2 {
            databaseHandle = reference.child(Doctors.doctor3).observe(.childAdded, with: { (snapshot) in
                self.workDays.append(snapshot.key)
            })

        } else {
            createAlert(title: "Error", message: "Connection lost")
        }
    }


    /// Function creates allert to inform user.
    ///
    /// - parameter title: Allert's title.
    /// - parameter message: Describes allert's details.
    ///

    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is TimesViewController {
            let cell = sender as! DateCollectionViewCell
            let destinationController = segue.destination as! TimesViewController
            destinationController.navigationItem.title = "\(String(describing: cell.dateLabel.text!))"
            if let dateValue = cell.dateLabel.text {
                destinationController.selectedDay = dateValue
                destinationController.doctorIndex = doctorIndex
            }
        }
    }

    /**
     Function configure view of CollectionView
    */

    func configureCollectionView() {
        let image = UIImage(named: "Background")
        let imageView = UIImageView(image: image)
        datesCollectionView.backgroundView = imageView
        datesCollectionView.contentInset = UIEdgeInsets(top: 10, left: 15, bottom: 5, right: 15)
    }
   

}
