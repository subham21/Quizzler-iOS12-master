//
//  Question.swift
//  Quizzler
//
//  Created by Sanjay on 01/07/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let answers : Bool
    
    init(text : String, correctAnswer : Bool) {
        
        questionText = text
        answers = correctAnswer
        
    }
    
}
