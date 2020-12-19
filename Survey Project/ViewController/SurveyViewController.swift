//
//  SurveyViewController.swift
//  Survey Project
//
//  Created by Julien Chene on 12/18/20.
//  Copyright © 2020 Julien Chene. All rights reserved.
//

import Foundation
import UIKit

class SurveyViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var answersTableView: UITableView!
    
    var question: Question!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = self.question.text
    }
}

extension SurveyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.question.answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension SurveyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.question.answers[indexPath.row].isSelected = true
        
        let storyboard = UIStoryboard(name: "Survey", bundle: nil)
        let surveyViewController: SurveyViewController = storyboard.instantiateViewController(withIdentifier: "SurveyViewController") as! SurveyViewController
        
        surveyViewController.question = AnswersManager.shared.allQuestions[self.question.id + 1]
        self.navigationController?.pushViewController(surveyViewController, animated: true)
    }
}
