//
//  Person.swift
//  RosterApp
//
//  Created by Francisco Ragland Jr on 10/12/15.
//  Copyright © 2015 Francisco Ragland. All rights reserved.
//

import UIKit

class Person : NSObject, NSCoding {
    var firstName: String
    var lastName: String
    var image: UIImage?
    
    init (firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let firstName = aDecoder.decodeObjectForKey("firstName") as? String {
            self.firstName = firstName
        } else {
            self.firstName = "NA"
        }
        if let lastName = aDecoder.decodeObjectForKey("firstName") as? String {
            self.lastName = lastName
        } else {
            self.lastName = "NA"
        }
        if let image = aDecoder.decodeObjectForKey("image") as? UIImage {
            self.image = image
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(firstName, forKey: "firstName")
        aCoder.encodeObject(lastName, forKey: "lastName")
        aCoder.encodeObject(image, forKey: "image")
    }
    
}