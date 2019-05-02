//
//  AdCell.swift
//  CollectionViewDemos
//
//  Created by mohamed saeed on 5/2/19.
//  Copyright © 2019 mohamed saeed. All rights reserved.
//
import  UIKit

class AdCell : UICollectionViewCell {
    
    @IBOutlet weak var label : UILabel!
    var model : Ad? {
        didSet {
            label.text = model?.description
        }
    }
}
