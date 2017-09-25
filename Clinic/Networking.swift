//
//  Networking.swift
//  Clinic
//
//  Created by Levchuk Misha on 22.09.17.
//  Copyright © 2017 Levchuk Misha. All rights reserved.
//

import Foundation
import FirebaseDatabase
import UIKit

class Networking {

    private struct Doctors {
        static let doctor1 = "doc1"
        static let doctor2 = "doc2"
        static let doctor3 = "doc3"
    }

    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle?
    var workDays = [String]() {
        didSet {
            
        }
    }

    init() {
        self.ref = Database.database().reference()
    }

    func getDates(doctorIndex: Int) -> [String] {

        if doctorIndex == 0 {
            databaseHandle = ref.child(Doctors.doctor1).observe(.childAdded, with: { (snapshot) in
                self.workDays.append(snapshot.key)

            })
            return self.workDays

        } else if doctorIndex == 1 {
            databaseHandle = ref.child(Doctors.doctor2).observe(.childAdded, with: { (snapshot) in
                self.workDays.append(snapshot.key)


            })
            return workDays

        } else if doctorIndex == 2 {
            databaseHandle = ref.child(Doctors.doctor3).observe(.childAdded, with: { (snapshot) in
                self.workDays.append(snapshot.key)


            })
            return workDays

        } else {
            //createAlert(title: "Error", message: "Connection lost")
        }
        return workDays

    }




//    func createAlert(title: String, message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
//            alert.dismiss(animated: true, completion: nil)
//        }))
//
//    }
}
