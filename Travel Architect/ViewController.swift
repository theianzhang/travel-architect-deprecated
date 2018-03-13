//  ViewController.swift
//  Travel Architect
//
//  Created by Ian Zhang on 10/10/17.
//  Copyright © 2018 Ian Zhang. All rights reserved.

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    //MARK: properties
    @IBOutlet weak var coordinatesLabel: UILabel!
    @IBOutlet weak var showStructures: UIImageView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var scrollView: UICollectionView!
    
    // Used to start getting the users location
    let locationManager = CLLocationManager()
    
    //image labels and image array
//    let locationNames = ["China", "USA", "Canada"]
//    let locationImages = [UIImage(named: "China"), UIImage(named: "United States"), UIImage(named: "Canada")]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        //set scrollView height
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 100)
        
        // For use when the app is open
        //locationManager.requestWhenInUseAuthorization()
        
        // For use when the app is open & in the background
        locationManager.requestAlwaysAuthorization()
        
        // If location services is enabled get the users location
        if CLLocationManager.locationServicesEnabled()
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the location accuracy here.
            locationManager.startUpdatingLocation()
        }
        
        //used for simulator given existing bug
        sleep(3)
        
        let latitude = locationManager.location?.coordinate.latitude
        let longitude = locationManager.location?.coordinate.longitude
        
        getImage(latitude: latitude!, longitude: longitude!)
        {
            //print(imageArray.count)
            print(imageArray)
            
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        //print(imageArray.count)
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        //print(imageArray.count)
        cell.displayContent(image: imageArray[indexPath.row], title: urlArray[indexPath.row])
        
        //This creates the shadows and modifies the cards a little bit
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    // If we have been denied access give the user the option to change it
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            showLocationDisabledPopUp()
        }
    }
    
    // Show the popup to the user if we have been denied access
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
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: actions
    @IBAction func getStructures(_ sender: UIButton)
    {
        coordinatesLabel.text = "change"
    }
}
