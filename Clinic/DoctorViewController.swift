//
//  DoctorViewController.swift
//  Clinic
//
//  Created by Levchuk Misha on 11.09.17.
//  Copyright © 2017 Levchuk Misha. All rights reserved.
//

import UIKit

class DoctorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    /**
     The structure contains data, which won't be modified.
    */

    private struct Constants {
        static let doctorCellIdentifier = "doctorCell"
        static let visitDoctorIdentifier = "visitDoctorSegue"
    }


    /// Docotr.swift instance.
    let doctor1 = Doctor(firstName: "Jan",
                         lastName: "Kowalski",
                         specialty: "Dermatolog",
                         image: UIImage(named: "l1")!,
                         workDays: [WorkDay(day: .mon, startTime: .eight, finishTime: .nine), WorkDay(day: .wed, startTime: .ten, finishTime: .fourteen), WorkDay(day: .fri, startTime: .nine, finishTime: .thirteen)])

    /// Docotr.swift instance.
    let doctor2 = Doctor(firstName: "Adrian",
                         lastName: "Nowakowski",
                         specialty: "Endokrynolog",
                         image: UIImage(named: "l2")!,
                         workDays: [WorkDay(day: .tues, startTime: .eleven, finishTime: .fourteen)])

    /// Docotr.swift instance.
    let doctor3 = Doctor(firstName: "Hubert",
                         lastName: "Zieliński",
                         specialty: "Logopeda",
                         image: UIImage(named: "l3")!,
                         workDays: [WorkDay(day: .tues, startTime: .twelve, finishTime: .seventeen),
                                    WorkDay(day: .fri, startTime: .ten, finishTime: .sixteen)])

    /// An array where will be stored Doctor.swift instances.
    var doctors = [Doctor]()

    @IBOutlet weak var doctorTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        doctorTableView.delegate = self
        doctorTableView.dataSource = self
        doctors = [doctor1, doctor2, doctor3]
        let image = UIImage(named: "Background")
        let imageView = UIImageView(image: image)
        doctorTableView.backgroundView = imageView
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
