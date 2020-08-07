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
    
    @IBOutlet weak var choiceOne: UIButton!
    
    @IBOutlet weak var choiceTwo: UIButton!
    
    @IBOutlet weak var choiceThree: UIButton!
    
    @IBOutlet weak var userScore: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!

        let checkedAnswer = quizBrain.checkAnswer(userAnswer)
        if checkedAnswer{
            sender.backgroundColor = UIColor.green
        } else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

    }
    
    @objc func updateUI(){
        progressBar.progress = quizBrain.caluclateProgress()
        questionLabel.text = quizBrain.fetchquestionText()
        choiceOne.setTitle(quizBrain.getChoiceAnswer(0), for:.normal)
        choiceTwo.setTitle(quizBrain.getChoiceAnswer(1), for:.normal)
        choiceThree.setTitle(quizBrain.getChoiceAnswer(2), for:.normal)
        choiceOne.backgroundColor = UIColor.clear
        choiceTwo.backgroundColor = UIColor.clear
        choiceThree.backgroundColor = UIColor.clear
        userScore.text = "Score: \(quizBrain.getScore())"
    }
    
}

