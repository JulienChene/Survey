//
//  AnswerManager.swift
//  Survey Project
//
//  Created by Julien Chene on 12/18/20.
//  Copyright © 2020 Julien Chene. All rights reserved.
//

import Foundation

class AnswersManager {
    typealias QuestionId = Int
    static var shared = AnswersManager()
    
    let allQuestions: [Question] = [Question(id: 0,
                                             text: "What's your skin type?",
                                             answers: [Answer(text: "Dry"),
                                                       Answer(text: "Oily"),
                                                       Answer(text: "Sensitive"),
                                                       Answer(text: "Combo"),
                                                       Answer(text: "Normal")]),
                                    Question(id: 1,
                                             text: "What's your top skin concern?",
                                             answers: [Answer(text: "Dryness"),
                                                       Answer(text: "Acne"),
                                                       Answer(text: "Large pores"),
                                                       Answer(text: "Oiliness"),
                                                       Answer(text: "Aging"),
                                                       Answer(text: "Razor bumps"),
                                                       Answer(text: "Redness"),
                                                       Answer(text: "Sun damage")]),
                                    Question(id: 2,
                                             text: "What products are you most interested in?",
                                             answers: [Answer(text: "Cleanser"),
                                                       Answer(text: "Moisturizer"),
                                                       Answer(text: "SPF"),
                                                       Answer(text: "Shaving cream"),
                                                       Answer(text: "Face masks")]),
                                    Question(id: 3,
                                             text: "What is your preferred budget?",
                                             answers: [Answer(text: "$25 or less"),
                                                       Answer(text: "$25 - 50"),
                                                       Answer(text: "Any amount")]),
                                    Question(id: 4,
                                             text: "What scent do you prefer?",
                                             answers: [Answer(text: "Citrus"),
                                                       Answer(text: "Fresh"),
                                                       Answer(text: "Woodsy"),
                                                       Answer(text: "None")])
    ]
    
    
    var answeredQuestions: [QuestionId : Question] = [:]
    
    func recordAnswer(for question: Question) {
        self.answeredQuestions[question.id] = question
    }
    
    var submittableRecord: [[String : Any]] {
        var jsonArray: [[String : Any]] = []
        self.answeredQuestions.forEach { questionId, question in
            jsonArray.append(question.toJson())
        }
        
        return jsonArray
    }
    
    /*
     ["0" : {
         "Dry" :        0,
         "Oily" :       0,
         "Sensitive" :  1,
         "Combo" :      0,
         "Normal" :     0,
     },
     ...
     "4" : {
         "Citrus" : 0,
         "Fresh" : 0,
         "Woodsy" : 1,
         "None" : 0,
     }
     ]
     */
}
