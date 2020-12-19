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
                                            answers: [Answer(text: "Dry", isSelected: false),
                                                      Answer(text: "Oily", isSelected: false),
                                                      Answer(text: "Sensitive", isSelected: false)]),
                                    Question(id: 4,
                                    text: "What scent do you prefer",
                                    answers: [Answer(text: "Citrus", isSelected: false),
                                              Answer(text: "Fresh", isSelected: false),
                                              Answer(text: "Woodsy", isSelected: false),
                                              Answer(text: "None", isSelected: false)])
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
