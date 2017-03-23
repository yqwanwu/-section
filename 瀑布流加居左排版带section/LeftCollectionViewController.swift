//
//  LeftCollectionViewController.swift
//  线程测试
//
//  Created by wanwu on 17/3/22.
//  Copyright © 2017年 wanwu. All rights reserved.
//

import UIKit

class LeftCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var collectionView: UICollectionView!

    var layout = LeftAlignLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "CollectionReusableView", bundle: Bundle.main)
        collectionView.register(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footer")
        collectionView.register(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        
        //设置布局
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        //        layout.itemSize = CGSize(width: (view.frame.width - 60) / 2, height: 120)
        collectionView.setCollectionViewLayout(layout, animated: true)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        layout.headerReferenceSize = CGSize(width: view.frame.width, height: 50)
        layout.footerReferenceSize = CGSize(width: view.frame.width, height: 50)
        
        layout.setWidthFotItem { (idx) -> CGSize in
            return CGSize(width: CGFloat(arc4random() % 60 + 30), height: 40)
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor(red: CGFloat((arc4random() % 100)) / 100.0, green: CGFloat((arc4random() % 100)) / 100.0, blue: CGFloat((arc4random() % 100)) / 100.0, alpha: 1)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.width, height: 100)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.width, height: 50)
//    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header", for: indexPath)
            view.backgroundColor = UIColor.yellow
            return view
        } else {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footer", for: indexPath)
            view.backgroundColor = UIColor.red
            return view
        }
        
    }
   
}
