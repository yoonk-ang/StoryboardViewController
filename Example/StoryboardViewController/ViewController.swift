//
//  ViewController.swift
//  StoryboardViewController
//
//  Created by Yoon on 09/15/2018.
//  Copyright (c) 2018 Yoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction private func showExample1(_ sender: UIButton) {
        present(ExampleViewController.create(intent: .init(userName: "John", userID: 1001)), animated: true, completion: nil)
    }
}

