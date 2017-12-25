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


    /**
     The structure contains data, which won't be modified.
     */
    private struct Constants {
        static let numberOfRowsInSection = [4, 1]
    }

    /**
     The structure contains names of doctors instances for using it in code instead of writing it every time if it needs.
     */

    private struct Doctors {
        static let doc1 = "doc1"
        static let doc2 = "doc2"
        static let doc3 = "doc3"
    }

    /**
     The structure contains names of fields in reservation form for using it in code instead of writing it every time if it needs.
     */

    private struct ReservationFields {
        static let firstname = "firstname"
        static let lastname = "lastname"
        static let pesel = "pesel"
        static let telephone = "telephone"
        static let isBusy = "isBusy"
    }

    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var peselLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    @IBOutlet var reservationTableView: UITableView!

    // MARK: -  Stored properties
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

    /**
     Function for reservation of selected date and time.
    */

    @IBAction func reserveTimeAction(_ sender: Any) {
        if firstNameLabel.text != "" &&
        lastNameLabel.text != "" &&
        peselLabel.text != "" &&
            phoneLabel.text != "" {
            if peselLabel.text?.characters.count == 11 && phoneLabel.text?.characters.count == 9 {
                writeRecord(docChild: doctorIndex, timeChild: selectedTime, dateChild: selectedDay)
            } else {
                if peselLabel.text?.characters.count != 11 {
                    createAlert(title: "PESEL nie jest zgodny ze wzorcem", message: "Wpisz PESEL zgodnie ze wzorcem: 00000000000")
                } else if phoneLabel.text?.characters.count != 9 {
                    createAlert(title: "Numer nie jest zgodny ze wzorcem", message: "Wpisz numer zgodnie ze wzorcem: 000000000")
                }
            }

            

        } else {
            createAlert(title: "Nie wszystkie pola zostały wypełnione", message: "Preszę wypełnić wszystkie pola formularza")
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

    /// Function writes patients data to database.
    ///
    /// - parameter docChild: Selected doctor.
    /// - parameter timeChild: Selected time.
    /// - parameter dateChild: Selected date.
    ///
    func writeRecord(docChild: Int, timeChild: String, dateChild: String) {
        if docChild == 0 {
            let selectedDoctor = Doctors.doc1
            var isBusy = Bool()

            databaseHandle = reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.isBusy).observe(.value, with: { (snapshot) in
                isBusy = snapshot.value as! Bool
                if isBusy == false {
                    self.reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.isBusy).setValue(true)
                    self.reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.firstname).setValue(self.firstNameLabel.text)
                    self.reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.lastname).setValue(self.lastNameLabel.text)
                    self.reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.pesel).setValue(self.self.peselLabel.text)
                    self.reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.telephone).setValue(self.phoneLabel.text)
                    self.clearAllInputs()
                    self.createAlert(title: "Dokonano zapisu", message: "Dzień: \(self.convertDate(date: self.selectedDay))\nGodzina:  \(self.selectedTime)")


                } else {
                    self.createAlert(title: "Przepraszamy - termin jest zajęty", message: "Proszę wybrać inny termin")

                }

            })

        } else if docChild == 1 {
            let selectedDoctor = Doctors.doc2
            var isBusy = Bool()
            databaseHandle = reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.isBusy).observe(.value, with: { (snapshot) in
                isBusy = snapshot.value as! Bool
                if isBusy == false {
                    self.reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.isBusy).setValue(true)
                    self.reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.firstname).setValue(self.firstNameLabel.text)
                    self.reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.lastname).setValue(self.lastNameLabel.text)
                    self.reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.pesel).setValue(self.self.peselLabel.text)
                    self.reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.telephone).setValue(self.phoneLabel.text)
                    self.clearAllInputs()
                    self.createAlert(title: "Dokonano zapisu", message: "Dzień: \(self.convertDate(date: self.selectedDay))\nGodzina:  \(self.selectedTime)")


                } else {
                    self.createAlert(title: "Przepraszamy - termin jest zajęty", message: "Proszę wybrać inny termin")

                }

            })

        } else if docChild == 2 {
            let selectedDoctor = Doctors.doc3
            var isBusy = Bool()
            databaseHandle = reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.isBusy).observe(.value, with: { (snapshot) in
                isBusy = snapshot.value as! Bool
                if isBusy == false {
                    self.reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.isBusy).setValue(true)
                    self.reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.firstname).setValue(self.firstNameLabel.text)
                    self.reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.lastname).setValue(self.lastNameLabel.text)
                    self.reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.pesel).setValue(self.self.peselLabel.text)
                    self.reference.child(selectedDoctor).child(dateChild).child(timeChild).child(ReservationFields.telephone).setValue(self.phoneLabel.text)
                    self.clearAllInputs()
                    self.createAlert(title: "Dokonano zapisu", message: "Dzień: \(self.convertDate(date: self.selectedDay))\nGodzina:  \(self.selectedTime)")


                } else {
                    self.clearAllInputs()
                    self.createAlert(title: "Przepraszamy - termin jest zajęty", message: "Proszę wybrać inny termin")

                }

            })

        } else {
            createAlert(title: "Error", message: "Database is crashed")
        }
    }

    
    /**
     Function converts date from user format to database format.
     */

    func convertDate(date: String) -> String {
        return date.replacingOccurrences(of: "dot", with: ".")
    }

    /**
     Function clears form inputs if reservation action was succesfully completed.
     */

    func clearAllInputs() {
        self.firstNameLabel.text = ""
        self.lastNameLabel.text = ""
        self.peselLabel.text = ""
        self.phoneLabel.text = ""
    }

}
