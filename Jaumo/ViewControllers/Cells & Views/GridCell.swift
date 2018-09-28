//
//  ImgViewCell.swift
//  Jaumo
//
//  Created by Lefteris Haritou on 28/09/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import UIKit
import AlamofireImage

class GridCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    func configure(withVM model: ProfilePresentable) {
        self.nameLabel.text = model.name
        self.ageLabel.text = model.age
        if let imageURL = URL(string:model.photoURLString) {
            self.imgView.af_setImage(withURL: imageURL, placeholderImage: UIImage(named:"profile_empty"))
        }
        else {
            self.imgView.image = UIImage(named:"profile_empty")
        }
    }
}
