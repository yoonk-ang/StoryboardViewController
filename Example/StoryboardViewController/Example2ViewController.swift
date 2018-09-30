//
//  Example2ViewController.swift
//  StoryboardViewController_Example
//
//  Created by Yoon on 2018. 9. 15..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit
import StoryboardViewController

class Example2ViewController: UIViewController, Storyboardable {
    static let storyboardName = "Main"
    typealias CreateParameter = String

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = parameter
    }
    
    @IBAction private func dismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
