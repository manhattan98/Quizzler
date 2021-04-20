//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var answerButton1: UIButton!
    
    @IBOutlet weak var answerButton2: UIButton!
    
    @IBOutlet weak var answerButton3: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var quizBrain = QuizBrain()
    
    let answerDelay = 0.5
            
    func resetButtons() {
        answerButton1.backgroundColor = UIColor.clear
        answerButton2.backgroundColor = UIColor.clear
        answerButton3.backgroundColor = UIColor.clear
    }
    
    func setScore() {
        scoreLabel.text = String(quizBrain.score)
    }
    
    func setProgress() {
        progressBar.progress = quizBrain.quizProgres
    }
    
    func setQuestion() {
        questionLabel.text = quizBrain.currentText
        answerButton1.setTitle(quizBrain.currentVariants[0], for: UIControl.State.normal)
        answerButton2.setTitle(quizBrain.currentVariants[1], for: UIControl.State.normal)
        answerButton3.setTitle(quizBrain.currentVariants[2], for: UIControl.State.normal)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setQuestion()
        setProgress()
        setScore()
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let correctness = quizBrain.checkAnswer(userAnswer)
        
        if correctness {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        if quizBrain.isDone {
            quizBrain.restartQuiz()
        } else {
            quizBrain.next()
        }
        
        self.setScore()
        
        Timer.scheduledTimer(withTimeInterval: answerDelay, repeats: false) { (Timer) in
            self.resetButtons()
            self.setQuestion()
            self.setProgress()
        }
        
    }
    
}

