//
//  MockData.swift
//  OneYes
//
//  Created by iMac Pro on 4/3/23.
//

import Foundation

struct MockData {
    
    let mockData: [Affirmation] = [
        Affirmation(title: "Affirmation Title 1", completedDate: Date.now + 1, isCompleted: false, logs: [
            Log(logTitle: "Log Title 1"),
            Log(logTitle: "Log Title 2")
        ], affirmationUUID: "123456"),
        
        Affirmation(title: "Affirmation Title 2", completedDate: Date.now + 1, isCompleted: false, logs: [
            Log(logTitle: "Log Title A"),
            Log(logTitle: "Log Title B")
        ], affirmationUUID: "ABCDEF"),
        
        Affirmation(title: "Affirmation Title 2", completedDate: Date.now + 1, isCompleted: false, logs: [
            Log(logTitle: "Log Title A"),
            Log(logTitle: "Log Title B")
        ], affirmationUUID: "A1B2C3")
    ]
}
