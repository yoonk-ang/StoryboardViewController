#
# Be sure to run `pod lib lint StoryboardViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StoryboardViewController'
  s.version          = '0.1.3'
  s.summary          = 'It enables UIViewControllers to be initialized with parameters even though the are defined in storyboards'
  s.description      = 'With Storyboardable and StoryboardInstantiable, you can enable UIViewControllers to be initialized with parameters even though the are defined in storyboards. Just make UIViewControllers to conform Storyboardable and do what the compiler says. Then you will see create methods from the UIViewControllers.'
  s.homepage         = 'https://github.com/yoonk-ang/StoryboardViewController'
  s.license = 'MIT'
  s.author           = { 'Yoon' => 'razahel@gmail.com' }
  s.source           = { :git => 'https://github.com/yoonk-ang/StoryboardViewController.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.0'
  s.source_files = 'Classes/**/*'
end
