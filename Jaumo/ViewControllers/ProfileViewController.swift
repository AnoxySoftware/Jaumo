//
//  ProfileViewController.swift
//  Jaumo
//
//  Created by Lefteris Haritou on 28/09/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import UIKit
import Alamofire

class ProfileViewController: PanDismissablePresenterVC, LoadingViewPresentable {
    
    let profileVM = ProfileVM()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchProfiles()
    }
    
    func fetchProfiles() {
        self.showLoadingView()
        let parameters : Parameters = ["amount" : 500, "gender": "female", "ext" : 1]
        
        NetworkManager.shared.fetchProfiles(completion: {[weak self] (responseData, error) in
            guard let strongSelf = self else {return}
            strongSelf.hideLoadingView()
            if let responseData = responseData {
                strongSelf.profileVM.parseData(data: responseData, completion: { (error) in
                    if let error = error {
                        strongSelf.showError(error,nil)
                    }
                    else {
                        strongSelf.collectionView.reloadData()
                    }
                })
            }
            else if let error = error {
                strongSelf.showError(error,nil)
            }
        }, parameters: parameters)
    }

}

extension ProfileViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileVM.numberOfItemsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gridCell", for: indexPath) as! GridCell
        let cellData = profileVM.dataForIndexPath(indexPath: indexPath)
        cell.configure(withVM: cellData)
        return cell
    }
}
