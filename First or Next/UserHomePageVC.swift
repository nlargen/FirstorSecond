//
//  UserHomePageVC.swift
//  First or Next
//
//  Created by Nicholas Largen on 12/15/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import UIKit
import Parse
import WatchConnectivity
class UserHomePageVC: UIViewController, UITableViewDelegate, UITableViewDataSource, WCSessionDelegate {

    
    @IBOutlet weak var AttemptsTable: UITableView!
    var session : WCSession!
    override func viewDidLoad()
    {
        if WCSession.isSupported()
        {
            self.session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }

       AttemptsTable.reloadData()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return UserDataSingleton.currNumAttempts.count
        
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject])
    {
        
        print(message)
        let attemptsMessage = message["NumAttempts"]!
        let parts = attemptsMessage.componentsSeparatedByString(" -> ")
        print(attemptsMessage)
        UserDataSingleton.currNumAttempts.append(parts[0])
        AttemptsTable.reloadData()
        
        let userdata = PFObject(className:"UserAttempts")
        userdata["AttemptsMade"] = UserDataSingleton.currNumAttempts
        userdata["owner_id"] = UserDataSingleton.currentuser
        userdata.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                print("saved")
                
            }
            else
            {
                print("save error")
                // There was a problem, check error.description
            }
        }

    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! AttemptsCell
        //update this code to fill the labels with the proper values
        
        cell.SecondBookLabel.text = UserDataSingleton.currNumAttempts[0]
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
