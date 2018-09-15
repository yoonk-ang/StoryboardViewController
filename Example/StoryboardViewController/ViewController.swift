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
        present(Example1ViewController.create(), animated: true, completion: nil)
    }
    
    @IBAction private func showExample2(_ sender: UIButton) {
        present(Example2ViewController.create(parameter: "Custom Title"), animated: true, completion: nil)
    }
}

