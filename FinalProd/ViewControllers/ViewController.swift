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
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
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
            if (mapIcons.count == 7){
                generateAnnotation()
            }
        }
        
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            print(view.annotation?.subtitle!!)
            let pointBLocation = CLLocation(latitude: (view.annotation?.coordinate.latitude)!, longitude: (view.annotation?.coordinate.longitude)!)
            let distance = Double((mapView.userLocation.location?.distance(from: pointBLocation))!)
            if (distance < 1000){
                annotationShowView(type: (((view.annotation?.subtitle)!)!), anon: view.annotation!)
            
            }else{
                print("To far")
            }
        }
    }
    func annotationShowView(type : String, anon : MKAnnotation){
        mapView.removeAnnotation(anon)
        switch type {
        case "0":
            print("Dungeon")
        case "1":
            print("Tavern")
            generateHeroRewards()
        case "2":
            print("Vendor")
            generateItemRewards()
        case "3":
            print("Healer")
        default:
            print("Uh oh Stinky")
        }
    }
    func generateHeroRewards(){
        var herosGot : Array<Hero> = [];
        var rand = Int.random(in: 1 ..< 3)
        for n in 0...rand{
            var heroSelect = Int.random(in: 0 ..< 7)
            herosGot.append(DataStore.getHero(Which: heroSelect))
            mainDelegate.UserData.Heroes.append(DataStore.getHero(Which: heroSelect))
            let alert = UIAlertController(title: "New Heros!", message: "You Just got " + herosGot[0].Name + " And possibly some other friends", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Nice Dude", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    func generateItemRewards(){
        var itemsGot : Array<Item> = []
        var rand = Int.random(in: 1 ..< 3)
        for n in 0...rand{
            var itemSelect = Int.random(in: 0 ..< 13)
            itemsGot.append(DataStore.getitem(Which: itemSelect))
            mainDelegate.UserData.Items.append(DataStore.getitem(Which: itemSelect))
            let alert = UIAlertController(title: "New Items!", message: "You Just got " + itemsGot[0].Name + " And possibly some other items", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Nice Dude", style: .default, handler: nil))
            self.present(alert, animated: true)
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
            let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(mapicons.lat), longitude: CLLocationDegrees(mapicons.long))
            switch mapicons.type {
            case 0:
                annotation.title = "Dungeon"
            case 1:
                annotation.title = "Tavern"
            case 2:
                annotation.title = "Vendor"
            case 3:
                annotation.title = "Healer"
            default:
                print("Uh oh Stinky")
            }
                annotation.subtitle = String(mapicons.type)
            
                mapView.addAnnotation(annotation)
        }
    
    }
    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue)
    {
        
    }
}

