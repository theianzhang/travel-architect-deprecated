//
//  CollectionViewCell.swift
//  Travel Architect
//
//  Created by Ian Zhang on 2/24/18.
//  Copyright © 2018 Ian Zhang. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell
{
    
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var locationName: UILabel!
    
    func displayContent(image: UIImage, title: String)
    {
        locationImage.image = image
        locationName.text = title
    }
}
