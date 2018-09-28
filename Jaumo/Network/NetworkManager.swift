//
//  NetworkManager.swift
//  Jaumo
//
//  Created by Lefteris Haritou on 28/09/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import Alamofire

class NetworkManager: NSObject {
    static let shared = NetworkManager()
    typealias RequestCompletion = (_ json: Data?,_ error: Error?) -> Void
    
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
}
