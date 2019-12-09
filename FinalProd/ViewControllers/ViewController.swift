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
import WatchConnectivity

class ViewController: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate, WCSessionDelegate {
    
    //Define Basic WC functions
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    //Create locationManager for mapkit functions
    var locationManager = CLLocationManager()
    //mapView Outlet
    @IBOutlet var mapView:MKMapView!
    //Array of map icons
    var mapIcons : Array<MapIcon> = [];
   //Array to send data to Watch
    var programOb : [ProgramObject] = []

    //referencing Appdelegate
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    //on viewLoad
    override func viewDidLoad() {
        super.viewDidLoad()
       
            //define watch connectivity session
            let session = WCSession.default
            session.delegate = self
            // activate watch session
            session.activate()
        //load Programob with party data
         loadData()
        //assign locationManager
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
    func loadData(){
        //Pull userdata party
        for n in mainDelegate.UserData.Party!{
            var progObj3 = ProgramObject()
            //Assign value to a program object
            progObj3.initWithData(title: n.Name)
            programOb.append(progObj3)
        }
        let programData = NSKeyedArchiver.archivedData(withRootObject: programOb)
        //Send message
        sendWatchMessage(programData)
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        //Generate 8 MapIcon
        for n in 0...7 {
            //if there are less than 7 icons
            if(mapIcons.count <= 7){
                //create new map icons and pass into array
                mapIcons.append(MapIcon.init(coordLat: Float(locValue.latitude), coordLong: Float(locValue.longitude)))
            }
            //if the max amount of icons exsit set the reset timer
            if (mapIcons.count == 7){
                let timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true, block: { timer in
                    //call refreshMap Func
                    self.refreshMap()
                })
                //Generate MapView Annotations
                generateAnnotation()
            }
        }
    }
    //Refresh Map Function
    func refreshMap(){
        //get all current annotations
        let allAnnotations = self.mapView.annotations
        //remove all current annotations from map
        self.mapView.removeAnnotations(allAnnotations)
        //clear mapIcon list
        mapIcons.removeAll()
        //Stop location manager and restart
        self.locationManager.stopUpdatingLocation()
        self.locationManager.startUpdatingLocation()
    }
    //Annotation on clock
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                   calloutAccessoryControlTapped control: UIControl) {
          if control == view.rightCalloutAccessoryView {
              print(view.annotation?.subtitle!!)
            //get location distance
              let pointBLocation = CLLocation(latitude: (view.annotation?.coordinate.latitude)!, longitude: (view.annotation?.coordinate.longitude)!)
            //compare user location with the annotation
              let distance = Double((mapView.userLocation.location?.distance(from: pointBLocation))!)
            //if it within this range it can be clicked
              if (distance < 1000){
                  annotationShowView(type: (((view.annotation?.subtitle)!)!), anon: view.annotation!)
              
              }else{
                  print("To far")
              }
          }
      }
    //Annotation on click event
    func annotationShowView(type : String, anon : MKAnnotation){
        // removeAnnotaion that was clicked
        mapView.removeAnnotation(anon)
        switch type {
        case "0":
            print("Dungeon")
            //run battle screen
            runBattle()
        case "1":
            print("Tavern")
            //create new heros for rewards
            generateHeroRewards()
        case "2":
            print("Vendor")
            //create items for rewards
            generateItemRewards()
        case "3":
            print("Healer")
            //heal heros
            healHeros()
        default:
            print("Uh oh Stinky")
        }
    }
    //run battle function
    func runBattle(){
        //open battle view
        self.performSegue(withIdentifier: "battleScene", sender: nil)
    }
    //Generate Heros for user
    func generateHeroRewards(){
        var herosGot : Array<Hero> = [];
        var rand = Int.random(in: 1 ..< 3)
        for n in 0...rand{
            var heroSelect = Int.random(in: 0 ..< 8)
            herosGot.append(DataStore.getHero(Which: heroSelect))
            mainDelegate.UserData.Heroes!.append(DataStore.getHero(Which: heroSelect))
            let alert = UIAlertController(title: "New Heros!", message: "You Just got " + herosGot[0].Name + " And possibly some other friends", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Nice Dude", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        mainDelegate.UserData.LocalSave()
    }
    //heal heros
    func healHeros(){
        for hero in mainDelegate.UserData.Party!{
            hero.CurHealth = hero.MaxHealth
        }
    }
    //Generate Items for user
    func generateItemRewards(){
        var itemsGot : Array<Item> = []
        var rand = Int.random(in: 1 ..< 3)
        for n in 0...rand{
            var itemSelect = Int.random(in: 0 ..< 14)
            itemsGot.append(DataStore.getitem(Which: itemSelect))
            mainDelegate.UserData.Items!.append(DataStore.getitem(Which: itemSelect))
            let alert = UIAlertController(title: "New Items!", message: "You Just got " + itemsGot[0].Name + " And possibly some other items", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Nice Dude", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        mainDelegate.UserData.LocalSave()
    }
    //Sent annotation values, title, image, etc
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
   //create annotations 
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
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
           
           var replyValues = Dictionary<String, AnyObject>()
            
           
            if (message["getProgData"] != nil)
            {
                // step 8b - serialize and send the fake data to the watch for display
                // note line of code below needed to prevent app crash.
                NSKeyedArchiver.setClassName("ProgramObject", for: ProgramObject.self)
                let programData = NSKeyedArchiver.archivedData(withRootObject: programOb)
            
            
                replyValues["progData"] = programData as AnyObject?
                replyHandler(replyValues)
            }
           
       }
    func sendWatchMessage(_ msgData:Data) {
        
        // if less than half a second has passed, bail out
       
        // send a message to the watch if it's reachable
        if (WCSession.default.isReachable) {
            
            let message = ["progData": msgData]
            WCSession.default.sendMessage(message, replyHandler: nil)
        }
        
        // update our rate limiting property
      
    }

    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue)
    {
        
    }
}

