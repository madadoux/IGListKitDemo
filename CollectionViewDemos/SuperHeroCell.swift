//
//  SuperHeroCell.swift
//  CollectionViewDemos
//
//  Created by mohamed saeed on 5/2/19.
//  Copyright © 2019 mohamed saeed. All rights reserved.
//

import Foundation
import UIKit
class SuperHeroCell : UICollectionViewCell {
    @IBOutlet weak var icon : UILabel!
    @IBOutlet weak var firstName : UILabel!
    @IBOutlet weak var lastName : UILabel!
    @IBOutlet weak var img : UIImageView!
    
    
    var model : SuperHero? {
        didSet{
            
            icon.text = model?.icon
            firstName.text = model?.firstName
            lastName.text = model?.lastName
            img.image = model?.image
        }
    }
}
