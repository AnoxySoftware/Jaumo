//
//  NetworkManager.swift
//  Jaumo
//
//  Created by Lefteris Haritou on 28/09/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import Alamofire

enum ConfigurationEnvironment : Int {
    case production
    case sandbox
}

class NetworkManager: NSObject {
    
    static let shared = NetworkManager()
    
    typealias RequestCompletion = (_ json: Data?,_ error: Error?) -> Void
    
    private var apiBaseURL : String = ""
    
    var activeConfiguration: ConfigurationEnvironment {
        didSet {
            self.setConfig(self.activeConfiguration)
        }
    }
    
    private func setConfig(_ env:ConfigurationEnvironment) {
        switch env {
        case .production:
            apiBaseURL = "https://uinames.com/api/"
        case .sandbox:
            //in this test we don't have a sandbox serer, so using same as production
            apiBaseURL = "https://uinames.com/api/"
        }
    }
    
    override init() {
        #if RELEASE
        self.activeConfiguration = ConfigurationEnvironment.production
        #else
        self.activeConfiguration = ConfigurationEnvironment.sandbox
        #endif
        super.init()
        self.setConfig(self.activeConfiguration)
    }
    
    private let sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        return SessionManager(configuration: configuration)
    }()
    
    private func performRequest(urlString:String,method:HTTPMethod = .get, parameters:Parameters? = nil, encoding:ParameterEncoding = URLEncoding.default, completion: @escaping RequestCompletion) {
        sessionManager.request(urlString, method: method, parameters: parameters, encoding: encoding).responseJSON {response in
            if response.response?.statusCode != 200, let error = response.error {
                completion(nil,error)
                return
            }
            else if let responseData = response.data {
                completion(responseData,nil)
                return
            }
            completion(nil,nil)
        }
    }
    
    func fetchProfiles(completion: @escaping RequestCompletion, parameters:Parameters) {
        let urlString = self.apiBaseURL
        self.performRequest(urlString: urlString, parameters: parameters, completion: completion)
    }
}
