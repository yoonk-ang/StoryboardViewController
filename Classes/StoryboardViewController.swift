//
//  StoryboardProtocols.swift
//  Test
//
//  Created by Yoon on 2018. 6. 17..
//  Copyright © 2018년 Yoon. All rights reserved.
//

import UIKit

public protocol StoryboardInfoProvidable where Self: UIViewController {
    associatedtype CreateParameter
    static var storyboardName: String { get }

    /**
     It is ready with parameters
     */
    func ready()
}

public protocol StoryboardInstantiable where Self: UIViewController {
}

extension UIViewController: StoryboardInstantiable {
}

private var ParameterHandle: Void?

public extension StoryboardInstantiable where Self: StoryboardInfoProvidable {
    private(set) var parameter: CreateParameter {
        set {
            guard objc_getAssociatedObject(self, &ParameterHandle) as? CreateParameter == nil else {
                return
            }
            
            objc_setAssociatedObject(self, &ParameterHandle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &ParameterHandle) as! CreateParameter
        }
    }
    
    static func create(parameter: CreateParameter) -> Self! {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        
        var viewController = storyboard.instantiateInitialViewController() as? Self
                                ?? storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? Self
        viewController?.parameter = parameter
        viewController?.ready()
        
        return viewController
    }
    
    func ready() {}
}

public extension StoryboardInstantiable where Self: StoryboardInfoProvidable, Self.CreateParameter == Void {
    static func create() -> Self {
        return Self.create(parameter: ())
    }
}

