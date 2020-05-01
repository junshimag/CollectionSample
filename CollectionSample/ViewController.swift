//
//  ViewController.swift
//  CollectionSample
//
//  Created by shimaguchi on 2020/05/02.
//  Copyright © 2020 junshimag. All rights reserved.
//

import Cocoa

class ViewController: NSViewController,NSCollectionViewDelegate,NSCollectionViewDataSource {

    @IBOutlet var collectionView: NSCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let itemNib = NSNib(nibNamed: "TestLabelCollectionViewItem", bundle: nil)
        self.collectionView.register(itemNib, forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: "testLabel"))
        
        setupCollectionView()
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        
        let item:TestLabelCollectionViewItem! = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "testLabel"), for: indexPath) as? TestLabelCollectionViewItem
        
        print(indexPath.debugDescription)
        item.testLabel.stringValue = "str" + String(indexPath.item)
        
        return item
    }
    
    func setupCollectionView() {
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 100.0, height: 100.0)
        flowLayout.sectionInset = NSEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        flowLayout.minimumInteritemSpacing = 20.0
        flowLayout.minimumLineSpacing = 20.0
        collectionView.collectionViewLayout = flowLayout
    }
}

