//
//  MoreThanOneTableViewController.swift
//  movie database
//
//  Created by Lamar Greene on 11/24/15.
//  Copyright © 2015 Lamar Greene. All rights reserved.
//

import UIKit


class MoreThanOneTableViewController: UITableViewController {

    
    @IBAction func backToSearch(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return moreThanOne.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("the selection is \(indexPath.row)")


            findActorCredentials(moreThanOne[indexPath.row]["id"] as! Int, actorColumn: actorColumn) { (success) -> Void in
            
//                loadImage(moreThanOne[indexPath.row]["profile_path"] as! String
//                    , imageStuff: tempImageView!, actorColumn: actorColumn)
                
        }
        loadImage((moreThanOne[indexPath.row]["profile_path"] as? String)!, imageStuff: tempImageView!, actorColumn: actorColumn)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("moreThanOneCell", forIndexPath: indexPath)

        let cellTitle: UILabel? = cell.contentView.viewWithTag(101) as? UILabel
        cellTitle?.text = moreThanOne[indexPath.row]["name"] as? String
        
        var grrr: String = ""
        
        let cellImage: UIImageView? = cell.contentView.viewWithTag(100) as? UIImageView
        
        if moreThanOne[indexPath.row]["profile_path"] !== NSNull() {
        
            grrr = (moreThanOne[indexPath.row]["profile_path"] as? String)!
            loadImage(grrr, imageStuff: cellImage!)
        } else {
        
            cellImage?.image = UIImage(named: "placeholder.png")
        }
        
        
        
        
        
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
