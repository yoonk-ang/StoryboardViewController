//
//  ExampleViewController.swift
//  StoryboardViewController_Example
//
//  Created by Yoon on 2018. 9. 15..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit
import StoryboardViewController

class Example1ViewController: UIViewController {
    @IBAction private func dismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension Example1ViewController: StoryboardInfoProvidable {
    static let storyboardName = "Main"
    typealias CreateParameter = Void
}