#
# Be sure to run `pod lib lint HPThemeKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HPThemeKit'
  s.version          = '0.0.4'
  s.summary          = '主题切换小功能'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
基于DKNightVersion思路和大部分源码实现的主题切换功能 api来自QQ主题
                       DESC

  s.homepage         = 'https://github.com/hapiii/HPThemeKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hapiii' => '869932084@qq.com' }
  s.source           = { :git => 'https://github.com/hapiii/HPThemeKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'HPThemeKit/Classes/**/*'
  
  s.resource_bundles = {
     'HPThemeKit' => ['HPThemeKit/Assets/*.{png,plist}','HPThemeKit/Assets/ThemeImage/*.{png,plist}']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'DKNightVersion'
    s.dependency 'SSZipArchive'
    
end
