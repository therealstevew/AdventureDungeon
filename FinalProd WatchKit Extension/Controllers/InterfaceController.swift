//
//  InterfaceController.swift
//  FinalProd WatchKit Extension
//
//  Created by Steven Winstanley on 2019-11-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate{

    @IBOutlet weak var table: WKInterfaceTable!
    var programs : [ProgramObject] = []
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
         
     }

    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if(WCSession.isSupported()){
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
           
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        if(WCSession.default.isReachable){
                  let message = ["getProgData" : [:]]
                  
                  WCSession.default.sendMessage(message, replyHandler: { (result) in
                      
                      if result["progData"] != nil{
                          
                          let loadedData = result["progData"]
                          NSKeyedUnarchiver.setClass(ProgramObject.self, forClassName: "ProgramObject")
                          
                          let loadedPerson = NSKeyedUnarchiver.unarchiveObject(with: loadedData as! Data) as? [ProgramObject]
                          self.programs = loadedPerson!
                          
                          self.table.setNumberOfRows(self.programs.count, withRowType: "ProgRowController")
                          
                          for(index, prog) in self.programs.enumerated(){
                              let row = self.table.rowController(at: index) as! PartyViewController
                              
                              row.label.setText(prog.title)
                              
                                                }
                      }
                      
                  }) { (error) in
                      print(error)
                  }
              }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
