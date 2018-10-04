//
//  StoryboardViewController.swift
//  Test
//
//  Created by Yoon on 2018. 6. 17..
//  Copyright © 2018년 Yoon. All rights reserved.
//

import UIKit

public protocol Storyboardable where Self: UIViewController {
    associatedtype InitialParameterType
    static var storyboardName: String { get }

    func initialParameterDidSet()
}

public protocol StoryboardInitializable {}

public extension StoryboardInitializable where Self: Storyboardable {
    static func create(initialParameter: InitialParameterType) -> Self! {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        
        var viewController = storyboard.instantiateInitialViewController() as? Self
            ?? storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? Self
        viewController?.initialParameter = initialParameter
        
        return viewController
    }

    private(set) var initialParameter: InitialParameterType {
        set {
            guard objc_getAssociatedObject(self, &AssociatedKeys.initialParameterKey) as? InitialParameterType == nil else {
                return
            }
            
            objc_setAssociatedObject(self, &AssociatedKeys.initialParameterKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            initialParameterDidSet()
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.initialParameterKey) as! InitialParameterType
        }
    }
    
    func initialParameterDidSet() {}
}

public extension StoryboardInitializable where Self: Storyboardable, Self.InitialParameterType == Void {
    static func create() -> Self {
        return Self.create(initialParameter: ())
    }
}

extension UIViewController: StoryboardInitializable {
    fileprivate struct AssociatedKeys {
        static var initialParameterKey = "initialParameterKey"
    }
}
