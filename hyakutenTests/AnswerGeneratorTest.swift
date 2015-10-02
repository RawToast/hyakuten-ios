//
//  AnswerGeneratorTest.swift
//  hyakuten
//
//  Created by James Morris on 01/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

import XCTest
import CoreData

class AnswerGeneratorTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        NSLog("Tests finished")
        super.tearDown()
    }

    func testParticleAnswerGeneration() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        
        let context = setUpInMemoryManagedObjectContext()
        
        let question = NSEntityDescription.insertNewObjectForEntityForName("Question", inManagedObjectContext: context) as! Question
        question.closeType = PARTICLE
        question.answer = "は"
    
        let answers = AnswerGenerator.generateAnswersForQuestion(question)
        
        // Assert size
        let expectedSize = 4
        let actualSize = answers.count
        XCTAssertTrue(answers.count == 4, String(format: "Recieved %d answers expected %d", actualSize,
                                                                                            expectedSize))
        
        
    }

}