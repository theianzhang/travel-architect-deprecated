//
//  ViewController.swift
//  Travel Architect
//
//  Created by Ian Zhang on 10/10/17.
//  Copyright © 2017 Ian Zhang. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate
{

    //MARK: properties
    @IBOutlet weak var coordinatesLabel: UILabel!
    @IBOutlet weak var showStructures: UIImageView!
    
    // Used to start getting the users location
    let locationManager = CLLocationManager()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // For use when the app is open & in the background
        locationManager.requestAlwaysAuthorization()
        
        // For use when the app is open
        //locationManager.requestWhenInUseAuthorization()
        
        // If location services is enabled get the users location
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the locaiton accuary here.
            locationManager.startUpdatingLocation()
        }
        
        let latitude = locationManager.location?.coordinate.latitude ?? 37.6060
        let longitude = locationManager.location?.coordinate.longitude ?? -122.055
        
        findStructures(latitude: latitude, longitude: longitude)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func findStructures(latitude: Double, longitude: Double)
    {
        //print(latitude, longitude)
        
        let parameters: Parameters =
        [
            "action": "query",
            "list": "geosearch",
            "gsradius": "100",
            "gscoord":  "51.515419|-0.141099",
            "format": "json"
        ]
        
        Alamofire.request("https://en.wikipedia.org/w/api.php", parameters: parameters).responseJSON
            { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(String(describing: response.result))")     // response serialization result
            print("Error: \(String(describing: response.error))")       // response errors if any

            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }

            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    
    func getImages() -> Void
    {
        Alamofire.request("https://upload.wikimedia.org/wikipedia/commons/3/36/SeattleI5Skyline.jpg", method: .get).responseImage { response in
            guard let image = response.result.value else {
                // Handle error
                return
            }
            self.showStructures.image = image
        }
    }
    
    // If we have been deined access give the user the option to change it
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            showLocationDisabledPopUp()
        }
    }
    
    // Show the popup to the user if we have been deined access
    func showLocationDisabledPopUp() {
        let alertController = UIAlertController(title: "Background Location Access Disabled",
                                                message: "Travel Architect works based on your location! Open Settings to grant this access.",
                                                preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
            if let url = URL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

    //MARK: actions
    @IBAction func getStructures(_ sender: UIButton)
    {
        coordinatesLabel.text = "change"
    }

}
