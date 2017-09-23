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
        //print("Selected date: \(selectedDay) \nDoctor index is: \(doctorIndex!)")

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
        performSegue(withIdentifier: Constants.reservationSegueIdentifier, sender: nil)
    }

    func getTimes(with reference: DatabaseReference) {
        if doctorIndex == 0 {
            switch selectedDay {
            case "2.10":
                databaseHandle = reference.child("doc1").child("2dot10").observe(.childAdded, with: { (snapshot) in
                    self.times.append(snapshot.key)
                })
            case "9.10":
                break
            case "16.10":
                break
            case "23.10":
                break
            case "30.10":
                break
            case "4.10":
                break
            case "11.10":
                break
            case "18.10":
                break
            case "25.10":
                break
            case "6.10":
                break
            case "13.10":
                break
            case "20.10":
                break
            case "27.10":
                break
            default:
                print("Error")
            }
        } else if doctorIndex == 1 {
            switch selectedDay {
            case "3.10":
                break
            case "10.10":
                break
            case "17.10":
                break
            case "24.10":
                break
            case "31.10":
                break
            default:
                print("Error")
            }

        } else if doctorIndex == 2 {
            switch selectedDay {
            case "3.10":
                break
            case "10.10":
                break
            case "17.10":
                break
            case "24.10":
                break
            case "31.10":
                break
            case "6.10":
                break
            case "13.10":
                break
            case "20.10":
                break
            case "27.10":
                break
            default:
                print("Error")
            }
        } else {
            print("ERROR")
        }
    }







    
}
