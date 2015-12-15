//
//  UserDataSingleton.swift
//  First or Next
//
//  Created by Nicholas Largen on 12/15/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import UIKit
import Parse
class UserDataSingleton: NSObject
{
   static var currentuser : PFUser?
   static var currAttempts = [PFObject]()
    static var currNumAttempts = [String]()
    

}
