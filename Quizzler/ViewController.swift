//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        pickedAnswer = sender.tag == 1
        checkAnswer()
        nextQuestion()
    }
    
    func updateUI() {
        questionLabel.text = allQuestions.list[questionNumber].questionText
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1)/13"
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.endIndex)) * CGFloat(questionNumber + 1)
    }
    
    func nextQuestion() {
        if questionNumber < allQuestions.list.endIndex - 1 {
            questionNumber += 1
            updateUI()
        } else {
            let alert = UIAlertController(
                title: "Awesome",
                message: "You've finished all the questions, do you want to start over?",
                preferredStyle: .alert)
            
            let restartAction = UIAlertAction(
                title: "Restart",
                style: .default,
                handler: {
                    (UIAlertAction) in
                    self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Correct")
            score += 1
        } else {
            ProgressHUD.showError("Wrong!")
        }
    }
    
    func startOver() {
        questionNumber = 0
        score = 0
        updateUI()
    }
    
    
    
}
