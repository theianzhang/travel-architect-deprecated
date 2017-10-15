//
//  ViewController.swift
//  Travel Architect
//
//  Created by Ian Zhang on 10/10/17.
//  Copyright © 2017 Ian Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: properties
    @IBOutlet weak var coordinatesLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


    //MARK: actions
    @IBAction func getStructures(_ sender: UIButton)
    {
        coordinatesLabel.text = "change to me"
    }
}

