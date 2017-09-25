//
//  TimesViewController.swift
//  Clinic
//
//  Created by Levchuk Misha on 12.09.17.
//  Copyright © 2017 Levchuk Misha. All rights reserved.
//

import UIKit
import FirebaseDatabase 

class TimesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private struct Constants {
        static let cellIdentifier = "cell"
        static let reservationSegueIdentifier = "reservationSegueIdentifier"

    }
    private struct Doctors {
        static let doctor1 = "doc1"
        static let doctor2 = "doc2"
        static let doctor3 = "doc3"
    }
    private struct Dates {
        static let _2dot10 = "2dot10"
        static let _3dot10 = "3dot10"
        static let _4dot10 = "4dot10"
        static let _6dot10 = "6dot10"
        static let _9dot10 = "9dot10"
        static let _10dot10 = "10dot10"
        static let _11dot10 = "11dot10"
        static let _13dot10 = "13dot10"
        static let _16dot10 = "16dot10"
        static let _17dot10 = "17dot10"
        static let _18dot10 = "18dot10"
        static let _20dot10 = "20dot10"
        static let _23dot10 = "23dot10"
        static let _24dot10 = "24dot10"
        static let _25dot10 = "25dot10"
        static let _27dot10 = "27dot10"
        static let _30dot10 = "30dot10"
        static let _31dot10 = "31dot10"
    }

    @IBOutlet weak var timesTableView: UITableView!

    var selectedDay = String()
    var doctorIndex: Int!
    var reference = Database.database().reference()
    var databaseHandle: DatabaseHandle?
    var times = [String]() {
        didSet {
            timesTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timesTableView.delegate = self
        timesTableView.dataSource = self
        getTimes(with: reference)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: Constants.cellIdentifier)
        cell.textLabel?.text = times[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: Constants.reservationSegueIdentifier, sender: nil)
    }

    func getTimes(with reference: DatabaseReference) {
        if doctorIndex == 0 {
            switch selectedDay {
            case "2.10":
                databaseHandle = reference.child(Doctors.doctor1).child(Dates._2dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "9.10":
                databaseHandle = reference.child(Doctors.doctor1).child(Dates._9dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "16.10":
                databaseHandle = reference.child(Doctors.doctor1).child(Dates._16dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "23.10":
                databaseHandle = reference.child(Doctors.doctor1).child(Dates._23dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "30.10":
                databaseHandle = reference.child(Doctors.doctor1).child(Dates._30dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "4.10":
                databaseHandle = reference.child(Doctors.doctor1).child(Dates._4dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "11.10":
                databaseHandle = reference.child(Doctors.doctor1).child(Dates._11dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "18.10":
                databaseHandle = reference.child(Doctors.doctor1).child(Dates._18dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "25.10":
                databaseHandle = reference.child(Doctors.doctor1).child(Dates._25dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "6.10":
                databaseHandle = reference.child(Doctors.doctor1).child(Dates._6dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "13.10":
                databaseHandle = reference.child(Doctors.doctor1).child(Dates._13dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "20.10":
                databaseHandle = reference.child(Doctors.doctor1).child(Dates._20dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "27.10":
                databaseHandle = reference.child(Doctors.doctor1).child(Dates._27dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            default:
                createAlert(title: "Error", message: "The server is temporary crashed")
            }
        } else if doctorIndex == 1 {
            switch selectedDay {
            case "3.10":
                databaseHandle = reference.child(Doctors.doctor2).child(Dates._3dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "10.10":
                databaseHandle = reference.child(Doctors.doctor2).child(Dates._10dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "17.10":
                databaseHandle = reference.child(Doctors.doctor2).child(Dates._17dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "24.10":
                databaseHandle = reference.child(Doctors.doctor2).child(Dates._24dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "31.10":
                databaseHandle = reference.child(Doctors.doctor2).child(Dates._31dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            default:
                createAlert(title: "Error", message: "The server is temporary crashed")
            }

        } else if doctorIndex == 2 {
            switch selectedDay {
            case "3.10":
                databaseHandle = reference.child(Doctors.doctor3).child(Dates._3dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "10.10":
                databaseHandle = reference.child(Doctors.doctor3).child(Dates._10dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "17.10":
                databaseHandle = reference.child(Doctors.doctor3).child(Dates._17dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "24.10":
                databaseHandle = reference.child(Doctors.doctor3).child(Dates._24dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "31.10":
                databaseHandle = reference.child(Doctors.doctor3).child(Dates._31dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "6.10":
                databaseHandle = reference.child(Doctors.doctor3).child(Dates._6dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "13.10":
                databaseHandle = reference.child(Doctors.doctor3).child(Dates._13dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "20.10":
                databaseHandle = reference.child(Doctors.doctor3).child(Dates._20dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "27.10":
                databaseHandle = reference.child(Doctors.doctor3).child(Dates._27dot10).observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            default:
                createAlert(title: "Error", message: "The server is temporary crashed")
            }
        } else {
            createAlert(title: "Error", message: "The server is temporary crashed")
        }
    }

    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }

    

}
