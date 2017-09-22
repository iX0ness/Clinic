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

    let times = ["9:00", "10:00", "12:00"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timesTableView.delegate = self
        timesTableView.dataSource = self
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

    
    

}
