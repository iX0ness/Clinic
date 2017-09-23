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

        didSet {
            datesCollectionView.reloadData()
        }
    }
    var doctorIndex: Int!
    var reference = Database.database().reference()
    var databaseHandle: DatabaseHandle?


    @IBOutlet weak var datesCollectionView: UICollectionView!



    override func viewDidLoad() {
        super.viewDidLoad()
        datesCollectionView.delegate = self
        datesCollectionView.dataSource = self
        getDates(with: reference)
        

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workDays.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = datesCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath) as! DateCollectionViewCell

        cell.dateLabel.text = workDays[indexPath.row].replacingOccurrences(of: "dot", with: ".")


        return cell

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = datesCollectionView.cellForItem(at: indexPath)
        self.performSegue(withIdentifier: Constants.timesSegueIdentifier, sender: cell)
    }




    func getDates(with reference: DatabaseReference) {
        if doctorIndex == 0 {
           databaseHandle = reference.child("doc1").observe(.childAdded, with: { (snapshot) in
            self.workDays.append(snapshot.key)

            })

        } else if doctorIndex == 1 {
            databaseHandle = reference.child("doc2").observe(.childAdded, with: { (snapshot) in
                self.workDays.append(snapshot.key)

            })

        } else if doctorIndex == 2 {
            databaseHandle = reference.child("doc3").observe(.childAdded, with: { (snapshot) in
                self.workDays.append(snapshot.key)

            })

        } else {
            createAlert(title: "Error", message: "Connection lost")
        }

    }

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
}
