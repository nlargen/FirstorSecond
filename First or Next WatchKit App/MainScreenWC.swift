//
//  MainScreenWC.swift
//  First or Next
//
//  Created by Nicholas Largen on 12/15/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import WatchKit
import Foundation
import Darwin
import WatchConnectivity

class MainScreenWC: WKInterfaceController,WCSessionDelegate {
    
    var session : WCSession!

    @IBOutlet var secondbookout: WKInterfaceButton!
    @IBOutlet var firstbookout: WKInterfaceButton!
    
    
    override func awakeWithContext(context: AnyObject?)
    {
        if WCSession.isSupported()
        {
            self.session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        
        bookGenerator()
        secondbookout.setTitle(WatchCore.secondbookString)
        firstbookout.setTitle(WatchCore.firstbookString)
        
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    
    func bookGenerator()
    {
        WatchCore.firstbookString = WatchCore.bibleBooksArray[Int(arc4random_uniform(66))]
        WatchCore.secondbookString = WatchCore.bibleBooksArray[Int(arc4random_uniform(66))]
    }
    //Control buttons for book selection
    @IBAction func FirstBookPressed()
    {
    
      
        let indexOfFirst = WatchCore.bibleBooksArray.indexOf(WatchCore.firstbookString)
        let indexOfSecond = WatchCore.bibleBooksArray.indexOf(WatchCore.secondbookString)
        if(indexOfFirst < indexOfSecond)
        {
            print("correct")
            WatchCore.correctAttempts++
            session.sendMessage(["NumAttempts": "\(WatchCore.correctAttempts) \(WatchCore.firstbookString) \(WatchCore.secondbookString)"], replyHandler: nil, errorHandler: nil)
           
        }
        else
        {
            print("wrong")
            WatchCore.wrongAttempts++
            session.sendMessage(["NumAttempts": "\(WatchCore.correctAttempts) \(WatchCore.firstbookString) \(WatchCore.secondbookString)"], replyHandler: nil, errorHandler: nil)
            
        }
        
    }
    
    @IBAction func SecondBookPressed()
    {
        let indexOfFirst = WatchCore.bibleBooksArray.indexOf(WatchCore.firstbookString)
        let indexOfSecond = WatchCore.bibleBooksArray.indexOf(WatchCore.secondbookString)
        if(indexOfFirst > indexOfSecond)
        {
            print("correct")
            WatchCore.correctAttempts++
           session.sendMessage(["NumAttempts": "\(WatchCore.correctAttempts) \(WatchCore.firstbookString) \(WatchCore.secondbookString)"], replyHandler: nil, errorHandler: nil)

            
        }
        else
        {
            print("wrong")
            WatchCore.wrongAttempts++
           session.sendMessage(["NumAttempts": "\(WatchCore.correctAttempts) \(WatchCore.firstbookString) \(WatchCore.secondbookString)"], replyHandler: nil, errorHandler: nil)
        }

        
    }
    //********
    @IBAction func StartButtonPressed()
    {
        bookGenerator()
        secondbookout.setTitle(WatchCore.secondbookString)
        firstbookout.setTitle(WatchCore.firstbookString)
        
    }
    
       

    //End Button Controllers
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
