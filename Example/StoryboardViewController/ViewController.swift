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
        Example1ViewController.create(initialParameter: (userName: "John", userID: 1001))
        present(Example1ViewController.create(initialParameter: ), animated: true, completion: nil)
    }
    
    @IBAction private func showExample2(_ sender: UIButton) {
        present(Example2ViewController.create(initialParameter: "Custom Title"), animated: true, completion: nil)
    }
}

