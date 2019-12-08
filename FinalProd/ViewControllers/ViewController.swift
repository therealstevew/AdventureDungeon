//
//  ViewController.swift
//  FinalProd
//
//  Created by Steven Winstanley on 2019-11-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
///

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    @IBOutlet var mapView:MKMapView!
    var mapIcons = [MapIcon]();


    override func viewDidLoad() {
        super.viewDidLoad()
         let locationManager = CLLocationManager()
           locationManager.delegate = self
           locationManager.desiredAccuracy = kCLLocationAccuracyBest

           // Check for Location Services
           if (CLLocationManager.locationServicesEnabled()) {
               locationManager.requestAlwaysAuthorization()
               locationManager.requestWhenInUseAuthorization()
           }

           //Zoom to user location
           if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 200, longitudinalMeters: 200)
               mapView.setRegion(viewRegion, animated: false)
           }

           self.locationManager = locationManager

           DispatchQueue.main.async {
               self.locationManager.startUpdatingLocation()
           }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    func generateIcon(){
        for n in 0...19 {
            
        }
    }
}

