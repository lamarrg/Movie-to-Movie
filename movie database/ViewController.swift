//
//  ViewController.swift
//  movie database
//
//  Created by Lamar Greene on 10/4/15.
//  Copyright © 2015 Lamar Greene. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var actor1TextField: UITextField!
    
    
    @IBOutlet weak var actor2TextField: UITextField!
    
    
    @IBAction func getActor1Data(sender: UIButton) {
        
        if !array1.isEmpty {
            array1.removeAll()
        }
        
        searchActorName(actor1TextField.text!, actorColumn: 1)
        actorImageView = actor1Image
        
    }
    
    @IBAction func getActor2Data(sender: UIButton) {
        
        if !array2.isEmpty {
            array2.removeAll()
        }
        
        searchActorName(actor2TextField.text!, actorColumn: 2)
        actorImageView = actor2Image
        
    }
    
    
    @IBAction func showResults(sender: UIButton) {
        
        if array3.count == 0 {
                
                let alert = UIAlertController(title: "Oooops" , message: "Looks like there are no common movies/films!", preferredStyle: .Alert)
                
                let alertConfirm = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                let alertAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
                    
                }

                alert.addAction(alertConfirm)
                alert.addAction(alertAction)
                
                self.presentViewController(alert, animated: true, completion: nil)
        
        } else {
            self.performSegueWithIdentifier("viewResults", sender: self)
        }
        
    }
    
    @IBOutlet weak var actor1Image: UIImageView!
    
    
    @IBOutlet weak var actor2Image: UIImageView!
    
    
    @IBAction func compareActorArrays(sender: UIButton) {
        
        mergeArrayMatches()
        alertNoSingleActorFound()
    }
    
    
    func alertNoSingleActorFound(){
    
        let alert = UIAlertController(title: "Sorry" , message: "We are unalge to return a single result. Please check the name spelling and try again.", preferredStyle: .Alert)
        
        let alertAcknowledge = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
            
        }
        
        alert.addAction(alertAcknowledge)
        
        self.presentViewController(alert, animated: true, completion: nil)

    
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

