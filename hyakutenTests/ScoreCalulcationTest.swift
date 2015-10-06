//
//  ScoreCalulcationTest.swift
//  hyakuten
//
//  Created by James Morris on 06/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

import XCTest
import CoreData

class ScoreCalculationTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        NSLog("Tests finished")
        super.tearDown()
    }
    
    func testScoreCalculation() {
        let score = CInt(5);
        let maxScore = CInt(20);
        
        
        let percentage = ScoreCalculator.calculatePercentageScore(score,
                                            withTotalQuestions: maxScore);
        
        
        XCTAssertTrue(percentage != 0.0, "Score returned was null");
        XCTAssertTrue(percentage == 25.0);
    }
}