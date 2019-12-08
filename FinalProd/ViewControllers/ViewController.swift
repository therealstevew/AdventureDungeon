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

class ViewController: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate {
    var locationManager = CLLocationManager()
    @IBOutlet var mapView:MKMapView!
    var mapIcons : Array<MapIcon> = [];


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
        for n in 0...7 {
            if(mapIcons.count <= 7){
                mapIcons.append(MapIcon.init(coordLat: Float(locValue.latitude), coordLong: Float(locValue.longitude)))
            }
        }
        generateAnnotation()
        
        
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {

        if control == view.rightCalloutAccessoryView {
            print(view.annotation?.subtitle!!)
        }

    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        
        if !(annotation is MKPointAnnotation) {
            return nil
        }
        var type = annotation.subtitle
        let annotationIdentifier = "AnnotationIdentifier"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView!.canShowCallout = true
            annotationView!.rightCalloutAccessoryView = UIButton(type: .infoDark) as UIButton
            
        }
        else {
            annotationView!.annotation = annotation
        }
        var pinImage = UIImage()
        if (type == "0"){
            pinImage = UIImage(named: "battle.png")!
        }else if (type == "1"){
            pinImage = UIImage(named: "tavern.png")!
        }else if (type == "2"){
            pinImage = UIImage(named: "vendor.png")!
        }else {
            pinImage = UIImage(named: "redcross.png")!
        }
        annotationView!.image = pinImage
        return annotationView
    }
   
    func generateAnnotation(){
        for mapicons in mapIcons{
            print (mapicons.long)
            let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(mapicons.lat), longitude: CLLocationDegrees(mapicons.long))
                annotation.title = "buttplay"
                annotation.subtitle = String(mapicons.type)
            
                mapView.addAnnotation(annotation)
        }
    
    }
    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue)
    {
        
    }
}

