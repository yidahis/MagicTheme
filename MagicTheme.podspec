#
# Be sure to run `pod lib lint MagicTheme.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MagicTheme'
  s.version          = '0.1.0'
  s.summary          = 'Swift 实现的高效主题切换框架'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/yidahis@gmail.com/MagicTheme'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yidahis@gmail.com' => 'yidahis@gmail.com' }
  s.source           = { :git => 'https://github.com/yidahis@gmail.com/MagicTheme.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  
#  s.pod_target_xcconfig = { 'SWIFT_OBJC_BRIDGING_HEADER' => 'MagicTheme-Bridging-Header.h' }

  s.source_files = 'MagicTheme/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MagicTheme' => ['MagicTheme/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
