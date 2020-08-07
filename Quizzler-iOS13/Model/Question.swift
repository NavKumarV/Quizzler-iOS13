//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Naveen Kumar V on 06/08/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let text: String
    let answerList: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String){
        text = q
        answerList = a
        self.correctAnswer = correctAnswer
    }
}
