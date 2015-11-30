//
//  MovieData.swift
//  movie database
//
//  Created by Lamar Greene on 10/6/15.
//  Copyright © 2015 Lamar Greene. All rights reserved.
//

import Foundation
import UIKit

var array1 = [AnyObject]()
var array2 = [AnyObject]()
var array3 = [AnyObject]()
var moreThanOne = [AnyObject]()
var actor1Id: Int = 0
var actor2Id: Int = 0

var actor = (actorIdFromDB: 0, actorImagePath: "")

var actorImagePath = ""
var actorImageView: UIImageView?


func mergeArrayMatches(completion: (success: Bool) -> Void) {
    
    if actor1Id != actor2Id {
        
        if !array3.isEmpty {
            array3.removeAll()
        }
        
        for thisThing in array1 {
            
            for anotherThing in array2 {
                
                if thisThing.objectForKey("id")! === anotherThing.objectForKey("id")! {
                    
                    print(anotherThing.objectForKey("title")!)
                    
                    array3.append(anotherThing)
                    
                }
                
            }
            
        }
        
        if !array3.isEmpty {
            completion(success: true)
        } else {
            completion(success: false)
            
        }

    } else if actor1Id == actor2Id{
        completion(success: false)
        
    }

}
    
    
func searchActorName(actorSearchName: String, actorColumn: Int, completion: (alertString: String, triggerMoreThanOne: Bool ,success: Bool) -> Void){

    let urlString: String? = "http://api.themoviedb.org/3/search/person?query=\"\(actorSearchName)\"&search_type=ngram&api_key=9ea2647127881d1c8d28df568f8d6b14"
    
    let url = NSURL(string: (urlString?.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding))!)
    
    let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error ) -> Void in
        if let urlContent = data {
            
            do {
                
                let jsonResult: AnyObject! = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                print(jsonResult)
                if jsonResult.objectForKey("results")!.count > 1 {
                    
                    moreThanOne.removeAll()
                    
                    for var i = 0; i < jsonResult.objectForKey("results")!.count; i++ {
                        
                        if let moreThan = jsonResult.objectForKey("results")![i]{
                        
                            moreThanOne.append(moreThan)
                            print("this is the extra object...... \(moreThan) ")
                        }
                    }
                    print(moreThanOne)
                    completion(alertString: "", triggerMoreThanOne: true, success: false)
                    
                    
                    //completion(alertString: "We found more than 1 result with your search parameters. Please try a more specific search.", success: false)

                } else if jsonResult.objectForKey("results")!.count == 0 {
                    completion(alertString: "We found no matches. Please check that you spelled the name right.", triggerMoreThanOne: false, success: false)
                    print("There are no matches")
                
                } else {
                    
                    if let returnedActorId = jsonResult.objectForKey("results")![0]["id"]{
                        
                        let actorUniqueId = returnedActorId as! Int
                        
                        actorImagePath = jsonResult.objectForKey("results")![0]["profile_path"] as! String
                        print("actor image path is \(actorImagePath)")
                        
                        loadImage(actorImagePath, imageStuff: actorImageView!)
                        
                        
                        findActorCredentials(actorUniqueId, actorColumn: actorColumn, completion: { (success) -> String in
                            print("findActorCredentials has fired")
                            
                            return jsonResult.objectForKey("profile_path") as! String
                        })
                        
                    }
                
                }
            
            }
                
            catch {
                
                print("JSON serialization failed")
            }
            
        }
        
    }
    
    task.resume()
    
}

    
func findActorCredentials(actorId: Int, actorColumn: Int, completion: (success: Bool) -> String){
    print("findActorCredentials has fired!!!!")
    
    if actorColumn == 1 {
        actor1Id = actorId
    }
    
    if actorColumn == 2 {
        actor2Id = actorId
    }

    let url = NSURL(string: "http://api.themoviedb.org/3/person/\(actorId)/movie_credits?api_key=9ea2647127881d1c8d28df568f8d6b14")!
    
    let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error ) -> Void in
        if let urlContent = data {
            
            do {
                
                let jsonResult: AnyObject! = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                
                print("actor data has been retrieved")
                
                if let _ = jsonResult.objectForKey("cast"){
                    
                    
                    for var i = 0; i < jsonResult.objectForKey("cast")!.count; i++ {
                        
                        if let movieId = jsonResult.objectForKey("cast")![i] {
                            
                            if actorColumn == 1 {
                                
                                array1.append(movieId)
                                
                            } else {
                                
                                array2.append(movieId)
                                
                            }
                            
                        }
                        
                    }
                    
                }

            }
                
            catch {
                print("JSON serialization failed")
            }
            
        }
        
    }
    
    task.resume()

}


func findActorCredentials(actorId: Int, actorColumn: Int, completion: (success: Bool) -> Void){
    print("findActorCredentials has fired!!!!")
    
    let url = NSURL(string: "http://api.themoviedb.org/3/person/\(actorId)/movie_credits?api_key=9ea2647127881d1c8d28df568f8d6b14")!
    
    let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error ) -> Void in
        if let urlContent = data {
            
            do {
                
                let jsonResult: AnyObject! = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                
                print("actor data has been retrieved")
                
                if let _ = jsonResult.objectForKey("cast"){
                    
                    
                    for var i = 0; i < jsonResult.objectForKey("cast")!.count; i++ {
                        
                        if let movieId = jsonResult.objectForKey("cast")![i] {
                            
                            if actorColumn == 1 {
                                
                                array1.append(movieId)
                                
                            } else {
                                
                                array2.append(movieId)
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
                
            catch {
                print("JSON serialization failed")
            }
            
        }
        
    }
    
    task.resume()
    
}



func loadImage(urlString: String, imageStuff: UIImageView) {
    
    if let imgURL: NSURL = NSURL(string: "http://image.tmdb.org/t/p/w300\(urlString)")! {
    let request: NSURLRequest = NSURLRequest(URL: imgURL)
    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            imageStuff.image = UIImage(data: data!)
        }
    } else {
        imageStuff.image = UIImage(named: "placeholder.png")
    }
}

func loadImage(urlString: String, imageStuff: UIImageView, actorColumn: Int) {
    
    if let imgURL: NSURL = NSURL(string: "http://image.tmdb.org/t/p/w300\(urlString)")! {
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            imageStuff.image = UIImage(data: data!)
        }
    } else {
        imageStuff.image = UIImage(named: "placeholder.png")
    }
}






