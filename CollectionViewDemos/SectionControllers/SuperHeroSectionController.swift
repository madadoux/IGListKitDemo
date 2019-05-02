//
//  SuperHeroSectionController.swift
//  CollectionViewDemos
//
//  Created by mohamed saeed on 5/2/19.
//  Copyright © 2019 mohamed saeed. All rights reserved.
//

import Foundation
import  UIKit
import IGListKit
class SuperHeroListSectionController : ListSectionController  {
    
    
    var isExpanded = false ;
    var currentHeros : [SuperHero]?
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let collectionViewCtx = collectionContext ,let  currHeros = currentHeros else {return UICollectionViewCell() }
        
        if let cell = collectionViewCtx.dequeueReusableCell(withNibName: "SuperHeroCell", bundle: nil, for: self, at: index) as? SuperHeroCell {
            cell.model = currHeros[index]
            return cell
        }
        
        return UICollectionViewCell()
        
    }
    
    override func numberOfItems() -> Int {
        guard let ch = currentHeros else { return 0}
        return ch.count
    }
    
    override func didUpdate(to object: Any) {
        if let hero = object as? SuperHero{
            currentHeros = [hero]
        }
    }
    
    override func didSelectItem(at index: Int) {
        isExpanded = !isExpanded
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.3, options: [], animations: {
            self.collectionContext?.invalidateLayout(for: self, completion: nil)
        }, completion: nil)
    }
    override func sizeForItem(at index: Int) -> CGSize {
        let width = collectionContext?.containerSize.width ?? 0
        return CGSize(width: width - 5, height: isExpanded ? width : 80 )
    }
    
    override init() {
        super.init()
        self.minimumLineSpacing = 2.0
        self.minimumInteritemSpacing = 2.0
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 5.0, right: 0)
    }
    
}
