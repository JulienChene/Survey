//
//  Question.swift
//  Survey Project
//
//  Created by Julien Chene on 12/18/20.
//  Copyright © 2020 Julien Chene. All rights reserved.
//

import Foundation

struct Question {
    typealias KeyValue = [String : Any]
    let id: Int
    let text: String
    var answers: [Answer]
    
    func toJson() -> KeyValue {
        var json: KeyValue = [:]
        var answersJson: [KeyValue] = []
        
        for answer in self.answers {
            answersJson.append(answer.toJson())
        }
        
        json[String(self.id)] = answersJson
        
        return json
    }
}
