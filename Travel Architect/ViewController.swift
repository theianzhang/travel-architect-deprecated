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

class ViewController: UIViewController
{

    //MARK: properties
    @IBOutlet weak var coordinatesLabel: UILabel!
    @IBOutlet weak var showStructures: UIImageView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        Alamofire.request("https://en.wikipedia.org/w/api.php?action=query&format=json&prop=extracts&titles=Seattle&exintro=1").responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
//
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//            }
//
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
//            }
//        }
        
        Alamofire.request("https://upload.wikimedia.org/wikipedia/commons/3/36/SeattleI5Skyline.jpg", method: .get).responseImage { response in
            guard let image = response.result.value else {
                // Handle error
                return
            }
            self.showStructures.image = image
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: actions
    @IBAction func getStructures(_ sender: UIButton)
    {
        coordinatesLabel.text = "change"
    }

}

