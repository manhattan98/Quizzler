//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Eremej Sumcenko on 14.02.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    var quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    
    var currentQuestionIntex = 0
    
    var score = 0
    
    var currentAnswer = ""
    
    mutating func next() {
        if currentAnswer == quiz[currentQuestionIntex].answer {
            score += 1
        }
        if currentQuestionIntex < quiz.count - 1 {
            currentQuestionIntex += 1
        }
    }
    
    var currentText: String {
        get {
            return quiz[currentQuestionIntex].text
        }
    }
    
    var currentVariants: [String] {
        get {
            return quiz[currentQuestionIntex].variants
        }
    }
    
    var quizProgres: Float {
        get {
            return Float(currentQuestionIntex) / Float(quiz.count - 1)
        }
    }
    
    var isDone: Bool {
        get {
            return quizProgres == 1.0
        }
    }
    
    mutating func checkAnswer(_ supposedAnswer: String) -> Bool {
        currentAnswer = supposedAnswer
        return quiz[currentQuestionIntex].checkAnswer(supposedAnswer)
    }
    
    mutating func restartQuiz() {
        currentQuestionIntex = 0
        score = 0
    }
}
