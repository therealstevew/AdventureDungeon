//
//  ProgramObject.swift
//  FinalProd
//
//  Created by Steven Winstanley on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

class ProgramObject: NSObject, NSCoding {
    var title : String?
    
    
    func initWithData(title : String)
    {
        self.title = title
    }
    func encode(with coder: NSCoder) {
        coder.encode(self.title, forKey: "title")

    }
    
    required convenience init?(coder: NSCoder) {
        let title = (coder.decodeObject(forKey: "title") as? String)!
     self.init()
     self.initWithData(title: title)
    }
    

}
