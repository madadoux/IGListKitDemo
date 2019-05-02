//
//  NumberWidget.swift
//  CollectionViewDemos
//
//  Created by mohamed saeed on 5/2/19.
//  Copyright © 2019 mohamed saeed. All rights reserved.
//

import Foundation
import UIKit
import IGListKit

class Ad: ListDiffable {
    var isExpanded = false
    var identifier: String = UUID().uuidString
    private(set) var description: String
    init(description: String) {
        self.description = description
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSString
    }
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Ad else {
            return false
        }
        return self.identifier == object.identifier
    }
}
