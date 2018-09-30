//
//  JaumoTests.swift
//  JaumoTests
//
//  Created by Lefteris Haritou on 28/09/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import XCTest
@testable import Jaumo

class JaumoTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDataModelCreation() {
        let testBundle = Bundle(for: type(of: self))
        let decoder = JSONDecoder()
        guard let ressourceURL = testBundle.url(forResource: "mockData", withExtension: "json") else {return}
        
        do {
            let sampleData = try Data(contentsOf: ressourceURL)
            let profilesArray = try decoder.decode(Profile.self, from: sampleData)
            
            let profileData = profilesArray.first
            let creditCard = profileData?.creditCard
            let birthDaty = profileData?.birthday
            
            XCTAssertEqual(profilesArray.count, 20)
            XCTAssertNotNil(profileData)
            XCTAssertNotNil(creditCard)
            XCTAssertNotNil(birthDaty)
            
            XCTAssertEqual(profileData?.name, "Agustín")
            XCTAssertEqual(profileData?.surname, "Andrade")
            XCTAssertEqual(profileData?.gender, "male")
            XCTAssertEqual(profileData?.region, "Mexico")
            XCTAssertEqual(profileData?.age, 28)
            XCTAssertEqual(profileData?.email, "agustín-90@example.com")
            XCTAssertEqual(profileData?.password, "Andrade90$^")
            XCTAssertEqual(profileData?.photo, "https://uinames.com/api/photos/male/18.jpg")
            
            XCTAssertEqual(creditCard?.expiration, "9/23")
            XCTAssertEqual(creditCard?.number, "6483-2991-2531-3487")
            XCTAssertEqual(creditCard?.pin, 7743)
            XCTAssertEqual(creditCard?.security, 416)
            
            XCTAssertEqual(birthDaty?.dmy, "26/05/1990")
            XCTAssertEqual(birthDaty?.mdy, "05/26/1990")
            XCTAssertEqual(birthDaty?.raw, 643750496)
            
        }
        catch let error {
            fatalError("Error parsing data: \(error.localizedDescription)")
        }
        
    }
    
    func testProfileVM() {
        let testBundle = Bundle(for: type(of: self))
       
        guard let ressourceURL = testBundle.url(forResource: "mockData", withExtension: "json") else {return}
        let profileVM = ProfileVM()
        
        do {
            let sampleData = try Data(contentsOf: ressourceURL)
            
            profileVM.parseData(data: sampleData, completion: { (error) in
                XCTAssertNil(error,"Error parsing the JSON Data")
                
                XCTAssertEqual(profileVM.hasData(),true)
                XCTAssertEqual(profileVM.numberOfItemsInSection(section: 0),20)
                
                let dataForFirstRow = profileVM.dataForIndexPath(indexPath: [0,0])
                XCTAssertEqual(dataForFirstRow.age,String(format: NSLocalizedString("%i years", comment: "Profile Age"), 28))
                XCTAssertEqual(dataForFirstRow.name,"Agustín Andrade")
                XCTAssertEqual(dataForFirstRow.photoURLString,"https://uinames.com/api/photos/male/18.jpg")
                XCTAssertEqual(dataForFirstRow.location,"Mexico")
            })
        }
        catch let error {
            fatalError("Error parsing data: \(error.localizedDescription)")
        }
    }
    
}
