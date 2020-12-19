//
//  ViewController.swift
//  Survey Project
//
//  Created by Julien Chene on 12/18/20.
//  Copyright © 2020 Julien Chene. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet var genericButton: UIButton!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func handleDidTapGenericSurvey() {
        let storyboard = UIStoryboard(name: "Survey", bundle: nil)
        let surveyViewController: SurveyViewController = storyboard.instantiateViewController(withIdentifier: "SurveyViewController") as! SurveyViewController
        
        surveyViewController.question = AnswersManager.shared.allQuestions[0]
        self.navigationController?.pushViewController(surveyViewController, animated: true)
    }
}

