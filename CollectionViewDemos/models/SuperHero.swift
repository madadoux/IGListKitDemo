//
//  SuperHero.swift
//  CollectionViewDemos
//
//  Created by mohamed saeed on 5/2/19.
//  Copyright © 2019 mohamed saeed. All rights reserved.
//

import Foundation
import  UIKit
import IGListKit
class SuperHero {
    private var identifier: String = UUID().uuidString
    private(set) var firstName: String
    private(set) var lastName: String
    private(set) var superHeroName: String
    private(set) var icon: String
    var image : UIImage
    init(firstName: String,
         lastName: String,
         superHeroName: String,
         icon: String ,
         img : UIImage) {
        self.firstName = firstName
        self.lastName = lastName
        self.superHeroName = superHeroName
        self.icon = icon
        self.image = img
    }
}

extension SuperHero : ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let obj = object as? SuperHero {
            return self.identifier  == obj.identifier
        }
        return false
    }
}
