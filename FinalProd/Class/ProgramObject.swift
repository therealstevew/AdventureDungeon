//
//  ProgramObject.swift
//  FinalProd
//
//  Created by Steven Winstanley on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit
//for watch, no work :(
class ProgramObject: NSObject, NSCoding {
    var title : String?
    
    
    func initWithData(title : String)
    {
        self.title = title
    }
    func encode(with coder: NSCoder) {
        coder.encode(self.title, forKey: "title")

    }
    
    required convenience init?(coder decoder: NSCoder) {
      guard let title = (decoder.decodeObject(forKey: "title") as? String)
        else{
            return nil
        }
        self.init()
        self.initWithData(title: title)
    }
    

}
