//
//  ViewController.swift
//  Quizzler
//
//  Created by Subham Sah on 25/08/2015.
//  Copyright (c) 2015 Subham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var answerPicked : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if (sender.tag == 1) {
            answerPicked = true
        }
        else if (sender.tag == 2) {
            answerPicked = false
        }
        
        checkAnswer()
        questionNumber += 1
        nextQuestion()
        
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score : \(score)"
        progressLabel.text = "\(questionNumber + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }
        else {
            
            let alert = UIAlertController(title: "Awesome", message: "You have finished", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
                
            }
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    
    func checkAnswer() {
        
        let correctAns = allQuestions.list[questionNumber].answers
        
        if (correctAns == answerPicked) {
            ProgressHUD.showSuccess("Correct")
            score += 1
        }
        else {
            ProgressHUD.showError("Wrong")
        }
        
    }
    
    
    func startOver() {
        
        score = 0
        questionNumber = 0
        nextQuestion()
        
    }
    

    
}
