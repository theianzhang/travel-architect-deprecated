////
////  LocationManagement.swift
////  Travel Architect
////
////  Created by Ian Zhang on 2/25/18.
////  Copyright © 2018 Ian Zhang. All rights reserved.
////
//
//import Foundation
//
//func forViewDidLoad()
//{
//    // For use when the app is open & in the background
//    locationManager.requestAlwaysAuthorization()
//
//    // For use when the app is open
//    //locationManager.requestWhenInUseAuthorization()
//
//    // Used to start getting the users location
//    let locationManager = CLLocationManager()
//
//    // If location services is enabled get the users location
//    if CLLocationManager.locationServicesEnabled()
//    {
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the location accuracy here.
//        locationManager.startUpdatingLocation()
//    }
//
//    sleep(3)
//
//    let latitude = locationManager.location?.coordinate.latitude
//    let longitude = locationManager.location?.coordinate.longitude
//}
//
//
//// If we have been denied access give the user the option to change it
//func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//    if(status == CLAuthorizationStatus.denied) {
//        showLocationDisabledPopUp()
//    }
//}
//
//// Show the popup to the user if we have been denied access
//func showLocationDisabledPopUp() {
//    let alertController = UIAlertController(title: "Background Location Access Disabled",
//                                            message: "Travel Architect works based on your location! Open Settings to grant this access.",
//                                            preferredStyle: .alert)
//
//    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//    alertController.addAction(cancelAction)
//
//    let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
//        if let url = URL(string: UIApplicationOpenSettingsURLString) {
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        }
//    }
//    alertController.addAction(openAction)
//
//    self.present(alertController, animated: true, completion: nil)
//}

