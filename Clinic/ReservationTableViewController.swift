//
//  ReservationTableViewController.swift
//  Clinic
//
//  Created by Levchuk Misha on 13.09.17.
//  Copyright © 2017 Levchuk Misha. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ReservationTableViewController: UITableViewController {

    private struct Constants {
        static let numberOfRowsInSection = [4, 1]
    }
    private struct Doctors {
        static let doc1 = "doc1"
        static let doc2 = "doc2"
        static let doc3 = "doc3"
    }

    private struct ReservationFields {
        static let firstname = "firstname"
        static let lastname = "lastname"
        static let pesel = "pesel"
        static let telephone = "telephone"
        static let isBusy = "isBusy"
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

    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var peselLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    @IBOutlet var reservationTableView: UITableView!

    var selectedDay = String()
    var doctorIndex: Int!
    var selectedTime = String()
    var reference = Database.database().reference()
    var databaseHandle: DatabaseHandle?



    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 0
        if section < Constants.numberOfRowsInSection.count {
            rows = Constants.numberOfRowsInSection[section]
        }
        return rows
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        reservationTableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func reserveTimeAction(_ sender: Any) {
        if firstNameLabel.text != "" &&
        lastNameLabel.text != "" &&
        peselLabel.text != "" &&
            phoneLabel.text != "" {
            writeRecord(docChild: doctorIndex, timeChild: selectedTime, dateChild: selectedDay)
            

        } else {
            createAlert(title: "Nie wszystkie pola zostały wypełnione", message: "Preszę wypełnić wszystkie pola formularza")
        }
    }

    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }

    func writeRecord(docChild: Int, timeChild: String, dateChild: String) {
        if docChild == 0 {
            let selectedDoctor = Doctors.doc1
            var isBusy = String()
            databaseHandle = reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.isBusy).observe(.childAdded, with: { (snapshot) in
                isBusy = (snapshot.value as! String)
            })

            if isBusy == "false" {
                reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.isBusy).setValue("true")
                reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.firstname).setValue(firstNameLabel.text)
                reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.lastname).setValue(lastNameLabel.text)
                reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.pesel).setValue(peselLabel.text)
                reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.telephone).setValue(phoneLabel.text)
                
            } else {
                createAlert(title: "Przepraszamy - termin jest zajęty", message: "Proszę wybrać inny termin")
            }

        } else if docChild == 1 {
            let selectedDoctor = Doctors.doc2
            var isBusy = String()
            databaseHandle = reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.isBusy).observe(.childAdded, with: { (snapshot) in
                isBusy = (snapshot.value as! String)
            })
            if isBusy == "false" {
                reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.isBusy).setValue("true")
                reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.firstname).setValue(firstNameLabel.text)
                reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.lastname).setValue(lastNameLabel.text)
                reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.pesel).setValue(peselLabel.text)
                reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.telephone).setValue(phoneLabel.text)
            } else {
                createAlert(title: "Przepraszamy - termin jest zajęty", message: "Proszę wybrać inny termin")
            }
        } else if docChild == 2 {
            let selectedDoctor = Doctors.doc3
            var isBusy = String()
            databaseHandle = reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.isBusy).observe(.childAdded, with: { (snapshot) in
                isBusy = (snapshot.value as! String)

            })
            if isBusy == "false" {
                reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.isBusy).setValue("true")
                reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.firstname).setValue(firstNameLabel.text)
                reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.lastname).setValue(lastNameLabel.text)
                reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.pesel).setValue(peselLabel.text)
                reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.telephone).setValue(phoneLabel.text)
            } else {
                createAlert(title: "Przepraszamy - termin jest zajęty", message: "Proszę wybrać inny termin")
            }
        } else {
            createAlert(title: "Error", message: "Database is crashed")
        }
    }

}
