//
//  ProgramInterfaceController.swift
//  W8WatchAppc
//
//  Created by Jawaad Sheikh on 2016-10-13.
//  Copyright © 2016 Neurotelli Technologies Inc. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

// step 5 - implement storyboard on the watch side
// step 5b - create the object (ProgRowController.swift) to configure the watch table cell
// cast the table row object to the ProgRowController object
// once the table is created then we can now focus on watch connectivity
class InterfaceController : WKInterfaceController, WCSessionDelegate {
    @IBOutlet var progTable : WKInterfaceTable!
    var programs : [ProgramObject] = []
    
    // step 6 implement the watch connectivity delegate interface and methods
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        
        var replyValues = Dictionary<String, AnyObject>()
        
        let loadedData = message["progData"]
        
        let loadedPerson = NSKeyedUnarchiver.unarchiveObject(with: loadedData as! Data) as? [ProgramObject]
        
        programs = loadedPerson!
        
             replyValues["status"] = "Program Received" as AnyObject?
        replyHandler(replyValues)
    }
    
    // step 6b - check to see if watch can connect with iPhone
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
            let session = WCSession.default
            session.delegate = self
            session.activate()
            

    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        if (WCSession.default.isReachable) {
            
            // step 6c - send a message to the phone requesting data
            let message = ["getProgData": [:]]
            WCSession.default.sendMessage(message, replyHandler: { (result) -> Void in
                // TODO: Handle your data from the iPhone
               
                if result["progData"] != nil
                {
                    let loadedData = result["progData"]
                
                
                  // step 6d - deserialize the data from the watch
                    NSKeyedUnarchiver.setClass(ProgramObject.self, forClassName: "ProgramObject")
                    // causes app crash because decode not linked properly error
                    // above line of code needed to prevent this crash
                    let loadedPerson = NSKeyedUnarchiver.unarchiveObject(with: loadedData as! Data) as? [ProgramObject]
                
                    self.programs = loadedPerson!
                
                    self.progTable.setNumberOfRows(self.programs.count,
                                  withRowType: "PartyViewController")
        
    
   
                    // step 6e - format and add data to table cells
                    // now move back to iPhone to finish connectivity side there
                for (index,prog) in self.programs.enumerated() {
                    let row = self.progTable.rowController(at: index) as! PartyViewController
            
                    row.label.setText(prog.title)
                    
                    
          
                    }
                }
      
                }, errorHandler: { (error) -> Void in
                    // TODO: Handle error - iPhone many not be reachable
                    print(error)
            })
            
        }

    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
