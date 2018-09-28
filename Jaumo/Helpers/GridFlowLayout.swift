//
//  GridFlowLayout.swift
//  Jaumo
//
//  Created by Lefteris Haritou on 28/09/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import UIKit

class GridFlowLayout : UICollectionViewFlowLayout {
    private var firstSetupDone = false
    
    override func prepare() {
        super.prepare()
        if !firstSetupDone {
            firstSetupDone = true
            setup()
        }
    }
    
    private func setup() {
        scrollDirection = .vertical
        minimumLineSpacing = 2
        minimumInteritemSpacing = 2
        itemSize = CGSize(width: collectionView!.bounds.width * 0.5 - 1, height: collectionView!.bounds.width * 0.5 - 1)
        collectionView!.decelerationRate = .normal
    }
}
