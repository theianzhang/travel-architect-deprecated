//  APIClient.swift
//  Travel Architect
//
//  Created by Ian Zhang on 2/25/18.
//  Copyright © 2018 Ian Zhang. All rights reserved.

import Foundation
import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

//array of wiki images
var imageArray: [UIImage] = []
var urlArray: [String] = []

func findStructures(latitude: Double, longitude: Double, completion: @escaping () -> Void)
{
    //print(latitude, longitude)

    let parameters: Parameters =
        [
            "action": "query",
            "prop": "pageimages",
            "piprop":"thumbnail",
            "generator":"geosearch",
            "ggsradius": "100",
            "ggscoord":  "\(latitude)" + "|" + "\(longitude)",
            "format": "json"
    ]

    Alamofire.request("https://en.wikipedia.org/w/api.php", parameters: parameters).responseJSON
        { response in
            print("Request: \(String(describing: response.request))")   // original url request
            //print("Response: \(String(describing: response.response))") // http url response
            //print("Result: \(String(describing: response.result))")     // response serialization result
            if response.error != nil
            { print("Error: \(String(describing: response.error))") }       // response errors if any

            if let result = response.data
            {
                let json = JSON(data: result)
                let pages = json["query"]["pages"]
                for (_, subJson) in pages
                {
                    if let source = subJson["thumbnail"]["source"].string
                    {
                        //print(source)
                        //print(self.imageArray.count)
                        //print(self.imageArray)
                        urlArray.append(source)
                    }
                }
                completion()
            }
    }
}

func getImage(latitude: Double, longitude: Double, completion: @escaping () -> Void)
{
    findStructures(latitude: latitude, longitude: longitude)
    {
        //print(urlArray)
        
        for url in urlArray
        {
            Alamofire.request(url, method: .get).responseImage
                { response in
                    //debugPrint(response)
                    //print(response.request!)
                    //print(response.response!)
                    //debugPrint(response.result)
                    
                    if let image = response.result.value
                    {
                        //print("image downloaded: \(image)")
                        imageArray.append(image)
                    }
            }
        }
        //print(imageArray.count)
        
        sleep(5)
        
        OperationQueue.main.addOperation
        { completion() }
    }
}
