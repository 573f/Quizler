//
//  Question.swift
//  Quizzler
//
//  Created by Stephen Skubik-Peplaski on 8/30/17.
//

import Foundation

class Question {
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
