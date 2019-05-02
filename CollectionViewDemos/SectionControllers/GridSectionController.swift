//
//  GridSectionController.swift
//  CollectionViewDemos
//
//  Created by mohamed saeed on 5/2/19.
//  Copyright © 2019 mohamed saeed. All rights reserved.
//

import Foundation
import IGListKit

class AdSectionController: ListSectionController {
    var currentAd: [Ad]?
    let count = 6
    override func didUpdate(to object: Any) {
      
        currentAd = [Ad]()
        ( 0..<count).forEach { (index) in
            let add = Ad(description: "\(index)")
            // currentAd?.append(ad)
            currentAd?.append(add)
        }
    }
    
    override func numberOfItems() -> Int {
        return currentAd?.count ?? 0
    }
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let ctx = collectionContext else {
            return UICollectionViewCell()
        }
        let nibName = String(describing: AdCell.self)
        let cell = ctx.dequeueReusableCell(withNibName: nibName,
                                           bundle: nil,
                                           for: self, at: index)
        if let ad = currentAd?[index] {
            (cell as? AdCell)?.model = ad
            
        }
        return cell
    }
    override func sizeForItem(at index: Int) -> CGSize {
        let width = collectionContext?.containerSize.width ?? 0
        guard let m = currentAd?[index] else {return .zero}
        
        return CGSize(width: m.isExpanded ? width - spacing : (width/3) - spacing , height: width/3)
    }
    override func didSelectItem(at index: Int) {
        guard let m = currentAd?[index] else {return}
        m.isExpanded = !m.isExpanded
        
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.6, options: [], animations: {
            self.collectionContext?.invalidateLayout(for: self, completion: nil)
        }, completion: { _ in        self.collectionContext?.performBatch(animated: false, updates: { (ctx) in
            var iset =    IndexSet()
            iset.insert(index)
            ctx.reload(in: self, at:iset )
        }, completion: nil)})
    }
    
    override init() {
        super.init()
        minimumInteritemSpacing = spacing
        minimumLineSpacing = 5.0
        inset = UIEdgeInsets(top: 0, left: 0, bottom: spacing, right: 0)
    }
    
    let spacing:CGFloat = 5.0
}
