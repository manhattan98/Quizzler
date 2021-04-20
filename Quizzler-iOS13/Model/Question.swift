//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Eremej Sumcenko on 14.02.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let variants: [String]
    let answer: String
        
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        variants = a
        answer = correctAnswer
    }
    
    func checkAnswer(_ supposedAnswer: String) -> Bool {
        return answer == supposedAnswer
    }
}
