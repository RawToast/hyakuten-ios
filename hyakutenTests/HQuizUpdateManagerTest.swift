//
//  HQuizUpdateManagerTest.swift
//  hyakuten
//
//  Created by James Morris on 11/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//
import XCTest
import CoreData

class HQuizUpdateManagerTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        NSLog("Tests finished")
        super.tearDown()
    }
    
    func testIfUpdatesAvailableIsTrueUpdatesAreAvailable() {
        
        let updateManager = HQuizUpdateManager()
        
        updateManager.checkForUpdates(1)
        
        let hasUpdates = updateManager.updatesAvailable
        
        XCTAssertTrue(hasUpdates, "Response with no updates, expected updates")
    }
}