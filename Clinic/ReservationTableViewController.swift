//
//  ReservationTableViewController.swift
//  Clinic
//
//  Created by Levchuk Misha on 13.09.17.
//  Copyright © 2017 Levchuk Misha. All rights reserved.
//

import UIKit

class ReservationTableViewController: UITableViewController {

    private struct Constants {
        static let numberOfRowsInSection = [4, 1]
    }
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var peselLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!

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
    @IBAction func reserveTimeAction(_ sender: Any) {
        
    }



}
