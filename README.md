# StoryboardViewController

[![CI Status](https://img.shields.io/travis/Yoon/StoryboardViewController.svg?style=flat)](https://travis-ci.org/Yoon/StoryboardViewController)
[![Version](https://img.shields.io/cocoapods/v/StoryboardViewController.svg?style=flat)](https://cocoapods.org/pods/StoryboardViewController)
[![License](https://img.shields.io/cocoapods/l/StoryboardViewController.svg?style=flat)](https://cocoapods.org/pods/StoryboardViewController)
[![Platform](https://img.shields.io/cocoapods/p/StoryboardViewController.svg?style=flat)](https://cocoapods.org/pods/StoryboardViewController)

## Example

Simply make view controllers conform Storyboardable, then you will have 2 things to be done in the protocol.

```swift
class ProfileViewController: UIViewController, Storyboardable {
    static let storyboardName = "Example"
    typealias InitialParameterType = (userName: String, userID: Int)
...
```

Then you can create the view controllers with parameters like below.

```swift
    ...
    let profileViewController = ProfileViewController.create(initialParameter: (userName: "John", userID: 1001)) 
    ...
```

You can load the view controllers from storyboards by setting the storyboardName static variable in the code and setting them initial view controllers in the storyboards, or setting the storyboard IDs same as the class names.

## Installation

StoryboardViewController is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'StoryboardViewController'
```

## Author

Yoon, razahel@gmail.com

## License

StoryboardViewController is available under the MIT license. See the LICENSE file for more info.
