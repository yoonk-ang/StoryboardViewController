//
//  ExampleViewController.swift
//  StoryboardViewController_Example
//
//  Created by Yoon on 2018. 9. 15..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit
import StoryboardViewController

class ExampleViewController: UIViewController, Storyboardable {
    struct IntentType {
        let userName: String
        let userID: Int
    }
    
    @IBOutlet private weak var titleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleButton.setTitle("\(intent.userName), \(intent.userID)", for: .normal)
    }
    
    @IBAction private func dismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
