//
//  StoryboardViewController.swift
//  Test
//
//  Created by Yoon on 2018. 6. 17..
//  Copyright © 2018년 Yoon. All rights reserved.
//

import UIKit

public protocol Storyboardable where Self: UIViewController {
    associatedtype IntentType
    static var storyboardName: String { get }

    func intentDidSet()
}

public extension Storyboardable {
    static var storyboardName: String {
        var viewControllerName = String(describing: self)
        if let range = viewControllerName.range(of: "ViewController") {
            viewControllerName.removeSubrange(range)
        }
        return viewControllerName
    }
}

public protocol StoryboardInitializable {}

public extension StoryboardInitializable where Self: Storyboardable {
    static func create(intent: IntentType) -> Self! {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        
        var viewController = storyboard.instantiateInitialViewController() as? Self
            ?? storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? Self
        viewController?.intent = intent
        
        return viewController
    }

    private(set) var intent: IntentType {
        set {
            guard objc_getAssociatedObject(self, &AssociatedKeys.initialParameterKey) as? IntentType == nil else {
                return
            }
            
            objc_setAssociatedObject(self, &AssociatedKeys.initialParameterKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            intentDidSet()
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.initialParameterKey) as! IntentType
        }
    }
    
    func intentDidSet() {}
}

public extension StoryboardInitializable where Self: Storyboardable, Self.IntentType == Void {
    static func create() -> Self {
        return Self.create(intent: ())
    }
}

extension UIViewController: StoryboardInitializable {
    fileprivate struct AssociatedKeys {
        static var initialParameterKey = "initialParameterKey"
    }
}
