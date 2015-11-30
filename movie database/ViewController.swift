//
//  ViewController.swift
//  movie database
//
//  Created by Lamar Greene on 10/4/15.
//  Copyright © 2015 Lamar Greene. All rights reserved.
//

import UIKit

    var actorColumn = 1

    var tempImageView: UIImageView?

class ViewController: UIViewController {
    

    
    @IBOutlet weak var actor1TextField: UITextField!
    
    @IBOutlet weak var actor2TextField: UITextField!
    
    @IBAction func getActor1Data(sender: UIButton) {
        
        if actor1TextField.text != "" {
    
        actorColumn = 1
        actorImageView = self.actor1Image
        tempImageView = actorImageView
        
        if !array1.isEmpty {
            array1.removeAll()
        }
        
        searchActorName(actor1TextField.text!, actorColumn: actorColumn) {
            (alertString, morethanone, success) -> Void in
            if success == false {
                
                if morethanone == true {
                    dispatch_sync(dispatch_get_main_queue()) {
                        self.performSegueWithIdentifier("toMoreThanOne", sender: self)
                    }
                } else {
                    dispatch_sync(dispatch_get_main_queue()) {
                        self.actor1Image.image = UIImage(named: "placeholder.png")
                        self.alertNoSingleActorFound(alertString)
                    }
                
                }
            }
        }
            
        } else {
        
            alertNoSingleActorFound("You submitted a request with no name, please hit 'OK' and submit a name.")
        }
    }
    
    @IBAction func getActor2Data(sender: UIButton) {
        
        if actor2TextField.text != "" {
        
        actorColumn = 2 
        actorImageView = self.actor2Image
        tempImageView = actorImageView
        
        if !array2.isEmpty {
            array2.removeAll()
        }
        
        
        searchActorName(actor2TextField.text!, actorColumn: actorColumn) { (alertString, morethanone, success) -> Void in
            if success == false {
                
                if morethanone == true {
                    dispatch_sync(dispatch_get_main_queue()){
                        self.performSegueWithIdentifier("toMoreThanOne", sender: self)
                    }
                
                }else {
                
                    dispatch_sync(dispatch_get_main_queue()) {
                        self.actor2Image.image = UIImage(named: "placeholder.png")
                        self.alertNoSingleActorFound(alertString)
                        
                    }
                
                }
            }
        }
        } else {
            
            alertNoSingleActorFound("You submitted a request with no name, please hit 'OK' and submit a name.")
        }
    }
    
    
    @IBOutlet weak var actor1Image: UIImageView!
    
    
    @IBOutlet weak var actor2Image: UIImageView!
    
    
    @IBAction func compareActorArrays(sender: UIButton) {
        
        mergeArrayMatches { (success) -> Void in
            
            if success == true {
                self.performSegueWithIdentifier("viewResults", sender: self)
                    
                }
            
            if success == false {
                
                if actor1Id == actor2Id {
                    self.alertNoSingleActorFound("looks like you are trying to compare the same actors. please make one of them different")
                
                } else {
                    
                    let alert = UIAlertController(title: "Oooops" , message: "Looks like there are no common movies/films!", preferredStyle: .Alert)
                    
                    let alertConfirm = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    
                    alert.addAction(alertConfirm)
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            }
            
        }

    }

    
    func showMoreThanOneResult(){
        self.performSegueWithIdentifier("toMoreThanOne", sender: self)
    
    }
    
    
    
    func alertNoSingleActorFound(alertString: String){
    
        let alert = UIAlertController(title: "Sorry" , message: alertString, preferredStyle: .Alert)
        
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

