//
//  ViewController.swift
//  CollectionViewDemos
//
//  Created by mohamed saeed on 5/2/19.
//  Copyright © 2019 mohamed saeed. All rights reserved.
//

import UIKit
import IGListKit

class ViewController: UIViewController , UICollectionViewDelegate  {
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var adapter : ListAdapter = {
        let updater = ListAdapterUpdater()
        let adapter = ListAdapter(updater: updater, viewController: self, workingRangeSize: 1)
        let collectionView2 = ListCollectionView(frame: self.view.bounds.insetBy(dx: 10, dy: 20), listCollectionViewLayout: customLayout(stickyHeaders: false, topContentInset: 2.0, stretchToEdge: false))
        collectionView2.backgroundColor = .white
        self.view.addSubview(collectionView2)
        adapter.collectionView = collectionView2
        adapter.dataSource = SuperHeroDataSource();
        return adapter
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        _ = adapter
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

class SuperHeroDataSource : NSObject , ListAdapterDataSource {
    let superHeros = [SuperHero(firstName: "Peter",
                                lastName: "Parker",
                                superHeroName: "SpiderMan",
                                icon: "🕷", img : #imageLiteral(resourceName: "peter_parker")),
                      Ad(description: "Hola bola mola "),
                      SuperHero(firstName: "Bruce",
                                lastName: "Wayne",
                                superHeroName: "Batman",
                                icon: "🦇",img : #imageLiteral(resourceName: "bruce_wayne")),
                      
                      SuperHero(firstName: "Tony",
                                lastName: "Stark",
                                superHeroName: "Ironman",
                                icon: "🤖" , img : #imageLiteral(resourceName: "tony_stark")),
                      Ad(description: "Hola bola mola "),
                      
                      SuperHero(firstName: "Bruce",
                                lastName: "Banner",
                                superHeroName: "Incredible Hulk",
                                icon: "🤢", img : #imageLiteral(resourceName: "bruce_banner")),
                      SuperHero(firstName: "Peter",
                                lastName: "Parker",
                                superHeroName: "SpiderMan",
                                icon: "🕷", img : #imageLiteral(resourceName: "peter_parker")),
                      Ad(description: "Hola bola mola "),
                      SuperHero(firstName: "Bruce",
                                lastName: "Wayne",
                                superHeroName: "Batman",
                                icon: "🦇",img : #imageLiteral(resourceName: "bruce_wayne")),
                      SuperHero(firstName: "Tony",
                                lastName: "Stark",
                                superHeroName: "Ironman",
                                icon: "🤖" , img : #imageLiteral(resourceName: "tony_stark")),
                      Ad(description: "Hola bola mola "),
                      
                      SuperHero(firstName: "Bruce",
                                lastName: "Banner",
                                superHeroName: "Incredible Hulk",
                                icon: "🤢", img : #imageLiteral(resourceName: "bruce_banner"))
        ,SuperHero(firstName: "Peter",
                   lastName: "Parker",
                   superHeroName: "SpiderMan",
                   icon: "🕷", img : #imageLiteral(resourceName: "peter_parker")),
         Ad(description: "Hola bola mola "),
         SuperHero(firstName: "Bruce",
                   lastName: "Wayne",
                   superHeroName: "Batman",
                   icon: "🦇",img : #imageLiteral(resourceName: "bruce_wayne")),
         SuperHero(firstName: "Tony",
                   lastName: "Stark",
                   superHeroName: "Ironman",
                   icon: "🤖" , img : #imageLiteral(resourceName: "tony_stark")),
         Ad(description: "Hola bola mola "),
         
         SuperHero(firstName: "Bruce",
                   lastName: "Banner",
                   superHeroName: "Incredible Hulk",
                   icon: "🤢", img : #imageLiteral(resourceName: "bruce_banner"))
        ,
         ] as [ListDiffable]
    
    
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is SuperHero {
            let b =  SuperHeroListSectionController()
            
            return b
        }
        else if object is Ad {
            return AdSectionController()
        }
        else {
            return ListSectionController()
        }
    }
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return superHeros
    }
}

class customLayout : ListCollectionViewLayout {
    override var scrollDirection: UICollectionViewScrollDirection
    {
        return .vertical
        
    }
    
    
}



