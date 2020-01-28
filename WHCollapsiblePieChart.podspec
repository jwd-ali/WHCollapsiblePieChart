#
# Be sure to run `pod lib lint WHCollapsiblePieChart.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WHCollapsiblePieChart'
  s.version          = '0.1.0'
  s.summary          = 'WHCollapsiblePieChart is a kind of hollow Pie chart which can be creat using few lines of code.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  'WHCollapsiblePieChart is an awesome pod for making center hollow pie chart with just wrinting few lines of code.'
  DESC
  

  s.homepage         = 'https://github.com/wajahathassan64/WHCollapsiblePieChart'
  s.screenshots     = 'https://png.pngtree.com/png-vector/20190118/ourmid/pngtree-vector-pie-chart-icon-png-image_327562.jpg', 'https://png.pngtree.com/png-vector/20190118/ourmid/pngtree-vector-pie-chart-icon-png-image_327562.jpg'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wajahathassan64' => 'wajahathassan64@gmail.com' }
  s.source           = { :git => 'https://github.com/wajahathassan64/WHCollapsiblePieChart.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.4'

  s.source_files = 'WHCollapsiblePieChart/**/*'
  s.swift_version = '5.0'
  s.platforms = {
      "ios": "11.4"
  }
end
