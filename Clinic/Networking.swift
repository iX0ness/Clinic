//
//  Networking.swift
//  Clinic
//
//  Created by Levchuk Misha on 22.09.17.
//  Copyright © 2017 Levchuk Misha. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Networking {
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle?
    var workDays = [String]()

    init() {
        self.ref = Database.database().reference()
    }

    func getDates(doctorIndex: Int) {
        if doctorIndex == 0 {
            databaseHandle = ref.child("doc1").observe(.childAdded, with: { (snapshot) in
                self.workDays.append(snapshot.key)
            })

        } else if doctorIndex == 1 {

        } else if doctorIndex == 2 {

        } else {

        }

    }
}
