//
//  ResultsArray.swift
//  movie database
//
//  Created by Lamar Greene on 10/10/15.
//  Copyright © 2015 Lamar Greene. All rights reserved.
//

import UIKit

class ResultsArray: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var table: UITableView!
    
    
    @IBAction func returnToCompareScreen(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true) { () -> Void in
            print("done")
        }
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return array3.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        let blah = array3[indexPath.row].objectForKey("title")! as! String
        cell.textLabel?.text = blah
        
        return cell
    
    
    }
    
    override func viewWillAppear(animated: Bool) {
        //table.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
