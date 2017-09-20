//
//  DoctorViewController.swift
//  Clinic
//
//  Created by Levchuk Misha on 11.09.17.
//  Copyright © 2017 Levchuk Misha. All rights reserved.
//

import UIKit

class DoctorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    private struct Constants {
        static let doctorCellIdentifier = "doctorCell"
        static let visitDoctorIdentifier = "visitDoctorSegue"
    }



    let doctor1 = Doctor(firstName: "Jan",
                         lastName: "Kowalski",
                         specialty: "Dermatolog",
                         image: UIImage(named: "l1")!,
                         workDays: [WorkDay(day: .mon, startTime: .eight, finishTime: .nine), WorkDay(day: .wed, startTime: .ten, finishTime: .fourteen), WorkDay(day: .fri, startTime: .nine, finishTime: .thirteen)])

    let doctor2 = Doctor(firstName: "Adrian",
                         lastName: "Nowakowski",
                         specialty: "Endokrynolog",
                         image: UIImage(named: "l2")!,
                         workDays: [WorkDay(day: .tues, startTime: .eleven, finishTime: .fourteen)])

    let doctor3 = Doctor(firstName: "Hubert",
                         lastName: "Zieliński",
                         specialty: "Logopeda",
                         image: UIImage(named: "l3")!,
                         workDays: [WorkDay(day: .fri, startTime: .ten, finishTime: .sixteen),
                                    WorkDay(day: .tues, startTime: .twelve, finishTime: .seventeen)])

    var doctors = [Doctor]()

    @IBOutlet weak var doctorTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        doctorTableView.delegate = self
        doctorTableView.dataSource = self
        doctors = [doctor1, doctor2, doctor3]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctors.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = doctorTableView.dequeueReusableCell(withIdentifier: Constants.doctorCellIdentifier, for: indexPath) as! DoctorTableViewCell
        cell.configure(with: doctors[indexPath.row])
        return cell

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is VisitViewController {
            let cell = sender as! DoctorTableViewCell
            let destinationController = segue.destination as! VisitViewController
            destinationController.navigationItem.title = "\(cell.firstNameLabel.text!) \(cell.lastNameLabel.text!)"
            if let indexOfRow = self.doctorTableView.indexPathForSelectedRow?.row {
                destinationController.doctorIndex = indexOfRow
            }

        }
        
    }



}
