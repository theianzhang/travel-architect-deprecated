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
import SwiftyJSON

class ViewController: UIViewController, CLLocationManagerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    //MARK: properties
    @IBOutlet weak var coordinatesLabel: UILabel!
    @IBOutlet weak var showStructures: UIImageView!
    @IBOutlet var collectionView: UICollectionView!
    
    // array of wiki images
    //var imageArray = [UIImage]()
    
    let locationNames = ["China", "USA", "Canada"]
    let locationImages = [UIImage(named: "China"), UIImage(named: "United States"), UIImage(named: "Canada")]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        //print(self.imageArray.count)
        return locationImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        //print(imageArray.count)
        cell.locationImage.image = locationImages[indexPath.row]
        cell.locationName.text = locationNames[indexPath.row]
        
        //This creates the shadows and modifies the cards a little bit
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
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
