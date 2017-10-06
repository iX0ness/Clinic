//
//  ClinicInformationViewController.swift
//  Clinic
//
//  Created by Levchuk Misha on 01.10.17.
//  Copyright © 2017 Levchuk Misha. All rights reserved.
//

import UIKit
import MapKit

class ClinicInformationViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private struct Constants {
        static let clinicPhotoCellIdentifier = "ClinicPhotoCell"
        
    }
    @IBOutlet weak var clinicView: UIView!
    
    @IBOutlet weak var clinicLocation: MKMapView!

    
    @IBOutlet weak var clinicCollectionView: UICollectionView!

    var photoArray = ["cl1.jpg", "cl2.jpg", "cl3.jpg", "cl4.jpg"]
    var scrollTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clinicCollectionView.delegate = self
        clinicCollectionView.dataSource = self
        showClinicLocation()
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clinicCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.clinicPhotoCellIdentifier, for: indexPath) as! ClinicPhotoCollectionViewCell
        cell.clinicImageView.image = UIImage(named: photoArray[indexPath.row])

        var rowIndex = indexPath.row
        let numberOfRecords = photoArray.count - 1

        if rowIndex < numberOfRecords {
            rowIndex += 1
        } else {
            rowIndex = 0
        }

        scrollTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(ClinicInformationViewController.startTimer(theTimer:)), userInfo: rowIndex, repeats: true)

        return cell

    }

    @objc func startTimer(theTimer: Timer) {
        UIView.animate(withDuration: 3.0, delay: 0, options: .curveEaseOut, animations: {
            self.clinicCollectionView.scrollToItem(at: IndexPath(row: theTimer.userInfo! as! Int, section: 0), at: .centeredVertically, animated: false)
            }, completion: nil)
    }

    func showClinicLocation() {
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 52.280545, longitude: 20.950400)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        clinicLocation.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Centrum medyczne Damiana"
        annotation.subtitle = "ul. Zjednoczenia 36"
        

        clinicLocation.addAnnotation(annotation)
    }


    


}
