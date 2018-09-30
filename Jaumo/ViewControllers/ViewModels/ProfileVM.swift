//
//  ProfileVM.swift
//  Jaumo
//
//  Created by Lefteris Haritou on 28/09/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import Foundation
import Alamofire

protocol ProfilePresentable {
    var name: String { get }
    var photoURLString: String { get }
    var age: String { get }
    var location: String { get }
}

class ProfileVM : NSObject {
    
    struct ProfileViewModel: ProfilePresentable {
        
        let name: String
        let photoURLString: String
        let age: String
        let location: String
        
        init(withProfile model: ProfileElement) {
            self.name = "\(model.name) \(model.surname)"
            self.photoURLString = model.photo
            self.age = String(format: NSLocalizedString("%i years", comment: "Profile Age"), model.age)
            self.location = model.region
        }
    }
    
    private var profiles = [ProfileElement]()
    typealias ParseCompletion = (_ error: Error?) -> Void
    
    init(profilesArray:[ProfileElement]? = nil) {
        super.init()
        if let profilesArray = profilesArray {
            self.profiles = profilesArray
        }
    }
    
    func hasData() -> Bool {
        return self.profiles.count > 0
    }
    
    private func setProfiles(profilesArray:[ProfileElement]) {
        self.profiles = profilesArray
    }
    
    func numberOfItemsInSection(section:Int) -> Int {
        return profiles.count
    }
    
    func dataForIndexPath(indexPath:IndexPath) -> ProfilePresentable {
        return ProfileViewModel(withProfile: profiles[indexPath.row])
    }
    
    func parseData(data : Data, completion: ParseCompletion) {
        let decoder = JSONDecoder()
        do {
            let profilesArray = try decoder.decode(Profile.self, from: data)
            self.profiles = profilesArray
            completion(nil)
        }
        catch {
            completion(error)
            print("Error parsing Json")
        }
    }
}
