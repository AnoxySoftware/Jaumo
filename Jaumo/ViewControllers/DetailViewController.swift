//
//  DetailViewController.swift
//  Jaumo
//
//  Created by Lefteris Haritou on 28/09/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import UIKit

class DetailViewController: PanDismissableVC {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var model : ProfilePresentable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let model = model {
            self.configureWith(model: model)
        }
    }
    
    private func configureWith(model: ProfilePresentable) {
        self.lblName.text = model.name
        self.lblAge.text = model.age
        self.lblLocation.text = model.location
        if let imageURL = URL(string:model.photoURLString) {
            self.imgView.af_setImage(withURL: imageURL, placeholderImage: UIImage(named:"profile_empty"))
        }
        else {
            self.imgView.image = UIImage(named:"profile_empty")
        }
    }
}
