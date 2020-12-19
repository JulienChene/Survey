//
//  Answer.swift
//  Survey Project
//
//  Created by Julien Chene on 12/18/20.
//  Copyright © 2020 Julien Chene. All rights reserved.
//

import Foundation

class Answer {
    let text: String
    var isSelected: Bool
    
    init(text: String, isSelected: Bool) {
        self.text = text
        self.isSelected = isSelected
    }
    
    func toJson() -> [String : Any] {
        var json: [String : Any] = [:]
        
        let value: Int
        if self.isSelected  { value = 1 }
        else                { value = 0}
        json[self.text] = value
        
        return json
    }
}
